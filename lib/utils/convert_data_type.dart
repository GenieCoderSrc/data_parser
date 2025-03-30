class ConvertDataType {
  static int stringToInt(String? txt) => int.tryParse(txt ?? '') ?? -1;
  static String intToString(int? number) => '$number';
}
