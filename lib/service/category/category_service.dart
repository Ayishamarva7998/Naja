import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:naja/model/category_model.dart';

class CategoryService {
  static const String baseUrl = 'https://naja.qnltest.xyz/api/';
  static const String endpoint = 'category/web';

  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl + endpoint),
        headers: {
          'Content-Type': 'application/json',  
        
        },
      );
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == true) {
          List<CategoryModel> categories = List<CategoryModel>.from(
            data['data'].map((x) => CategoryModel.fromJson(x))
          );
          return categories;
        } else {
          throw Exception('Server returned error: ${data['message']}');
        }
      } else {
        throw Exception('Failed to load categories. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }
}
