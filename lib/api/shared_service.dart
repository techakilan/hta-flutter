import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:hta/model/signin_model.dart';
import 'package:hta/routes/route_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("login_details") != null ? true : false;
  }

  static Future<SigninResponseModel> loginDetails() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("login_details") != null
        ? SigninResponseModel.fromJson(
            json.decode(prefs.getString("login_details")))
        : null;
  }

  static Future<void> setLoginDetails(
      SigninResponseModel signinResponseModel) async {
    final prefs = await SharedPreferences.getInstance();
    signinResponseModel != null
        ? prefs.setString(
            "login_details", json.encode(signinResponseModel.toJson()))
        : prefs.remove("login_details");
  }

  static Future<void> logout(BuildContext context) async {
    await setLoginDetails(null);
    Navigator.of(context).pushReplacementNamed(signinRoute);
  }
}
