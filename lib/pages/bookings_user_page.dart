import 'package:flutter/material.dart';
import 'package:hta/model/health_test_model.dart';
import 'package:hta/model/hospital_model.dart';
import 'package:hta/model/user_booking_model.dart';
import 'package:hta/pages/bookings_user_tile.dart';

class BookingsUserPage extends StatefulWidget {
  @override
  _BookingsUserPageState createState() => _BookingsUserPageState();
}

class _BookingsUserPageState extends State<BookingsUserPage> {
  List<UserBookingModel> bookingList = <UserBookingModel>[];

  @override
  void initState() {
    super.initState();
    bookingList.add(new UserBookingModel(
        HospitalModel(
          '1',
          'hospital 1',
          'This is a hospital with many tests',
          'hospital address 1',
          'assets/hta_logo.png',
        ),
        HealthTestModel(
          '1',
          'hospital 1',
          'test name 1',
          'test description 1',
          'assets/hta_logo.png',
        ),
        'user address 1'));
    bookingList.add(new UserBookingModel(
        HospitalModel(
          '2',
          'hospital 2',
          'This is a hospital with many tests',
          'hospital address 2',
          'assets/hta_logo.png',
        ),
        HealthTestModel(
          '1',
          'hospital 1',
          'test name 1',
          'test description 1',
          'assets/hta_logo.png',
        ),
        'user address 1'));
    bookingList.add(new UserBookingModel(
        HospitalModel(
          '3',
          'hospital 3',
          'This is a hospital with many tests',
          'hospital address 3',
          'assets/hta_logo.png',
        ),
        HealthTestModel(
          '1',
          'hospital 1',
          'test name 1',
          'test description 1',
          'assets/hta_logo.png',
        ),
        'user address 1'));
    bookingList.add(new UserBookingModel(
        HospitalModel(
          '4',
          'hospital 4',
          'This is a hospital with many tests',
          'hospital address 4',
          'assets/hta_logo.png',
        ),
        HealthTestModel(
          '1',
          'hospital 1',
          'test name 1',
          'test description 1',
          'assets/hta_logo.png',
        ),
        'user address 1'));
    bookingList.add(new UserBookingModel(
        HospitalModel(
          '5',
          'hospital 5',
          'This is a hospital with many tests',
          'hospital address 5',
          'assets/hta_logo.png',
        ),
        HealthTestModel(
          '1',
          'hospital 1',
          'test name 1',
          'test description 1',
          'assets/hta_logo.png',
        ),
        'user address 1'));
    bookingList.add(new UserBookingModel(
        HospitalModel(
          '6',
          'hospital 6',
          'This is a hospital with many tests',
          'hospital address 6',
          'assets/hta_logo.png',
        ),
        HealthTestModel(
          '1',
          'hospital 1',
          'test name 1',
          'test description 1',
          'assets/hta_logo.png',
        ),
        'user address 1'));
    bookingList.add(new UserBookingModel(
        HospitalModel(
          '7',
          'hospital 7',
          'This is a hospital with many tests',
          'hospital address 7',
          'assets/hta_logo.png',
        ),
        HealthTestModel(
          '1',
          'hospital 1',
          'test name 1',
          'test description 1',
          'assets/hta_logo.png',
        ),
        'user address 1'));
    bookingList.add(new UserBookingModel(
        HospitalModel(
          '8',
          'hospital 8',
          'This is a hospital with many tests',
          'hospital address 8',
          'assets/hta_logo.png',
        ),
        HealthTestModel(
          '1',
          'hospital 1',
          'test name 1',
          'test description 1',
          'assets/hta_logo.png',
        ),
        'user address 1'));
    bookingList.add(new UserBookingModel(
        HospitalModel(
          '9',
          'hospital 9',
          'This is a hospital with many tests',
          'hospital address 9',
          'assets/hta_logo.png',
        ),
        HealthTestModel(
          '1',
          'hospital 1',
          'test name 1',
          'test description 1',
          'assets/hta_logo.png',
        ),
        'user address 1'));
    bookingList.add(new UserBookingModel(
        HospitalModel(
          '10',
          'hospital 10',
          'This is a hospital with many tests',
          'hospital address 10',
          'assets/hta_logo.png',
        ),
        HealthTestModel(
          '1',
          'hospital 1',
          'test name 1',
          'test description 1',
          'assets/hta_logo.png',
        ),
        'user address 1'));
    bookingList.add(new UserBookingModel(
        HospitalModel(
          '11',
          'hospital 11',
          'This is a hospital with many tests',
          'hospital address 11',
          'assets/hta_logo.png',
        ),
        HealthTestModel(
          '1',
          'hospital 1',
          'test name 1',
          'test description 1',
          'assets/hta_logo.png',
        ),
        'user address 1'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Your Bookings'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        key: PageStorageKey<String>("bookingsListIndexKey"),
        itemCount: bookingList.length,
        itemBuilder: (context, index) {
          return Card(
            child: BookingsUserTile(
              hospital: bookingList[index].hospital,
              healthTest: bookingList[index].healthTest,
              userAddress: bookingList[index].userAddress,
            ),
          );
        },
      ),
    );
  }
}
