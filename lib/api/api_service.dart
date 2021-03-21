import 'package:hta/api/shared_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/signin_model.dart';

class APIService {
  Future<SigninResponseModel> login(SigninRequestModel requestModel) async {
    SigninResponseModel signinResponseModel;
    try {
      final response = await http.post(
          Uri.http('10.0.2.2:8000', 'api/login.php'),
          body: json.encode(requestModel.toJson()));
      signinResponseModel =
          SigninResponseModel.fromJson(json.decode(response.body));
      SharedService.setLoginDetails(signinResponseModel);
      return signinResponseModel;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign up/register

  //sign out
}
