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
  Set<int> expandedSubcategories = {}; // Track expanded subcategories
  Set<int> selectedSubcategories = {}; // Track selected subcategories

  @override
  void initState() {
    super.initState();
    fetchSubcategories();
  }

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: subcategories!.map((subcategory) {
                      final isExpanded =
                          expandedSubcategories.contains(subcategory.id);
                      final isSelected =
                          selectedSubcategories.contains(subcategory.id);

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (expandedSubcategories.contains(subcategory.id)) {
                              expandedSubcategories.remove(subcategory.id);
                            } else {
                              expandedSubcategories.add(subcategory.id);
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                subcategory.name,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: isSelected
                                      ? Colors.black
                                      : const Color.fromARGB(255, 105, 104, 104),
                                ),
                              ),
                              if (isExpanded)
                                SizedBox(
                                  height: 40,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: subcategory.childSubcategories
                                          .map((childSub) {
                                        return Container(
                                          height: 30.0,
                                          width: 100.0,
                                          margin: const EdgeInsets.only(
                                              right: 8.0),
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 236, 237, 238),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 227, 225, 225),
                                              width: 1,
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            childSub.name,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              color: Color.fromARGB(
                                                  255, 96, 95, 95),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        );
                                      }).toList(),
                                    ),
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
