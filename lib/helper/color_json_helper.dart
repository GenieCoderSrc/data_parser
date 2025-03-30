import 'package:flutter/material.dart';

class ColorJsonHelper {
  // Convert Color to ARGB integer for JSON
  static int? toJson(Color? color) {
    return color?.value; // Convert Color to ARGB integer
  }

  // Convert ARGB integer from JSON to Color
  static Color? fromJson(int? json) {
    return json != null ? Color(json) : null; // Convert ARGB integer to Color
  }
}
