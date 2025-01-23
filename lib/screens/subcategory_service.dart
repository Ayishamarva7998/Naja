import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:naja/model/sub_category_model.dart';

const String baseUrl = 'https://naja.qnltest.xyz/api/';

class SubcategoryService {
  static Future<List<Category>?> fetchAllCategories() async {
    final String url = '${baseUrl}category/web';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == true) {
          return (jsonResponse['data'] as List)
              .map((categoryJson) => Category.fromJson(categoryJson))
              .toList();
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

  static Future<List<Subcategory>?> fetchChildCategories(int parentId) async {
    final String url = '${baseUrl}category/web/$parentId';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == true) {
          return (jsonResponse['data'] as List)
              .map((subcategoryJson) => Subcategory.fromJson(subcategoryJson))
              .toList();
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

  static fetchSubSubcategories(int subcategoryId) {}
}
