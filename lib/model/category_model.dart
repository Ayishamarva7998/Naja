class CategoryModel {
  final String id;
  final String name;
  final String image;
  final bool isEmpty;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.isEmpty = false,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      image: json['image'] ?? '', 
    );
  }

  factory CategoryModel.empty(int index) {
    return CategoryModel(
      id: 'empty-$index',
      name: '',
      image: '',
      isEmpty: true,
    );
  }
}