import 'package:hta/model/health_test_model.dart';
import 'package:hta/model/hospital_model.dart';

class UserBookingModel {
  HospitalModel hospital;
  HealthTestModel healthTest;
  String userAddress;

  UserBookingModel(this.hospital, this.healthTest, this.userAddress);
}
