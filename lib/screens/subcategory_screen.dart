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
import 'package:naja/model/sub_category_model.dart';
import 'package:naja/screens/subcategory_service.dart';

class SubcategoryScreen extends StatefulWidget {
  @override
  _SubcategoryScreenState createState() => _SubcategoryScreenState();
}

class _SubcategoryScreenState extends State<SubcategoryScreen> {
  List<Category>? categories;
  bool isLoading = true;
  bool isChildLoading = false;
  List<Subcategory>? childSubcategories;
  int? expandedSubcategoryId;

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  // Fetch categories from API
  Future<void> fetchCategories() async {
    try {
      final data = await SubcategoryService.fetchAllCategories();
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

  // Fetch child categories when a subcategory is clicked
  Future<void> fetchChildSubcategories(int subcategoryId) async {
    setState(() {
      isChildLoading = true;
      expandedSubcategoryId = subcategoryId;
    });

    try {
      final data = await SubcategoryService.fetchChildCategories(subcategoryId);
      setState(() {
        childSubcategories = data;
        isChildLoading = false;
      });
    } catch (error) {
      setState(() {
        isChildLoading = false;
      });
      print('Error fetching child subcategories: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset('assets/arrowback.png', height: 20),
        ),
        actions: [
          Image.asset('assets/search (1).png', height: 30),
        ],
        title: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: const Text(
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
                        children: categories!
                            .expand((category) => category.subcategories)
                            .map((subcategory) {
                          return GestureDetector(
                            onTap: () {
                              fetchChildSubcategories(subcategory.id);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                '${subcategory.name} (ID: ${subcategory.id})',
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    if (expandedSubcategoryId != null && isChildLoading)
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    if (expandedSubcategoryId != null && childSubcategories != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: childSubcategories!
                                .map((childSubcategory) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      '${childSubcategory.name} (ID: ${childSubcategory.id})',
                                      style: TextStyle(fontSize: 14, color: Colors.black),
                                    ),
                                  );
                                })
                                .toList(),
                          ),
                        ),
                      ),
                     
                  ],
                )
              : Center(child: Text('No categories found!')),
    );
  }
}
