import 'package:flutter/material.dart';
import 'fieldvalue.dart';

Widget textFields({
  required String field,
  required String name,
  required IconData iconName,
  bool obscureValue = false,
}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: TextFormField(
      validator: (emailandpass) {
        if (emailandpass!.isEmpty) {
          return "This field cannot be empty";
        }
        return null;
      },
      onSaved: (newValue) {
        if (field == "email") {
          funcEmail(newValue!);
        }
        if (field == "password") {
          funcPass(newValue!);
        }
      },
      obscureText: obscureValue,
      decoration: InputDecoration(
          prefixIcon: Icon(
            iconName,
            color: Colors.blue,
          ),
          label: Text(
            name,
            style: const TextStyle(
              color: Colors.blue,
            ),
          ),
          border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue))),
    ),
  );
}
