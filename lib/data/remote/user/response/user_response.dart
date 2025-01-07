class UserResponse {
  int? id;
  String? name;
  String? email;

  UserResponse({this.id, this.name, this.email});

  UserResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
  };
}