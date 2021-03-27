import 'package:flutter/material.dart';
import 'package:hta/model/health_test_model.dart';
import 'package:hta/model/hospital_model.dart';
import 'package:hta/routes/route_names.dart';

class BookingsUserTile extends StatelessWidget {
  final HospitalModel hospital;
  final HealthTestModel healthTest;
  final String userAddress;

  BookingsUserTile({this.hospital, this.healthTest, this.userAddress});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 8,
      ),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: Column(
          children: [
            Container(child: Text(healthTest.name)),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, collectionTrackingRoute);
              },
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                foregroundImage: ExactAssetImage(hospital.imageUrl),
              ),
              title: Text(hospital.name),
              subtitle: Text(hospital.address),
            ),
            Container(child: Text(userAddress)),
          ],
        ),
      ),
    );
  }
}
