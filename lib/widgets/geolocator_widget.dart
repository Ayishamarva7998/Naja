import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationWidget> {
  Position? position;
  String locationName = '';


  fetchposition() async {
    bool serviceEnabled;
    LocationPermission permission;

    
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print("Location service enabled: $serviceEnabled"); 

    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Location service is disabled');
      return;
    }

   
    permission = await Geolocator.checkPermission();
    print("Location permission: $permission"); 
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'You denied the permission');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: 'You denied the permission forever');
      return;
    }


    Position currentPosition = await Geolocator.getCurrentPosition();
    print("Current position: ${currentPosition.latitude}, ${currentPosition.longitude}");

    setState(() {
      position = currentPosition;
    });

   
    String address = await getAddress(currentPosition.latitude, currentPosition.longitude);
    print("Address fetched: $address"); 
    setState(() {
      locationName = address;
    });
  }

  
  Future<String> getAddress(double latitude, double longitude) async {
    const String apiKey = 'AIzaSyDlsVI3xGp6G1CQwVJz-_bZueFysMHOrnI';
    final String url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['results'].isNotEmpty) {
          return data['results'][0]['formatted_address'];
        } else {
          return 'No address found';
        }
      } else {
        return 'Error fetching address: ${response.statusCode}';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            position == null
                ? 'Location: Not available'
                : 'Location: ${position!.latitude}, ${position!.longitude}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          Text(
            locationName.isEmpty ? 'Address: Not available' : 'Address: $locationName',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              fetchposition();
            },
            child: const Text('Get Location and Address'),
          ),
        ],
      ),
    );
  }
}
