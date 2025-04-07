# data_parser

A package for parsing and converting various data types in Flutter, including JSON, HTTP responses, and lists. It provides a set of utility classes and extensions for easier data handling.

## Features

- Parse HTTP response data (`IHttpResponseDataParser`)
- Parse list data with different conversion methods (`IListDataParserService`)
- Utility extensions for converting files to Base64 (`FileToBase64String`)
- Helper classes for converting `Color`, `IconData`, and `TextStyle` to and from JSON
- Utility functions for enum conversions

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  data_parser: latest_version
```


### Parsing HTTP Responses
```dart
import 'package:data_parser/data/data_sources/list_data_parser_service_impl.dart';

final parser = HttpResponseDataParserImpl();
final responseData = parser.parseHttpResponse({
  'status': true,
  'data': {
    'key1': 'value1',
    'key2': 'value2',
  }
});

print(responseData);  // Outputs: {key1: value1, key2: value2}
```

### Parsing Lists
```dart
import 'package:data_parser/data/data_sources/list_data_parser_service_impl.dart';

final listParser = ListDataParserServiceImpl<MyModel>();

List<MyModel>? parsedList = listParser.parseFutureDataList(
  mapList: myJsonList,
  converter: (item) => MyModel.fromJson(item),
);

print(parsedList);

);
```

### Converting Files to Base64
```dart
import 'dart:io';
import 'package:data_parser/extensions/utility_parsers/file_extensions.dart';

File myFile = File('path_to_your_file');
String base64String = await myFile.toBase64String();

```

### Working with Colors and Icons
```dart
Color color = ColorJsonHelper.fromJson(0xFF123456);
Map<String, dynamic>? iconJson = IconDataJsonHelper.toJson(Icons.home);
```

### Enum Conversion
```dart
import 'package:data_parser/utils/enum_from_string.dart';

enum MyEnum { first, second }

MyEnum? enumValue = enumFromString(MyEnum.values, 'first');
print(enumValue);  // MyEnum.first

String? enumString = EnumUtils.enumToString(MyEnum.first);
print(enumString);  // first

```

### Convert Color to and from JSON:
```dart
import 'package:data_parser/helper/color_json_helper.dart';

Color color = Colors.blue;
int? colorJson = ColorJsonHelper.toJson(color);

Color? parsedColor = ColorJsonHelper.fromJson(colorJson);
```

### Convert IconData to and from JSON:
```dart
import 'package:data_parser/helper/icon_data_json_helper.dart';

IconData icon = Icons.star;
Map<String, dynamic>? iconJson = IconDataJsonHelper.toJson(icon);

IconData? parsedIcon = IconDataJsonHelper.fromJson(iconJson);

```

### Convert TextStyle to and from JSON:
```dart
import 'package:data_parser/helper/text_style_json_helper.dart';

TextStyle textStyle = TextStyle(color: Colors.red, fontSize: 20);
Map<String, dynamic>? textStyleJson = TextStyleJsonHelper.toJson(textStyle);

TextStyle? parsedTextStyle = TextStyleJsonHelper.fromJson(textStyleJson);
```

## Contributing
Contributions are welcome! Please open an issue or submit a pull request on GitHub.

## License
Make sure to adjust the version number in the `pubspec.yaml` file and the usage examples based on your specific implementation!


