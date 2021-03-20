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
      hasError: json["hasError"] != null ? json["hasError"] : "",
    );
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
