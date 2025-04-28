import 'package:flutter/material.dart';

import 'i_color_json_helper.dart';

/// Helper for Color <-> int JSON serialization.
class ColorJsonHelper implements IColorJsonHelper<int> {
  @override
  int? toJson(Color? color) {
    return color?.value; // Color to ARGB int
  }

  @override
  Color? fromJson(int? json) {
    return json != null ? Color(json) : null; // ARGB int to Color
  }
}
