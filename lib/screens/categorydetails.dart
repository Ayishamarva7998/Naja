import 'package:flutter/material.dart';

class ChildCategoryScreen extends StatefulWidget {
  final int parentCategoryId;
  final List<dynamic> subcategories; 

  ChildCategoryScreen({required this.parentCategoryId, required this.subcategories});

  @override
  _ChildCategoryScreenState createState() => _ChildCategoryScreenState();
}

class _ChildCategoryScreenState extends State<ChildCategoryScreen> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Child Categories of ${widget.parentCategoryId}'),
      ),
      body: widget.subcategories.isEmpty
          ? Center(child: Text('No child categories available!'))
          : ListView.builder(
              itemCount: widget.subcategories.length,
              itemBuilder: (context, index) {
                final childCategory = widget.subcategories[index];
                return ListTile(
                  title: Text(childCategory['name']),
                  subtitle: Text(childCategory['description'] ?? "No description"),
                );
              },
            ),
    );
  }
}
