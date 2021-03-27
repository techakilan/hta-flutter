import 'package:hta/controllers/controllers_index.dart';
import 'package:hta/pages/bookings_user_page.dart';
import 'package:hta/pages/collection_tracking_page.dart';
import 'package:hta/pages/healthtest_details.dart';
import 'package:hta/pages/hospital_healthtest_page.dart';
import 'package:hta/pages/hospital_index_page.dart';
import 'package:hta/pages/index_page.dart';
import 'package:hta/pages/signin_index_page.dart';

import 'package:flutter/material.dart';
import 'package:hta/pages/signup_index_page.dart';

import 'package:hta/routes/route_names.dart';
import 'package:hta/utils/passed_parameters/healthtest_argument.dart';
import 'package:hta/utils/passed_parameters/hospital_argument.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;
    switch (settings.name) {
      case rootRoute:
        return MaterialPageRoute(builder: (_) => IndexPage());
      case signinRoute:
        return MaterialPageRoute(builder: (_) => SigninIndexPage());
      case signupRoute:
        return MaterialPageRoute(builder: (_) => SignupIndexPage());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => IndexController());
      case hospitalRoute:
        return MaterialPageRoute(builder: (_) => HospitalIndexPage());
      case hospitalHealthTestRoute:
        HospitalArgument args = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => HospitalHealthTestPage(args.hospital));
      case healthTestDetailsRoute:
        HealthTestArgument args = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => HelathTestDetails(args.healthTest));
      case bookingsUserRoute:
        return MaterialPageRoute(builder: (_) => BookingsUserPage());
      case collectionTrackingRoute:
        return MaterialPageRoute(builder: (_) => CollectionTrackingPage());
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

  static Route<dynamic> _rootRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Root Route'),
        ),
        body: Text('Root Route'),
      );
    });
  }
}
