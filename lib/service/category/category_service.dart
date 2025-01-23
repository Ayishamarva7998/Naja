import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:naja/model/category_model.dart';

class CategoryService {
  static const String baseUrl = 'https://naja.qnltest.xyz/api/';
  static const String endpoint = 'category/web';

  /// Fetches the list of categories from the API.
  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl + endpoint),
        headers: {
          'Content-Type': 'application/json', // Set content type for API calls
        },
      );

      // Check the HTTP response status code
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Ensure 'status' is true before parsing the data
        if (data['status'] == true) {
          // Parse the 'data' field into a list of CategoryModel objects
          return List<CategoryModel>.from(
            data['data'].map((x) => CategoryModel.fromJson(x)),
          );
        } else {
          // Throw an exception if the server returns an error status
          throw Exception('Server error: ${data['message']}');
        }
      } else {
        // Handle unexpected HTTP status codes
        throw Exception(
          'Failed to load categories. HTTP Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      // Catch and rethrow any errors that occur during the request
      throw Exception('Failed to fetch categories: $e');
    }
  }
}
