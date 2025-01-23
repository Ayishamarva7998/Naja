// class Category {
//   final int id;
//   final String name;
//   final List<Subcategory> subcategories;

//   Category({required this.id, required this.name, required this.subcategories});

//   factory Category.fromJson(Map<String, dynamic> json) {
//     var subcategoryList = (json['subcategories'] as List)
//         .map((subcategory) => Subcategory.fromJson(subcategory))
//         .toList();

//     return Category(
//       id: json['id'],
//       name: json['name'],
//       subcategories: subcategoryList,
//     );
//   }
// }

// class Subcategory {
//   final int id;
//   final String name;

//   Subcategory({required this.id, required this.name});

//   factory Subcategory.fromJson(Map<String, dynamic> json) {
//     return Subcategory(
//       id: json['id'],
//       name: json['name'],
//     );
//   }

//   int? get categoryId => null;
// }
