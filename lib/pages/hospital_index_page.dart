import 'package:flutter/material.dart';
import 'package:hta/model/hospital_model.dart';
import 'package:hta/pages/hospital_tile.dart';

class HospitalIndexPage extends StatefulWidget {
  @override
  _HospitalIndexPageState createState() => _HospitalIndexPageState();
}

class _HospitalIndexPageState extends State<HospitalIndexPage> {
  List<HospitalModel> hospitalList = <HospitalModel>[];

  @override
  void initState() {
    super.initState();
    hospitalList.add(new HospitalModel(
      '1',
      'hospital 1',
      'This is a hospital with many tests',
      'hospital address 1',
      'assets/hta_logo.png',
    ));
    hospitalList.add(new HospitalModel(
      '2',
      'hospital 2',
      'This is a hospital with many tests',
      'hospital address 2',
      'assets/hta_logo.png',
    ));
    hospitalList.add(new HospitalModel(
      '3',
      'hospital 3',
      'This is a hospital with many tests',
      'hospital address 3',
      'assets/hta_logo.png',
    ));
    hospitalList.add(new HospitalModel(
      '4',
      'hospital 4',
      'This is a hospital with many tests',
      'hospital address 4',
      'assets/hta_logo.png',
    ));
    hospitalList.add(new HospitalModel(
      '5',
      'hospital 5',
      'This is a hospital with many tests',
      'hospital address 5',
      'assets/hta_logo.png',
    ));
    hospitalList.add(new HospitalModel(
      '6',
      'hospital 6',
      'This is a hospital with many tests',
      'hospital address 6',
      'assets/hta_logo.png',
    ));
    hospitalList.add(new HospitalModel(
      '7',
      'hospital 7',
      'This is a hospital with many tests',
      'hospital address 7',
      'assets/hta_logo.png',
    ));
    hospitalList.add(new HospitalModel(
      '8',
      'hospital 8',
      'This is a hospital with many tests',
      'hospital address 8',
      'assets/hta_logo.png',
    ));
    hospitalList.add(new HospitalModel(
      '9',
      'hospital 9',
      'This is a hospital with many tests',
      'hospital address 9',
      'assets/hta_logo.png',
    ));
    hospitalList.add(new HospitalModel(
      '10',
      'hospital 10',
      'This is a hospital with many tests',
      'hospital address 10',
      'assets/hta_logo.png',
    ));
    hospitalList.add(new HospitalModel(
      '11',
      'hospital 11',
      'This is a hospital with many tests',
      'hospital address 11',
      'assets/hta_logo.png',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hospital Partners'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        key: PageStorageKey<String>("hospitalListIndexKey"),
        itemCount: hospitalList.length,
        itemBuilder: (context, index) {
          return Card(
            child: HospitalTile(
              hospital: hospitalList[index],
            ),
          );
        },
      ),
    );
  }
}
