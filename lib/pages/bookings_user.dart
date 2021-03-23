import 'package:flutter/material.dart';

class BookingsUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Your Bookings'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
          child: Center(
        child: Text('Booking Details'),
      )),
    );
  }
}
