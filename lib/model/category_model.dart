class CategoryModel {
  final int id;
  final String name;
  final String image;
  final String color;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.color,
  });

  /// Factory method to create a `CategoryModel` from a JSON object.
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int,
      name: json['name'] as String? ?? '', // Default to empty string if null
      image: json['image'] as String? ?? '', // Default to empty string if null
      color: json['color'] as String? ?? '0xFFFFFFFF', // Default to white color
    );
  }

  /// Optional: Converts `CategoryModel` back to JSON.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'color': color,
    };
  }

  /// Creates an empty category object.
  static CategoryModel empty(int id) {
    return CategoryModel(
      id: id,
      name: '',
      image: '',
      color: '0xFFFFFFFF',
    );
  }
}
