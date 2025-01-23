class Category {
  final int id;
  final String name;
  final List<Subcategory> subcategories;

  Category({required this.id, required this.name, required this.subcategories});

  factory Category.fromJson(Map<String, dynamic> json) {
    var subcategoryList = (json['subcategories'] as List)
        .map((subcategory) => Subcategory.fromJson(subcategory))
        .toList();

    return Category(
      id: json['id'],
      name: json['name'],
      subcategories: subcategoryList,
    );
  }
}

class Subcategory {
  final int id;
  final String name;
  final List<Subcategory> childSubcategories;

  Subcategory({required this.id, required this.name, this.childSubcategories = const []});

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    var childSubcategoryList = (json['subcategories'] as List?)
        ?.map((subcategory) => Subcategory.fromJson(subcategory))
        .toList() ?? [];

    return Subcategory(
      id: json['id'],
      name: json['name'],
      childSubcategories: childSubcategoryList,
    );
  }
}
