import 'package:flutter/material.dart';
import 'package:hta/routes/route_names.dart';

Future<bool> onBackPressed(context) async {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Want to exit app?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text('NO')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text('YES')),
            ],
          ));
}
