import 'package:flutter/foundation.dart';

T? enumFromString<T>(List<T> values, String type) {
  try {
    return values.firstWhere(
      (value) => value.toString().split('.').last == type,
      orElse: () => null as T, // Explicitly cast null to T
    );
  } catch (e) {
    // Log the error or handle it
    debugPrint(
        'EnumFromString | enumFromString | Error: Failed to find enum value for type "$type". Details: $e');
    return null; // Return null to indicate failure
  }
}

// // Helper function to convert string to enum value
// T? enumFromString<T>(List<T> values, String type) {
//   return values.firstWhereOrNull((value) => value.toString().split('.').last == type);
// }

//
// void main() {
//   // For ComponentType
//   final componentType = enumFromString(ComponentType.values, 'AppBar');
//   print(componentType); // Output: ComponentType.AppBar
//
//   // For another enum, if defined
//   // final anotherEnumValue = enumFromString(AnotherEnum.values, 'SomeValue');
// }
