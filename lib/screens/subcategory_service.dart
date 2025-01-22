import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://naja.qnltest.xyz/api/';

class CategoryService {
 
  static Future<List<Map<String, dynamic>>?> fetchAllCategories() async {
    final String url = '${baseUrl}category/web';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == true) {
          return List<Map<String, dynamic>>.from(jsonResponse['data']);
        } else {
          throw Exception('Failed to fetch categories: ${jsonResponse['message']}');
        }
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }


  static Future<List<Map<String, dynamic>>?> fetchChildCategories(int parentId) async {
    final String url = '${baseUrl}category/web/$parentId'; 
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == true) {
          return List<Map<String, dynamic>>.from(jsonResponse['data']);
        } else {
          throw Exception('Failed to fetch child categories: ${jsonResponse['message']}');
        }
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
