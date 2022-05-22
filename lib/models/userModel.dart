class UserModel {
  String? userId, email, name;

  UserModel({this.name, this.email, this.userId});

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
  }
  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
    };
  }
}
