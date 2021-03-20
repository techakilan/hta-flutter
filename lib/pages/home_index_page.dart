import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeIndexPage extends StatefulWidget {
  @override
  _HomeIndexPageState createState() => _HomeIndexPageState();
}

class _HomeIndexPageState extends State<HomeIndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('home_main').tr(),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text('home_main').tr(),
      ),
    );
  }
}
