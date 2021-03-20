import 'package:hta/controllers/controllers_index.dart';
import 'package:hta/pages/signin_index_page.dart';

import 'package:flutter/material.dart';
import 'package:hta/pages/wrapper.dart';
import 'package:hta/routes/route_names.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;
    switch (settings.name) {
      case rootRoute:
        return MaterialPageRoute(builder: (_) => Wrapper());
      case signinRoute:
        return MaterialPageRoute(builder: (_) => SigninIndexPage());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => IndexController());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error Page'),
        ),
        body: Text('ERROR'),
      );
    });
  }
}
