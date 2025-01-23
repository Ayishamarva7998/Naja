import 'package:flutter/material.dart';
import 'package:naja/model/sub_category_model.dart';
import 'package:naja/screens/subcategory_service.dart';

class SubcategoryScreen extends StatefulWidget {
  @override
  _SubcategoryScreenState createState() => _SubcategoryScreenState();
}

class _SubcategoryScreenState extends State<SubcategoryScreen> {
  List<Subcategory>? subcategories; // List to store subcategories only
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchSubcategories();
  }

  // Fetch subcategories and child subcategories from API
  Future<void> fetchSubcategories() async {
    try {
      final categories = await SubcategoryService.fetchAllCategories();
      if (categories != null && categories.isNotEmpty) {
        // Flatten the subcategories from all parent categories
        final allSubcategories = categories.expand((category) => category.subcategories).toList();
        setState(() {
          subcategories = allSubcategories;
          isLoading = false;
        });
      } else {
        setState(() {
          subcategories = [];
          isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching subcategories: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subcategories and Child Categories'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : subcategories == null || subcategories!.isEmpty
              ? Center(child: Text('No subcategories found!'))
              : ListView.builder(
                  itemCount: subcategories!.length,
                  itemBuilder: (context, index) {
                    final subcategory = subcategories![index];
                    return ExpansionTile(
                      title: Text(subcategory.name),
                      subtitle: Text('Subcategory ID: ${subcategory.id}'),
                      children: subcategory.childSubcategories.map((childSub) {
                        return ListTile(
                          title: Text(childSub.name),
                          subtitle: Text('Child Subcategory ID: ${childSub.id}'),
                        );
                      }).toList(),
                    );
                  },
                ),
    );
  }
}
