import 'package:flutter/material.dart';

class TextStyleJsonHelper {
  /// Converts JSON map to TextStyle
  static TextStyle? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    return TextStyle(
      color: json['color'] != null ? Color(json['color']) : null,
      fontSize: (json['fontSize'] as num?)?.toDouble(),
      fontWeight: (json.containsKey('fontWeight') && json['fontWeight'] != null)
          ? FontWeight.values[json['fontWeight']]
          : null,
      letterSpacing: (json['letterSpacing'] as num?)?.toDouble(),
      wordSpacing: (json['wordSpacing'] as num?)?.toDouble(),
    );
  }

  /// Converts TextStyle to JSON map
  static Map<String, dynamic>? toJson(TextStyle? textStyle) {
    if (textStyle == null) return null;
    return {
      'color': textStyle.color?.value,
      'fontSize': textStyle.fontSize,
      'fontWeight': textStyle.fontWeight?.index,
      'letterSpacing': textStyle.letterSpacing,
      'wordSpacing': textStyle.wordSpacing,
    };
  }
}
