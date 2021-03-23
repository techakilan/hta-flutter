import 'package:flutter/material.dart';
import 'package:hta/model/health_test_model.dart';

class HelathTestDetails extends StatelessWidget {
  final HealthTestModel healthTest;
  HelathTestDetails(this.healthTest);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(healthTest.name),
      ),
      body: Container(child: Text('Test Details')),
    );
  }
}
