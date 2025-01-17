import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class LocationUI extends StatelessWidget {
  const LocationUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Location',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: const LocationScreen(),
      ),
    );
  }
}

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late GoogleMapController _controller;
  LatLng? _currentPosition;
  String address = 'Fetching location...';
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchCurrentLocation();
  }

  Future<void> _fetchCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          address = 'Location services are disabled.';
        });
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            address = 'Location permissions are denied.';
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          address = 'Location permissions are permanently denied.';
        });
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
        address = 'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
      });

      _controller.animateCamera(
        CameraUpdate.newLatLngZoom(
          _currentPosition!,
          15,
        ),
      );
    } catch (e) {
      setState(() {
        address = 'Error fetching location: $e';
      });
    }
  }

  Future<void> _searchLocation(String query) async {
    if (query.isEmpty) return;

    final String apiKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzM4NTc3MjkxLCJpYXQiOjE3MzY4NDkyOTEsImp0aSI6ImNhZjUwYzNjNjg1YjRiMzdhYzk4NjI3MzUzNWEwMThhIiwidXNlcl9pZCI6NTd9.anFHbEtPAPlcOIs_k-ebERcrgr7ezWN-NKgJRga_Lf4'; // Replace with your API key
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$query&inputtype=textquery&fields=geometry&key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      final data = json.decode(response.body);

      if (data['candidates'].isNotEmpty) {
        final location = data['candidates'][0]['geometry']['location'];
        final LatLng searchedLocation = LatLng(location['lat'], location['lng']);

        setState(() {
          _currentPosition = searchedLocation;
        });

        _controller.animateCamera(
          CameraUpdate.newLatLngZoom(
            searchedLocation,
            15,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location not found')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error searching location: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSearchSection(),
        _buildMapSection(),
        _buildBottomSection(),
      ],
    );
  }

  Widget _buildSearchSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Search location',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: const Color.fromARGB(255, 248, 247, 247),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 241, 238, 238),
                  width: 1.0,
                ),
              ),
            ),
            onSubmitted: _searchLocation,
          ),
        ],
      ),
    );
  }

  Widget _buildMapSection() {
    return Expanded(
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _currentPosition ?? const LatLng(0, 0),
          zoom: 15,
        ),
        onMapCreated: (controller) {
          _controller = controller;
        },
        markers: _currentPosition != null
            ? {
                Marker(
                  markerId: const MarkerId('currentLocation'),
                  position: _currentPosition!,
                ),
              }
            : {},
      ),
    );
  }

  Widget _buildBottomSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 45,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 16, 16, 192),
        ),
        child: const Center(
          child: Text(
            'Confirm Location',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
