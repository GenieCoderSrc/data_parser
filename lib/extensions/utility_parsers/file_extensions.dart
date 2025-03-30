import 'dart:convert';
import 'dart:io';

extension FileToBase64String on File {
  Future<String> toBase64String() async {
    try {
      final imageBytes = await readAsBytes();
      final base64String = base64Encode(imageBytes);
      return base64String;
    } catch (e) {
      print('Error converting file to Base64: $e');
      return '';
    }
  }
}
