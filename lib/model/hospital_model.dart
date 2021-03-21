import 'package:flutter/widgets.dart';

class HospitalModel {
  String id;
  String name;
  String description;
  String address;
  String imageUrl;

  HospitalModel(id, name, description, address, imageUrl) {
    this.id = id;
    this.name = name;
    this.description = description;
    this.address = address;
    this.imageUrl = imageUrl;
  }
}
