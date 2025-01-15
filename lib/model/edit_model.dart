// 

class Edituser {
  final String name;
  final String email;
  final String phone;

 Edituser({
    required this.name,
    required this.email,
    required this.phone,
  });

  factory Edituser.fromJson(Map<String, dynamic> json) {
    return Edituser(
      name: json['name'] ?? 'Unknown',
      email: json['email'] ?? 'Unknown',
      phone: json['phone'] ?? 'Unknown',
    );
  }
}