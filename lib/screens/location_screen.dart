import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:naja/service/location/location_service.dart';


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
        body: LocationScreen(),
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
  final LatLng _initialPosition = const LatLng(25.276987, 55.296249);
  String address = 'Loading...';

  @override
  void initState() {
    super.initState();
    _getAddress();
  }

  // Fetch address using the LocationApiService
  Future<void> _getAddress() async {
    try {
      LocationApiService locationApiService = LocationApiService();
      final addressResult = await locationApiService.getAddress(
        _initialPosition.latitude,
        _initialPosition.longitude,
      );
      setState(() {
        address = addressResult;
      });
    } catch (e) {
      setState(() {
        address = 'Error fetching address';
      });
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
            decoration: InputDecoration(
              hintText: 'Search location',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: const Color.fromARGB(255, 248, 247, 247),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 241, 238, 238),
                    width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                    color: const Color.fromARGB(255, 241, 238, 238),
                    width: 1.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              Icon(
                Icons.my_location,
                color: Color.fromARGB(255, 16, 16, 192),
              ),
              SizedBox(width: 8),
              Text(
                'Current Location',
                style: TextStyle(
                  color: Color.fromARGB(255, 16, 16, 192),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMapSection() {
    return Expanded(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/locationbg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 15,
            ),
            onMapCreated: (controller) {
              _controller = controller;
            },
            markers: {
              Marker(
                markerId: const MarkerId('currentLocation'),
                position: _initialPosition,
              ),
            },
          ),
          Positioned(
            bottom: 5,
            left: 20,
            right: 20,
            child: Container(
              height: 50,
              width: 330,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 230),
                    child: Text(
                      address,
                      style:
                          const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35,
            left: MediaQuery.of(context).size.width * 0.45,
            child: const Icon(
              Icons.location_on,
              size: 40,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 45,
        width: 350,
        child: const Center(
          child: Text(
            'Confirm Location',
            style: TextStyle(color: Colors.white),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 16, 16, 192),
        ),
      ),
    );
  }
}
