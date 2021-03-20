import 'package:flutter/material.dart';

class HospitalIndexPage extends StatefulWidget {
  @override
  _HospitalIndexPageState createState() => _HospitalIndexPageState();
}

class _HospitalIndexPageState extends State<HospitalIndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hospital-Main'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text('Hospital-Main'),
      ),
    );
  }
}
