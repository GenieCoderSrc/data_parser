class EnumUtils {
  // Helper method to convert enum to string
  static String? enumToString(Enum? enumValue) {
    return enumValue?.toString().split('.').last;
  }
}
