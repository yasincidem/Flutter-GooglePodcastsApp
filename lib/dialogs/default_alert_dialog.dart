import 'package:flutter/material.dart';

AlertDialog createDefaultDialog(BuildContext context) {
  const String NEGATIVE = "NO";
  const String POSITIVE = "YES";
  return AlertDialog(
      title: Text("Accept?"),
      content: Text("Do you accept??"),
      actions: [
      FlatButton(onPressed: () {
        Navigator.of(context, rootNavigator: true).pop(NEGATIVE);
      },
        child: Text(NEGATIVE)),
      FlatButton(onPressed: () {
        Navigator.pop(context, POSITIVE);
      },
        child: Text(POSITIVE))
      ]
  );
}