import 'package:data_parser/data/data_sources/http_response_data_parser_impl.dart';
import 'package:data_parser/data/data_sources/list_data_parser_service_impl.dart';
import 'package:data_parser/data_parser.dart';
import 'package:data_parser/helper/color_json_helper.dart';
import 'package:data_parser/utils/enum_utils.dart';
import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  // Example: Parsing HTTP Response
  HttpResponseDataParserImpl parser = HttpResponseDataParserImpl();
  Map<String, dynamic>? parsedData = parser.parseHttpResponse({
    'status': true,
    'data': {'message': 'Success', 'value': 42}
  });
  print('Parsed HTTP Response: \$parsedData');

  // Example: Parsing List Data
  ListDataParserServiceImpl<MyModel> listParser = ListDataParserServiceImpl();
  List<MyModel>? models = listParser.parseFutureDataList(
    mapList: [
      {'id': 1, 'name': 'Item 1'},
      {'id': 2, 'name': 'Item 2'}
    ],
    converter: (item) => MyModel.fromJson(item),
  );
  print('Parsed List Data: \$models');

  // Example: Converting File to Base64
  File file = File('path/to/file.jpg');
  file.toBase64String().then((base64String) {
    print('Base64 String: \$base64String');
  });

  // Example: Color Serialization
  Color color = ColorJsonHelper.fromJson(0xFF123456)!;
  print('Serialized Color: \${ColorJsonHelper.toJson(color)}');

  // Example: Enum Conversion
  String? enumString = EnumUtils.enumToString(MyEnum.optionOne);
  MyEnum? enumValue = enumFromString(MyEnum.values, 'optionOne');
  print('Enum to String: \$enumString');
  print('String to Enum: \$enumValue');
}

// Example Model Class
class MyModel {
  final int id;
  final String name;

  MyModel({required this.id, required this.name});

  factory MyModel.fromJson(Map<String, dynamic> json) {
    return MyModel(id: json['id'], name: json['name']);
  }

  @override
  String toString() => 'MyModel(id: \$id, name: \$name)';
}

// Example Enum
enum MyEnum { optionOne, optionTwo }