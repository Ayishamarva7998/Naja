class User {
  final String? firstname;
  final String? lastname;
  final String? number;
  final String? token;

  User({
    required this.firstname,
    required this.lastname,
    required this.number,
    this.token,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstname: json['first_name'],
      lastname: json['last_name'],
      number: json['phone'],
      token: json['token'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname' :lastname,
      'phone':number,
      'token':token
    };
  }
}