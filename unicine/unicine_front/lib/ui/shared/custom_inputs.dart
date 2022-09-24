import 'package:flutter/material.dart';

class CustomInputs {
  static InputDecoration loginInputDecoration(
      {required String hint, required String label, IconData? icon}) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(0.6),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(0.7),
        ),
      ),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon(icon),
      // labelStyle: const TextStyle(color: Color(0xff0A9CBF)),
      // hintStyle: const TextStyle(color: Color(0xff0A9CBF)),
    );
  }

  static InputDecoration searchInputDecoration(
      {required String hint, required IconData icon}) {
    return InputDecoration(
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      hintText: hint,
      prefixIcon: Icon(icon, color: Colors.grey),
      labelStyle: const TextStyle(color: Colors.grey),
      hintStyle: const TextStyle(color: Colors.grey),
    );
  }
}
