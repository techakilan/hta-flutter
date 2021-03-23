import 'package:flutter/material.dart';
import 'package:hta/model/health_test_model.dart';
import 'package:hta/model/hospital_model.dart';
import 'package:hta/pages/health_test_tile.dart';

class HospitalHealthTestPage extends StatefulWidget {
  final HospitalModel hospital;

  HospitalHealthTestPage(this.hospital);
  @override
  _HospitalHealthTestPageState createState() =>
      _HospitalHealthTestPageState(hospital);
}

class _HospitalHealthTestPageState extends State<HospitalHealthTestPage> {
  List<HealthTestModel> healthTestList = <HealthTestModel>[];
  HospitalModel hospital;
  _HospitalHealthTestPageState(this.hospital);

  @override
  void initState() {
    super.initState();
    healthTestList.add(new HealthTestModel(
      '1',
      '1',
      'Health Test 1',
      'This is description for Health Test 1',
      'assets/hta_logo.png',
    ));
    healthTestList.add(new HealthTestModel(
      '2',
      '1',
      'Health Test 2',
      'This is description for Health Test 2',
      'assets/hta_logo.png',
    ));
    healthTestList.add(new HealthTestModel(
      '3',
      '1',
      'Health Test 3',
      'This is description for Health Test 3',
      'assets/hta_logo.png',
    ));
    healthTestList.add(new HealthTestModel(
      '4',
      '1',
      'Health Test 4',
      'This is description for Health Test 4',
      'assets/hta_logo.png',
    ));
    healthTestList.add(new HealthTestModel(
      '5',
      '1',
      'Health Test 5',
      'This is description for Health Test 5',
      'assets/hta_logo.png',
    ));
    healthTestList.add(new HealthTestModel(
      '6',
      '1',
      'Health Test 6',
      'This is description for Health Test 6',
      'assets/hta_logo.png',
    ));
    healthTestList.add(new HealthTestModel(
      '7',
      '1',
      'Health Test 7',
      'This is description for Health Test 7',
      'assets/hta_logo.png',
    ));
    healthTestList.add(new HealthTestModel(
      '8',
      '1',
      'Health Test 8',
      'This is description for Health Test 8',
      'assets/hta_logo.png',
    ));
    healthTestList.add(new HealthTestModel(
      '9',
      '1',
      'Health Test 9',
      'This is description for Health Test 9',
      'assets/hta_logo.png',
    ));
    healthTestList.add(new HealthTestModel(
      '10',
      '1',
      'Health Test 10',
      'This is description for Health Test 10',
      'assets/hta_logo.png',
    ));
    healthTestList.add(new HealthTestModel(
      '11',
      '1',
      'Health Test 11',
      'This is description for Health Test 11',
      'assets/hta_logo.png',
    ));
    healthTestList.add(new HealthTestModel(
      '12',
      '1',
      'Health Test 12',
      'This is description for Health Test 12',
      'assets/hta_logo.png',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(hospital.name),
        //automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        key: PageStorageKey<String>("healthTestListIndexKey"),
        itemCount: healthTestList.length,
        itemBuilder: (context, index) {
          return Card(
            child: HealthTestTile(
              healthTest: healthTestList[index],
            ),
          );
        },
      ),
    );
  }
}
