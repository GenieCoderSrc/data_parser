import 'package:flutter/foundation.dart';

extension DoubleExtensions on double? {
  String toFormattedString({int? fractionDigits}) {
    debugPrint('DoubleExtensions | toFormattedString | value: $this');
    // Return "0" if the value is null
    if (this == null) {
      return '0';
    }

    // Check if the number is a whole number
    if (this! % 1 == 0) {
      return this!.toInt().toString(); // Return as int if whole number
    } else {
      return this!.toStringAsFixed(
          fractionDigits ?? 2); // Return with specified decimal places
    }
  }
}
