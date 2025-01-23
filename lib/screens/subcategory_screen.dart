import 'package:flutter/material.dart';
import 'package:naja/model/sub_category_model.dart';
import 'package:naja/screens/subcategory_service.dart';

class SubcategoryScreen extends StatefulWidget {
  final int parentId;

  const SubcategoryScreen({Key? key, required this.parentId}) : super(key: key);

  @override
  _SubcategoryScreenState createState() => _SubcategoryScreenState();
}

class _SubcategoryScreenState extends State<SubcategoryScreen> {
  List<Subcategory>? subcategories;
  bool isLoading = true;
  int? selectedCategoryId;

  @override
  void initState() {
    super.initState();
    fetchSubcategories();
  }

  // Fetch subcategories based on the parent category ID
  Future<void> fetchSubcategories() async {
    try {
      final categories = await SubcategoryService.fetchAllCategories();
      if (categories != null && categories.isNotEmpty) {
        final filteredCategory = categories.firstWhere(
          (category) => category.id == widget.parentId,
          orElse: () => null as Category,
        );

        setState(() {
          subcategories = filteredCategory?.subcategories ?? [];
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            'assets/arrowback.png',
            height: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              'assets/search (1).png',
              height: 25,
            ),
          ),
        ],
        title: const Padding(
          padding: EdgeInsets.only(left: 50),
          child: Text(
            'Meat , Chicken & Fish',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : subcategories == null || subcategories!.isEmpty
              ? const Center(child: Text('No subcategories found!'))
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: subcategories!.map((subcategory) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategoryId = subcategory.id;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                subcategory.name,
                                style: const TextStyle(fontSize: 14),
                              ),
                              if (selectedCategoryId == subcategory.id)
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: subcategory.childSubcategories
                                        .map((childSub) {
                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Column(
                                          children: [
                                            Text(childSub.name),
                                            Text('ID: ${childSub.id}'),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
    );
  }
}
