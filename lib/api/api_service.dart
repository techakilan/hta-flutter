import 'package:hta/api/shared_service.dart';
import 'package:hta/model/api_models/signup_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/signin_model.dart';

class APIService {
  Future<SigninResponseModel> login(SigninRequestModel requestModel) async {
    SigninResponseModel signinResponseModel;
    try {
      final response = await http.post(
          //ec2-13-235-81-98.ap-south-1.compute.amazonaws.com
          Uri.http('ec2-13-126-255-23.ap-south-1.compute.amazonaws.com:8000',
              'api/login.php'),
          //Uri.http('10.0.2.2:8000', 'api/login.php'),
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
  Future<SignupResponseModel> register(SignupRequestModel requestModel) async {
    try {
      final response = await http.post(
          //Uri.http('10.0.2.2:8000', 'api/register.php'),
          Uri.http('ec2-13-126-255-23.ap-south-1.compute.amazonaws.com:8000',
              'api/register.php'),
          body: json.encode(requestModel.toJson()));
      return SignupResponseModel.fromJson(json.decode(response.body));
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign out
}
