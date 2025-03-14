import 'package:flutter/material.dart';

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(
      width: 1,
      color: Colors.white,
    ),
    borderRadius: BorderRadius.circular(8),
  );
}
