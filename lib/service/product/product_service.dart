// import 'dart:convert';

// import 'package:naja/model/products_model.dart';
// import 'package:http/http.dart' as http;

// class ProductService {
//   static const String _baseUrl = 'https://naja.qnltest.xyz/api/product/web?city=2&category=71';

//   static Future<List<Product>> fetchProducts() async {
//     try {
//       final response = await http.get(Uri.parse(_baseUrl));

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         final List<dynamic> results = data['data']['results'];

//         return results.map((product) => Product.fromJson(product)).toList();
//       } else {
//         throw Exception('Failed to load products. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error fetching products: $e');
//     }
//   }
// }



// Product Service
import 'dart:convert';

import 'package:naja/model/products_model.dart';
import 'package:http/http.dart'as http;

class ProductService {
  static const String _baseUrl = 'https://naja.qnltest.xyz/api/product/web';

  static Future<List<Product>> fetchProducts(int cityId) async {
    final String url = '$_baseUrl?city=$cityId';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> results = data['data']['results'];

        return results.map((product) => Product.fromJson(product)).toList();
      } else {
        throw Exception('Failed to load products. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }
}