import 'package:flutter/material.dart';

class ProfileIndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('profile_main'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text('profile_main'),
      ),
    );
  }
}
