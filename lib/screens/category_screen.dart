import 'package:flutter/material.dart';
import 'package:naja/model/category_model.dart';
import 'package:naja/service/category/category_service.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final CategoryService _categoryService = CategoryService();
  List<CategoryModel> categories = [];
  bool isLoading = true;
  bool isError = false;
  
  final int totalRows = 5;
  final int itemsPerRow = 3;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    try {
      final fetchedCategories = await _categoryService.fetchCategories();
      
      final List<CategoryModel> paddedCategories = List.from(fetchedCategories);
      while (paddedCategories.length < totalRows * itemsPerRow) {
        paddedCategories.add(CategoryModel.empty(paddedCategories.length));
      }
      
      setState(() {
        categories = paddedCategories;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios_new_outlined),
          title: const Padding(
            padding: EdgeInsets.only(left: 95),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : isError
                ? const Center(child: Text('Failed to load categories'))
                : SingleChildScrollView(
                    child: Column(
                      children: List.generate(totalRows, (rowIndex) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(itemsPerRow, (colIndex) {
                              final itemIndex = (rowIndex * itemsPerRow) + colIndex;
                              final category = categories[itemIndex];
                              return CategoryItemWidget(category: category);
                            }),
                          ),
                        );
                      }),
                    ),
                  ),
      ),
    );
  }
}

class CategoryItemWidget extends StatelessWidget {
  final CategoryModel category;

  const CategoryItemWidget({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    if (category.isEmpty) {
      return const SizedBox(
        width: 110,
        height: 50,
      );
    }

    return Column(
      children: [
        SizedBox(
          height: 100,
          width: 110,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 120,
                width: 110,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Positioned(
                top: 0,
                child: Container(
                  height: 70,
                  width: 110,
                  decoration: BoxDecoration(
                    color: Color(int.parse(category.color)), 
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              if (category.image.isNotEmpty)
                Positioned(
                  top: 12,
                  child: SizedBox(
                    height: 65,
                    width: 75,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: Image.network(
                        category.image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, size: 40),
                      ),
                    ),
                  ),
                ),
              if (category.name.isNotEmpty)
                Positioned(
                  bottom: 4,
                  child: Text(
                    category.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

