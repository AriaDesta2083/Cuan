class UpdateUserFormModel {
  String? name;
  String? username;
  String? email;
  String? password;

  UpdateUserFormModel({
    this.name,
    this.username,
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'username': username,
    };
  } 
}