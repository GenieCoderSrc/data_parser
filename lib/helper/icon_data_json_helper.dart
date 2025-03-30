import 'package:flutter/material.dart';

class IconDataJsonHelper {
  static Map<String, dynamic>? toJson(IconData? icon) {
    if (icon == null) {
      return null;
    }

    return {
      'codePoint': icon.codePoint,
      'fontFamily': icon.fontFamily ?? 'MaterialIcons',
      'fontPackage': icon.fontPackage,
    };
  }

  static IconData? fromJson(Map<String, dynamic>? json) {
    if (json == null || json['codePoint'] == null) {
      return null;
    }

    return IconData(
      json['codePoint'] as int,
      fontFamily: json['fontFamily'] as String? ?? 'MaterialIcons',
      fontPackage: json['fontPackage'] as String?,
    );
  }
}

