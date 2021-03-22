class SignupResponseModel {
  final String message;
  final bool hasError;
  SignupResponseModel({this.message, this.hasError});

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupResponseModel(
      message: json["message"] != null ? json["message"] : "",
      hasError: json["hasError"] != null ? json["hasError"] : true,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data["message"] = this.message;
    data["hasError"] = this.hasError;
    return data;
  }
}

class SignupRequestModel {
  String id;
  String firstname;
  String lastname;
  String email;
  String password;

  SignupRequestModel({id, firstname, lastname, email, password});
  factory SignupRequestModel.fromJson(Map<String, dynamic> json) {
    return SignupRequestModel(
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
