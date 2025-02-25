import 'package:flutter/material.dart';

Widget expenseField({
  required TextEditingController controller,
  required String label,
  required TextInputType type,
  var maxChar,
  String? suffix,
} ) => TextFormField(
  controller: controller,
  keyboardType: type,
  maxLength: maxChar,
  decoration: InputDecoration(
    suffixText:suffix ,
    label: Text(
        label,
        style: TextStyle(
          fontSize: 12,
        ),
    ),
    border:  OutlineInputBorder(
      borderRadius:  BorderRadius.circular(15.0),
      borderSide:  BorderSide( ),
    ),

  ),
);