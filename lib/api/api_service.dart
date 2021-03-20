import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/signin_model.dart';

class APIService {
  Future<SigninResponseModel> login(SigninRequestModel requestModel) async {
    final response = await http.post(Uri.http('10.0.2.2:8000', 'api/login.php'),
        body: json.encode(requestModel.toJson()));
    return SigninResponseModel.fromJson(json.decode(response.body));
  }
}
