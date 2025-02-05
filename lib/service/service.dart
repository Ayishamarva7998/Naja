import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:naja/model/profile_model.dart';

class ApiServices {
  String errorMessage = '';
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://naja.qnltest.xyz/api/',  
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 10000),
      headers: {'Authorization': 'Bearer ${'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzM4NTc3MjkxLCJpYXQiOjE3MzY4NDkyOTEsImp0aSI6ImNhZjUwYzNjNjg1YjRiMzdhYzk4NjI3MzUzNWEwMThhIiwidXNlcl9pZCI6NTd9.anFHbEtPAPlcOIs_k-ebERcrgr7ezWN-NKgJRga_Lf4'}'},
    ),
  );

  Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await dio.post(endpoint, data: body);

      log("Response Status Code: ${response.statusCode}");
      log("Response Body: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception("Request failed with status: ${response.statusCode}");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        errorMessage = "DioError Response: ${e.response?.data}";
        throw errorMessage = ("API error: ${e.response?.data}");
      } else {
        errorMessage = "DioError Message: ${e.message}";
        throw errorMessage = "Connection error: ${e.message}";
      }
    } catch (e) {
      log("General Error: $e");
      throw errorMessage = "An unexpected error occurred.";
    }
  }

  // Future<User?> getProduct(String endpoint) async {
  //   try {
  //     final response = await dio.get(endpoint);

  //     log("Response Status Code: ${response.statusCode}");
  //     log("Response Body: ${response.data}");

  //     if (response.statusCode == 200) {
  //       return User.fromJson(response.data);
  //     } else {
  //       throw errorMessage =
  //           ("Request failed with status: ${response.statusCode}");
  //     }
  //   } on DioException catch (e) {
  //     log("DioException: ${e.message}");
  //     if (e.response != null) {
  //       throw errorMessage = "API error: ${e.response?.data}";
  //     } else {
  //       throw errorMessage = "Connection error: ${e.message}";
  //     }
  //   } catch (e) {
  //     log("General Error: $e");
  //     throw Exception("An unexpected error occurred.");
  //   }
  }

  // Future<User?> getProductsByCategory(String endpoint) async {
  //   const String categoryUrl =
  //       "https://node-project-amber.vercel.app/products/category";
  //   try {
  //     final response = await dio.get(categoryUrl + endpoint);

  //     log("Response Status Code: ${response.statusCode}");
  //     log("Response Body: ${response.data}");

  //     if (response.statusCode == 200) {
  //       return User.fromJson(response.data);
  //     } else {
  //       throw errorMessage =
  //           ("Request failed with status: ${response.statusCode}");
  //     }
  //   } on DioException catch (e) {
  //     log("DioException: ${e.message}");
  //     if (e.response != null) {
  //       throw errorMessage = "API error: ${e.response?.data}";
  //     } else {
  //       throw errorMessage = "Connection error: ${e.message}";
  //     }
  //   }
  // }
// }