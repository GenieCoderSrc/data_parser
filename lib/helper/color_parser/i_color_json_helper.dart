import 'package:flutter/material.dart';

/// Interface for color JSON serialization/deserialization.
abstract class IColorJsonHelper<T> {
  /// Converts a Color to a JSON-serializable type (int or String).
  T? toJson(Color? color);

  /// Converts a JSON value (int or String) to a Color.
  Color? fromJson(T? json);
}
