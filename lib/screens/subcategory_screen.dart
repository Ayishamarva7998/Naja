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
import 'package:naja/screens/subcategory_service.dart';

class SubcategoryScreen extends StatefulWidget {
  @override
  _SubcategoryScreenState createState() => _SubcategoryScreenState();
}

class _SubcategoryScreenState extends State<SubcategoryScreen> {
  List<Map<String, dynamic>>? categories;
  int? expandedCategoryId; // Track the currently expanded category ID
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
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset('assets/arrowback.png', height: 20),
        ),
        actions: [
          Image.asset('assets/search (1).png', height: 30),
        ],
        title: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: const 
          Text(
            'Meat chicken & Fish',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : categories != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
               
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: categories!.map((category) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                expandedCategoryId =
                                    expandedCategoryId == category['id']
                                        ? null
                                        : category['id']; 
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                category['name'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: expandedCategoryId == category['id']
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: expandedCategoryId == category['id']
                                      ? Colors.black
                                      : const Color.fromARGB(255, 62, 61, 61),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                   
                    if (expandedCategoryId != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: (categories!
                                    .firstWhere((category) =>
                                        category['id'] == expandedCategoryId)[
                                'subcategories'] as List<dynamic>)
                                .map((subcategory) {
                              return GestureDetector(
                                onTap: () {
                                  print('Tapped on ${subcategory['name']}');
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Text(
                                    subcategory['name'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                  ],
                )
              : Center(child: Text('No categories found!')),
    );
  }
}
