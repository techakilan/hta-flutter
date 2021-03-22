class SigninResponseModel {
  final String message;
  final String token;
  final String email;
  final bool hasError;

  SigninResponseModel({this.message, this.token, this.email, this.hasError});

  factory SigninResponseModel.fromJson(Map<String, dynamic> json) {
    return SigninResponseModel(
      message: json["message"] != null ? json["message"] : "",
      token: json["jwtToken"] != null ? json["jwtToken"] : "",
      email: json["email"] != null ? json["email"] : "",
      hasError: json["hasError"] != null ? json["hasError"] : true,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['token'] = this.token;
    data['email'] = this.email;
    data['hasError'] = this.hasError;
    return data;
  }
}

class SigninRequestModel {
  String email;
  String password;

  SigninRequestModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim(),
    };
    return map;
  }
}
