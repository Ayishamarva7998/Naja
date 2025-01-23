import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:naja/model/sub_category_model.dart';

const String baseUrl = 'https://naja.qnltest.xyz/api/';

class SubcategoryService {
  // Fetch all categories
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
        throw Exception('Failed to load categories with status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching categories: $error');
    }
  }

  // Fetch child categories for a specific subcategory
  static Future<List<Subcategory>> fetchChildCategories(int subcategoryId) async {
    final String url = '${baseUrl}category/web/$subcategoryId';

    try {
      final response = await http.get(Uri.parse(url));
      print('Full API Response Body: ${response.body}');
      print('Response Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        
        print('JSON Response Status: ${jsonResponse['status']}');
        print('JSON Response Data: ${jsonResponse['data']}');

        if (jsonResponse['status'] == true && jsonResponse['data'] != null) {
          final data = jsonResponse['data'];
          
          // Multiple parsing strategies
          if (data is List) {
            return data.map((item) => Subcategory.fromJson(item)).toList();
          }
          
          if (data is Map) {
            final subcategories = data['subcategories'] ?? 
                                   data['childSubcategories'] ?? 
                                   data['child_subcategories'] ?? [];
            
            if (subcategories is List) {
              return subcategories
                  .map((item) => Subcategory.fromJson(item))
                  .toList();
            }
          }

          // Fallback: parse entire data as Subcategory
          return [Subcategory.fromJson(data)];
        }
      }
      
      print('No child categories found for ID: $subcategoryId');
      return [];
    } catch (error) {
      print('Error fetching child categories: $error');
      return [];
    }
  }
}