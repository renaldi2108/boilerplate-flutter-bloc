class UserEntity {
  int? id;
  String? name;
  String? email;

  UserEntity({this.id, this.name, this.email});

  UserEntity.fromJson(Map<String, dynamic> json) {
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