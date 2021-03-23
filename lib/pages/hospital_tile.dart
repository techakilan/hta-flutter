import 'package:flutter/material.dart';
import 'package:hta/model/hospital_model.dart';
import 'package:hta/routes/route_names.dart';
import 'package:hta/utils/passed_parameters/hospital_argument.dart';

class HospitalTile extends StatelessWidget {
  final HospitalModel hospital;

  HospitalTile({this.hospital});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 8,
      ),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(hospitalHealthTestRoute,
                arguments: HospitalArgument(hospital));
          },
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            foregroundImage: ExactAssetImage(hospital.imageUrl),
          ),
          title: Text(hospital.name),
          subtitle: Text(hospital.address),
        ),
      ),
    );
  }
}
