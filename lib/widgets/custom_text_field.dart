// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.label,
      this.hint,
      this.function,
      this.obsecure = false,
      this.suffixIcon,
      this.textInputType});
  String? label;
  String? hint;
  bool? obsecure;
  IconButton? suffixIcon;
  Function(String)? function;
  TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      obscureText: obsecure!,
      onChanged: function,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        label: Text(
          label ?? '',
          style: const TextStyle(),
        ),
        hintText: hint,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
