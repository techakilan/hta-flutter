import 'package:flutter/material.dart';
import 'package:hta/api/shared_service.dart';

class ProfileIndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('profile_main'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              SharedService.logout(context);
            },
          )
        ],
      ),
      body: Center(
        child: Text('profile_main'),
      ),
    );
  }
}
