# data_parser

A Flutter package providing utilities for parsing HTTP responses, lists, file data, colors, icons, text styles, and enum conversions.

## Features
- **HTTP Response Parsing**: Extract meaningful data from API responses.
- **List Data Parsing**: Convert future or stream-based data lists into model objects.
- **File Extensions**: Convert files to Base64 strings.
- **Color and Icon Data Helpers**: Serialize and deserialize `Color` and `IconData` objects.
- **Text Style Serialization**: Convert `TextStyle` objects to and from JSON.
- **Utility Functions**:
    - Convert between `String` and `int` safely.
    - Convert between enum values and strings.

## Installation
Add this to your `pubspec.yaml` file:

```yaml
dependencies:
  data_parser: latest_version
```

Then, run:
```sh
flutter pub get
```

## Usage
Import the package:

```dart
import 'package:data_parser/data_parser.dart';
```

### Parsing HTTP Responses
```dart
HttpResponseDataParserImpl parser = HttpResponseDataParserImpl();
Map<String, dynamic>? parsedData = parser.parseHttpResponse(apiResponse);
```

### Parsing Lists
```dart
ListDataParserServiceImpl<MyModel> listParser = ListDataParserServiceImpl();
List<MyModel>? models = listParser.parseFutureDataList(
  mapList: dataList,
  converter: (item) => MyModel.fromJson(item),
);
```

### Converting Files to Base64
```dart
File file = File('path/to/file.jpg');
String base64String = await file.toBase64String();
```

### Working with Colors and Icons
```dart
Color color = ColorJsonHelper.fromJson(0xFF123456);
Map<String, dynamic>? iconJson = IconDataJsonHelper.toJson(Icons.home);
```

### Enum Conversion
```dart
enum MyEnum { optionOne, optionTwo }

String? enumString = EnumUtils.enumToString(MyEnum.optionOne);
MyEnum? enumValue = enumFromString(MyEnum.values, 'optionOne');
```

## Contributing
Contributions are welcome! Please open an issue or submit a pull request on GitHub.

## License
This package is released under the MIT License.

