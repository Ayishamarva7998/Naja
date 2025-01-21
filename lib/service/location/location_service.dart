// import 'dart:developer';
// import 'package:dio/dio.dart';

// class LocationApiService {
//   String errorMessage = '';
//   final Dio dio = Dio(
//     BaseOptions(
//       baseUrl: 'https://maps.googleapis.com/maps/api/geocode/',  
//       connectTimeout: const Duration(milliseconds: 5000),
//       receiveTimeout: const Duration(milliseconds: 10000),
//     ),
//   );

//   Future<String> getAddress(double latitude, double longitude) async {
//     try {
//       final String apiKey = 'AIzaSyDlsVI3xGp6G1CQwVJz-_bZueFysMHOrnI';  // Google Maps API Key
//       final String endpoint = 'json?latlng=$latitude,$longitude&key=$apiKey';  // Full endpoint with query parameters

//       final response = await dio.get(endpoint);

//       log("Response Status Code: ${response.statusCode}");
//       log("Response Body: ${response.data}");

//       if (response.statusCode == 200) {
//         if (response.data['results'].isNotEmpty) {
//           return response.data['results'][0]['formatted_address'];
//         } else {
//           return 'No address found';
//         }
//       } else {
//         throw Exception("Request failed with status: ${response.statusCode}");
//       }
//     } on DioException catch (e) {
//       if (e.response != null) {
//         errorMessage = "DioError Response: ${e.response?.data}";
//         throw errorMessage = ("API error: ${e.response?.data}");
//       } else {
//         errorMessage = "DioError Message: ${e.message}";
//         throw errorMessage = "Connection error: ${e.message}";
//       }
//     } catch (e) {
//       log("General Error: $e");
//       throw errorMessage = "An unexpected error occurred.";
//     }
//   }
// }


import 'dart:developer';

import 'package:dio/dio.dart';

class LocationService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://maps.googleapis.com/maps/api/geocode/',
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 10000),
    ),
  );

  Future<String> getAddress(double latitude, double longitude) async {
    final String apiKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzM4NTc3MjkxLCJpYXQiOjE3MzY4NDkyOTEsImp0aSI6ImNhZjUwYzNjNjg1YjRiMzdhYzk4NjI3MzUzNWEwMThhIiwidXNlcl9pZCI6NTd9.anFHbEtPAPlcOIs_k-ebERcrgr7ezWN-NKgJRga_Lf4'; // Replace with your Google Maps API Key
    final String endpoint = 'json?latlng=$latitude,$longitude&key=$apiKey';

    try {
      final response = await dio.get(endpoint);
      if (response.statusCode == 200 && response.data['results'].isNotEmpty) {
        return response.data['results'][0]['formatted_address'];
      }
      return 'No address found';
    } catch (e) {
      log("Error fetching address: $e");
      throw Exception('Error fetching address');
    }
  }
}
