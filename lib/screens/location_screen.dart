
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:naja/controller/location_controller.dart';

import 'package:provider/provider.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LocationProvider>(context, listen: false).initializeLocation();
    });

    return Scaffold(
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
      body: Consumer<LocationProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSearchSection(provider),
                _buildMapSection(provider),
                _buildBottomSection(provider),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchSection(LocationProvider provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 45,
            child: TextField(
              controller: provider.searchController,
              decoration: InputDecoration(
                hintText: 'Search location',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: const Color.fromARGB(255, 248, 247, 247),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 243, 242, 242),
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 223, 221, 221),
                  ),
                ),
              ),
              onSubmitted: (query) {
                provider.searchLocation(query);
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.location_disabled_rounded,
                color: Color.fromARGB(255, 29, 26, 199),
              ),
              const SizedBox(width: 10),
              const Text('Current Location'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMapSection(LocationProvider provider) {
    final location = provider.currentLocation;

    return SizedBox(
      height: 550,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: location ?? const LatLng(0, 0),
          zoom: location != null ? 15 : 2,
        ),
        onMapCreated: (controller) {
          provider.setMapController(controller);
        },
        markers: location != null
            ? {
                Marker(
                  markerId: const MarkerId('currentLocation'),
                  position: location,
                ),
              }
            : {},
      ),
    );
  }

  Widget _buildBottomSection(LocationProvider provider) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 16, 16, 192),
        ),
        child: Center(
          child: Text(
            provider.errorMessage.isNotEmpty
                ? provider.errorMessage
                : 'Confirm Location',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
