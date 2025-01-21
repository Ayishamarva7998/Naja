import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:naja/service/location/location_service.dart';


class LocationProvider extends ChangeNotifier {
  LatLng? _currentLocation;
  String _errorMessage = '';
  GoogleMapController? _mapController;
  final TextEditingController _searchController = TextEditingController();
  final LocationService _locationService = LocationService();

  LatLng? get currentLocation => _currentLocation;
  String get errorMessage => _errorMessage;
  TextEditingController get searchController => _searchController;

  void initializeLocation() {
    fetchCurrentLocation();
  }

  Future<void> fetchCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _errorMessage = 'Location services are disabled.';
        notifyListeners();
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _errorMessage = 'Location permissions are denied.';
          notifyListeners();
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        _errorMessage = 'Location permissions are permanently denied.';
        notifyListeners();
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      _currentLocation = LatLng(position.latitude, position.longitude);
      String address = await _locationService.getAddress(
        position.latitude,
        position.longitude,
      );

      log("Current Address: $address");
      _errorMessage = '';
      notifyListeners();

      _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(_currentLocation!, 15),
      );
    } catch (e) {
      _errorMessage = 'Error fetching location: $e';
      notifyListeners();
    }
  }

  Future<void> searchLocation(String query) async {
    _errorMessage = 'Search functionality is not implemented yet.';
    notifyListeners();
  }

  void setMapController(GoogleMapController controller) {
    _mapController = controller;
  }
}