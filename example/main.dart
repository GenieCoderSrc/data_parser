import 'dart:io';

import 'package:data_parser/data/data_sources/http_response_data_parser_impl.dart';
import 'package:data_parser/data_parser.dart';
import 'package:data_parser/helper/text_style_json_helper.dart';
import 'package:flutter/material.dart';

// Example model to show how to use the parsing service
class MyModel {
  final String key1;
  final String key2;

  MyModel({required this.key1, required this.key2});

  factory MyModel.fromJson(Map<String, dynamic> json) {
    return MyModel(
      key1: json['key1'] ?? '',
      key2: json['key2'] ?? '',
    );
  }
}

void main() async {
  // 1. HttpResponseDataParserImpl usage
  print("=== HTTP Response Data Parser ===");
  final parser = HttpResponseDataParserImpl();
  final response = {
    'status': true,
    'data': {'key1': 'value1', 'key2': 'value2'}
  };

  var parsedResponse = parser.parseHttpResponse(response);
  print('Parsed Response: $parsedResponse\n');

  // 2. ListDataParserServiceImpl usage
  print("=== List Data Parser Service ===");
  final listParser = ListDataParserServiceImpl<MyModel>();

  List<Map<String, dynamic>> myJsonList = [
    {'key1': 'value1', 'key2': 'value2'},
    {'key1': 'value3', 'key2': 'value4'}
  ];

  List<MyModel>? parsedList = listParser.parseFutureDataList(
    mapList: myJsonList,
    converter: (item) => MyModel.fromJson(item),
  );

  print('Parsed List: $parsedList\n');

  // 3. File to Base64 conversion usage
  print("=== File to Base64 Conversion ===");
  File myFile = File('path_to_your_file'); // Provide a valid file path
  String base64String = await myFile.toBase64String();
  print('Base64 String: $base64String\n');


  // 4. IconDataJsonHelper usage
  print("=== IconData JSON Helper ===");
  IconData icon = Icons.star;
  Map<String, dynamic>? iconJson = IconDataJsonHelper.toJson(icon);
  print('Icon JSON: $iconJson');

  IconData? parsedIcon = IconDataJsonHelper.fromJson(iconJson);
  print('Parsed Icon: $parsedIcon\n');

  // 5. TextStyleJsonHelper usage
  print("=== TextStyle JSON Helper ===");
  TextStyle textStyle = TextStyle(color: Colors.red, fontSize: 20);
  Map<String, dynamic>? textStyleJson = TextStyleJsonHelper.toJson(textStyle);
  print('TextStyle JSON: $textStyleJson');

  TextStyle? parsedTextStyle = TextStyleJsonHelper.fromJson(textStyleJson);
  print('Parsed TextStyle: $parsedTextStyle\n');

  // // 6. Enum Conversion usage
  // print("=== Enum Conversion ===");
  // enum MyEnum { first, second }
  //
  // MyEnum? enumValue = enumFromString(MyEnum.values, 'first');
  // print('Enum Value: $enumValue');
  //
  // String? enumString = EnumUtils.enumToString(MyEnum.first);
  // print('Enum String: $enumString');
}
