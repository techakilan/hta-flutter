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
    //hospitalList.add('1', 'Hospital1', 'This is a hospital with many tests',
    // 'hospital address 1', Image.asset('assets/hta_logo.png'));

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
