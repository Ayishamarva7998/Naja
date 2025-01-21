class CategoryModel {
  final String id;
  final String name;
  final String image;
  final bool isEmpty;
  final String color; 

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.isEmpty = false,
    this.color = '0xFFE5FFE3', 
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      color: json['color'] ?? '0xFFE5FFE3', 
    );
  }

  factory CategoryModel.empty(int index) {
    return CategoryModel(
      id: 'empty-$index',
      name: '',
      image: '',
      isEmpty: true,
      color: '0xFFE5FFE3', 
    );
  }
}