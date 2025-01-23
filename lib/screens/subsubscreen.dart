// // // import 'package:flutter/material.dart';
// // // import 'package:naja/model/sub_category_model.dart';
// // // import 'package:naja/screens/subcategory_service.dart';

// // // class SubsubcategoryScreen extends StatefulWidget {
// // //   @override
// // //   _SubsubcategoryScreenState createState() => _SubsubcategoryScreenState();
// // // }

// // // class _SubsubcategoryScreenState extends State<SubsubcategoryScreen> {
// // //   List<Category>? categories;
// // //   int? expandedCategoryId;
// // //   int? expandedSubcategoryId;
// // //   bool isLoading = true;
// // //   bool isSubcategoryLoading = false;
// // //   bool isSubSubcategoryLoading = false;
// // //   List<Subcategory>? subSubcategories;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     fetchCategories();
// // //   }

// // //   // Fetch categories from the API
// // //   Future<void> fetchCategories() async {
// // //     try {
// // //       final data = await SubcategoryService.fetchAllCategories();
// // //       setState(() {
// // //         categories = data;
// // //         isLoading = false;
// // //       });
// // //     } catch (error) {
// // //       setState(() {
// // //         isLoading = false;
// // //       });
// // //       print('Error fetching categories: $error');
// // //     }
// // //   }

// // //   // Fetch sub-subcategories from the API
// // //   Future<void> fetchSubSubcategories(int subcategoryId) async {
// // //     setState(() {
// // //       isSubSubcategoryLoading = true;
// // //     });
// // //     try {
// // //       final data = await SubcategoryService.fetchSubSubcategories(subcategoryId);
// // //       setState(() {
// // //         subSubcategories = data;
// // //         isSubSubcategoryLoading = false;
// // //       });
// // //     } catch (error) {
// // //       setState(() {
// // //         isSubSubcategoryLoading = false;
// // //       });
// // //       print('Error fetching sub-subcategories: $error');
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         leading: IconButton(
// // //           onPressed: () {
// // //             Navigator.pop(context);
// // //           },
// // //           icon: Image.asset('assets/arrowback.png', height: 20),
// // //         ),
// // //         actions: [
// // //           Image.asset('assets/search (1).png', height: 30),
// // //         ],
// // //         title: Padding(
// // //           padding: const EdgeInsets.only(left: 60),
// // //           child: const Text(
// // //             'Meat chicken & Fish',
// // //             style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
// // //           ),
// // //         ),
// // //       ),
// // //       body: isLoading
// // //           ? Center(child: CircularProgressIndicator())
// // //           : categories != null
// // //               ? Column(
// // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                   children: [
// // //                     // Categories and Subcategories display
// // //                     SingleChildScrollView(
// // //                       scrollDirection: Axis.horizontal,
// // //                       child: Row(
// // //                         children: categories!
// // //                             .expand((category) => category.subcategories)
// // //                             .map((subcategory) {
// // //                           return GestureDetector(
// // //                             onTap: () {
// // //                               setState(() {
// // //                                 expandedSubcategoryId = subcategory.id;
// // //                               });
// // //                               fetchSubSubcategories(subcategory.id);  // Fetch sub-subcategories when subcategory is tapped
// // //                             },
// // //                             child: Padding(
// // //                               padding: const EdgeInsets.symmetric(horizontal: 8.0),
// // //                               child: Text(
// // //                                 '${subcategory.name} (ID: ${subcategory.id})',
// // //                                 style: TextStyle(
// // //                                   fontSize: 16,
// // //                                   color: Colors.black,
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                           );
// // //                         }).toList(),
// // //                       ),
// // //                     ),
// // //                     if (expandedSubcategoryId != null)
// // //                       Padding(
// // //                         padding: const EdgeInsets.only(top: 16.0),
// // //                         child: SingleChildScrollView(
// // //                           scrollDirection: Axis.horizontal,
// // //                           child: Row(
// // //                             children: isSubSubcategoryLoading
// // //                                 ? [CircularProgressIndicator()]
// // //                                 : subSubcategories != null
// // //                                     ? subSubcategories!
// // //                                         .map((subSubcategory) {
// // //                                           return GestureDetector(
// // //                                             onTap: () {
// // //                                               print('Tapped on ${subSubcategory.name}');
// // //                                             },
// // //                                             child: Padding(
// // //                                               padding: const EdgeInsets.symmetric(horizontal: 8.0),
// // //                                               child: Text(
// // //                                                 '${subSubcategory.name} (ID: ${subSubcategory.id})',
// // //                                                 style: TextStyle(
// // //                                                   fontSize: 14,
// // //                                                   color: Colors.black,
// // //                                                 ),
// // //                                               ),
// // //                                             ),
// // //                                           );
// // //                                         }).toList()
// // //                                     : [Text('No sub-subcategories available')],
// // //                           ),
// // //                         ),
// // //                       ),
// // //                   ],
// // //                 )
// // //               : Center(child: Text('No categories found!')),
// // //     );
// // //   }
// // // }


// import 'package:flutter/material.dart';
// import 'package:naja/model/sub_category_model.dart';
// import 'package:naja/screens/subcategory_service.dart';

// class SubsubcategoryScreen extends StatefulWidget {
//   @override
//   _SubsubcategoryScreenState createState() => _SubsubcategoryScreenState();
// }

// class _SubsubcategoryScreenState extends State<SubsubcategoryScreen> {
//   List<Category>? categories;
//   int? expandedCategoryId;
//   int? expandedSubcategoryId;
//   bool isLoading = true;
//   bool isSubcategoryLoading = false;
//   bool isSubSubcategoryLoading = false;
//   List<Subcategory>? subSubcategories;

//   @override
//   void initState() {
//     super.initState();
//     fetchCategories();
//   }

//   // Fetch categories from the API
//   Future<void> fetchCategories() async {
//     try {
//       final data = await SubcategoryService.fetchAllCategories();
//       setState(() {
//         categories = data;
//         isLoading = false;
//       });
//     } catch (error) {
//       setState(() {
//         isLoading = false;
//       });
//       print('Error fetching categories: $error');
//     }
//   }

  
//   Future<void> fetchSubSubcategories(int subcategoryId) async {
//     setState(() {
//       isSubSubcategoryLoading = true;
//     });
//     try {
//       final data = await SubcategoryService.fetchSubSubcategories(subcategoryId);
//       if (data == null || data.isEmpty) {
//         print("No sub-subcategories returned for ID: $subcategoryId");
//       }
//       setState(() {
//         subSubcategories = data;
//         isSubSubcategoryLoading = false;
//       });
//     } catch (error) {
//       setState(() {
//         isSubSubcategoryLoading = false;
//       });
//       print('Error fetching sub-subcategories: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Image.asset('assets/arrowback.png', height: 20),
//         ),
//         actions: [
//           Image.asset('assets/search (1).png', height: 30),
//         ],
//         title: Padding(
//           padding: const EdgeInsets.only(left: 60),
//           child: const Text(
//             'Meat chicken & Fish',
//             style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
//           ),
//         ),
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : categories != null
//               ? Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Categories and Subcategories display
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: categories!
//                             .expand((category) => category.subcategories)
//                             .map((subcategory) {
//                           return GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 expandedSubcategoryId = subcategory.id;
//                               });
//                               fetchSubSubcategories(subcategory.id);  // Fetch sub-subcategories when subcategory is tapped
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                               child: Text(
//                                 '${subcategory.name} (ID: ${subcategory.id})',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                     if (expandedSubcategoryId != null)
//                       Padding(
//                         padding: const EdgeInsets.only(top: 16.0),
//                         child: SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: Row(
//                             children: isSubSubcategoryLoading
//                                 ? [CircularProgressIndicator()]
//                                 : subSubcategories != null
//                                     ? subSubcategories!
//                                         .map((subSubcategory) {
//                                           return GestureDetector(
//                                             onTap: () {
//                                               print('Tapped on ${subSubcategory.name}');
//                                             },
//                                             child: Padding(
//                                               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                                               child: Text(
//                                                 '${subSubcategory.name} (ID: ${subSubcategory.id})',
//                                                 style: TextStyle(
//                                                   fontSize: 14,
//                                                   color: Colors.black,
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         }).toList()
//                                     : [Text('No sub-subcategories available')],
//                           ),
//                         ),
//                       ),
//                   ],
//                 )
//               : Center(child: Text('No categories found!')),
//     );
//   }
// }

// // 

import 'package:flutter/material.dart';
import 'package:naja/screens/subsubservice.dart';

class SubsubcategoryScreen extends StatefulWidget {
  @override
  _SubsubcategoryScreenState createState() => _SubsubcategoryScreenState();
}

class _SubsubcategoryScreenState extends State<SubsubcategoryScreen> {
  List<Category>? categories;
  int? expandedSubcategoryId;
  bool isLoading = true;
  bool isChildCategoryLoading = false;
  List<Subcategory> childCategories = [];

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

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

  Future<void> fetchChildCategories(int subcategoryId) async {
    setState(() {
      isChildCategoryLoading = true;
      childCategories = [];
      expandedSubcategoryId = subcategoryId;
    });
    
    try {
      final data = await SubcategoryService.fetchChildCategories(subcategoryId);
      setState(() {
        childCategories = data;
        isChildCategoryLoading = false;
      });
    } catch (error) {
      setState(() {
        isChildCategoryLoading = false;
      });
      print('Error fetching child categories: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: categories?.expand((category) => category.subcategories).map((subcategory) {
                          return GestureDetector(
                            onTap: () => fetchChildCategories(subcategory.id),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                '${subcategory.name} (ID: ${subcategory.id})',
                                style: TextStyle(
                                  color: expandedSubcategoryId == subcategory.id 
                                    ? Colors.blue 
                                    : Colors.black,
                                ),
                              ),
                            ),
                          );
                        }).toList() ?? [],
                  ),
                ),
                if (isChildCategoryLoading)
                  Center(child: CircularProgressIndicator())
                else if (childCategories.isNotEmpty)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: childCategories.map((childCategory) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('${childCategory.name} (ID: ${childCategory.id})'),
                        );
                      }).toList(),
                    ),
                  )
                else
                  Center(child: Text('No child categories found')),
              ],
            ),
    );
  }
}

class Category {
  final int id;
  final String name;
  final List<Subcategory> subcategories;

  Category({required this.id, required this.name, required this.subcategories});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      subcategories: (json['subcategories'] as List)
          .map((subcategory) => Subcategory.fromJson(subcategory))
          .toList(),
    );
  }
}

class Subcategory {
  final int id;
  final String name;
  final List<Subcategory> childSubcategories;

  Subcategory({
    required this.id, 
    required this.name, 
    this.childSubcategories = const []
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      id: json['id'],
      name: json['name'],
      childSubcategories: json['subcategories'] != null
          ? (json['subcategories'] as List)
              .map((subcategory) => Subcategory.fromJson(subcategory))
              .toList()
          : [],
    );
  }
}