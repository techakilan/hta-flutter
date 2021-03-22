import 'package:flutter/material.dart';

InputDecoration customInputDecoration(String hint, Icon icon) {
  return InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(color: Colors.grey),
    contentPadding: EdgeInsets.only(top: 15, bottom: 15),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[300], width: 2.0),
    ),
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.orange, width: 1.0)),
    prefixIcon: icon,
  );
}
