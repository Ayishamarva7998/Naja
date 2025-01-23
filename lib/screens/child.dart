// import 'package:flutter/material.dart';
// import 'subcategory_service.dart';

// class ChildCategoryScreen extends StatefulWidget {
//   final int parentId;

//   ChildCategoryScreen({required this.parentId});

//   @override
//   _ChildCategoryScreenState createState() => _ChildCategoryScreenState();
// }

// class _ChildCategoryScreenState extends State<ChildCategoryScreen> {
//   List<Subcategory>? childCategories;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchChildCategories(widget.parentId);
//   }

//   Future<void> fetchChildCategories(int parentId) async {
//     try {
//       final data = await SubcategoryService.fetchChildCategories(parentId);
//       setState(() {
//         childCategories = data;
//         isLoading = false;
//       });
//     } catch (error) {
//       setState(() {
//         isLoading = false;
//       });
//       print('Error fetching child categories: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Child Categories'),
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : childCategories != null
//               ? ListView.builder(
//                   itemCount: childCategories!.length,
//                   itemBuilder: (context, index) {
//                     final category = childCategories![index];
//                     return ListTile(
//                       title: Text(category.name),
//                       onTap: () {
//                         // Handle subcategory selection
//                         print('Selected category ID: ${category.id}');
//                       },
//                     );
//                   },
//                 )
//               : Center(child: Text('No child categories found!')),
//     );
//   }
// }
