import 'package:flutter/material.dart';
import 'package:hta/model/health_test_model.dart';
import 'package:hta/routes/route_names.dart';
import 'package:hta/utils/passed_parameters/healthtest_argument.dart';

class HealthTestTile extends StatelessWidget {
  final HealthTestModel healthTest;

  HealthTestTile({this.healthTest});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 8,
      ),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(healthTestDetailsRoute,
                arguments: HealthTestArgument(healthTest));
          },
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            foregroundImage: ExactAssetImage(healthTest.imageUrl),
          ),
          title: Text(healthTest.name),
          subtitle: Text(healthTest.description),
        ),
      ),
    );
  }
}
