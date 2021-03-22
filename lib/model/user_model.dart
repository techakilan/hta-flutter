class UserModel {
  String id;
  String firstname;
  String lastname;
  String email;
  String password;

  UserModel({id, firstname, lastname, email, password});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      email: json["email"],
      password: json["password"],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
