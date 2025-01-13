import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(LocationUI());
}

class LocationUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Location'),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ),
        body: LocationScreen(),
      ),
    );
  }
}

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late GoogleMapController _controller;
  final LatLng _initialPosition = LatLng(25.276987, 55.296249); // Example coordinates

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Location and Current Location UI (Above the Map)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 1.0), // Reduced vertical padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search location',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                    
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal:12 ,vertical: 12)
                ),
              ),
              const SizedBox(height: 6), // Reduced gap below the search bar
              // Current Location
              Row(
                children: [
                  Icon(Icons.my_location, color: Colors.blue),
                  const SizedBox(width: 8),
                  const Text(
                    'Current Location',
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Background Image and Google Map
        Expanded(
          child: Stack(
            children: [
              // Background Image
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/locationbg.png'), // Replace with your image
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Google Map
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
                    markerId: MarkerId('currentLocation'),
                    position: _initialPosition,
                  ),
                },
              ),

              // Bottom Overlay Container
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9), // Semi-transparent overlay
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 4, // Adjust based on text layout
                      mainAxisSpacing: 8,
                    ),
                    itemCount: 1, // Replace with dynamic count from API
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Icon(Icons.location_pin, color: Colors.red),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Confirm location', // Replace with API data
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
