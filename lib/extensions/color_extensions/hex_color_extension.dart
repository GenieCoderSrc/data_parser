import 'package:flutter/material.dart';

extension HexColorExtension on Color {
  /// Converts the [Color] to a hex string.
  ///
  /// If [includeAlpha] is `true`, includes the alpha channel (AARRGGBB).
  /// Otherwise, returns only the RGB part (RRGGBB).
  String toHex({bool includeAlpha = false}) {
    final hex = toARGB32().toRadixString(16).padLeft(8, '0').toUpperCase();
    return includeAlpha ? '0x$hex' : '0x${hex.substring(2)}';
  }

  /// Creates a [Color] from a hex string.
  ///
  /// Accepts hex strings like `0xAARRGGBB`, `0xRRGGBB`, `AARRGGBB`, or `RRGGBB`.
  static Color fromHex(String hexString) {
    String hex =
        hexString.toUpperCase().replaceAll('0X', '').replaceAll('#', '');

    if (hex.length == 6) {
      hex = 'FF$hex'; // Default full opacity
    } else if (hex.length != 8) {
      throw FormatException('Hex color must be 6 or 8 characters long.');
    }

    return Color(int.parse(hex, radix: 16));
  }
}
