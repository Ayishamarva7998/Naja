// import 'dart:convert'; 
// import 'package:http/http.dart' as http; // For making HTTP requests

// // Base URL
// const String baseUrl = 'https://naja.qnltest.xyz/api/';

// // Function to fetch category data by ID
// Future<void> fetchCategoryData(int categoryId) async {
//   final String url = '${baseUrl}category/web';

//   try {
//     // Send GET request
//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       // Parse the JSON response
//       final jsonResponse = jsonDecode(response.body);

//       if (jsonResponse['status'] == true) {
//         final List<dynamic> categories = jsonResponse['data'];
        
//         // Find the category with the given ID
//         final category = categories.firstWhere(
//           (cat) => cat['id'] == categoryId,
//           orElse: () => null,
//         );

//         if (category != null) {
//           print('Category Data:');
//           print('ID: ${category['id']}');
//           print('Name: ${category['name']}');
//           print('Description: ${category['description']}');
//           print('Image: ${category['image']}');
//           print('Slug: ${category['slug']}');
//           print('Color Code: ${category['color_code']}');
//           print('Is Active: ${category['is_active']}');
//           print('Subcategories: ${category['subcategories']}');
//         } else {
//           print('Category with ID $categoryId not found.');
//         }
//       } else {
//         print('Failed to fetch categories: ${jsonResponse['message']}');
//       }
//     } else {
//       print('Error: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('An error occurred: $e');
//   }
// }

// void main() {
//   fetchCategoryData(46); // Call the function with category ID 46
// }


import 'package:flutter/material.dart';
import 'package:naja/screens/categorydetails.dart';
import 'package:naja/screens/subcategory_service.dart';

class HomeScreens extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreens> {
  List<Map<String, dynamic>>? categories;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      final data = await CategoryService.fetchAllCategories();
      setState(() {
        categories = data;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching categories: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : categories != null
              ? ListView.builder(
                  itemCount: categories!.length,
                  itemBuilder: (context, index) {
                    final category = categories![index];
                    return ListTile(
                      title: Text(category['name']),
                      subtitle: Text(category['description'] ?? "No description"),
                      onTap: () {
                        
                        final subcategories = category['subcategories'] ?? [];
                        if (subcategories.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChildCategoryScreen(
                                parentCategoryId: category['id'],
                                subcategories: subcategories,
                              ),
                            ),
                          );
                        } else {
                       
                          print('No child categories available');
                        }
                      },
                    );
                  },
                )
              : Center(child: Text('No categories found!')),
    );
  }
}
