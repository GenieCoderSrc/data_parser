# Changelog

All notable changes to this project will be documented in this file.

## 0.0.3
- update example file. 

## 0.0.2
### Added 
- **HttpResponseDataParserImpl**: Class to parse HTTP response data, handling the "status" and "data" fields in JSON responses.
- **ListDataParserServiceImpl**: Class to parse lists of data with methods to convert them using custom converters.
- **FileToBase64String**: Extension on `File` class to convert files to Base64 encoded strings.
- **ColorJsonHelper**: Helper class to convert `Color` objects to and from JSON.
- **IconDataJsonHelper**: Helper class to convert `IconData` objects to and from JSON.
- **TextStyleJsonHelper**: Helper class to convert `TextStyle` objects to and from JSON.
- **enumFromString**: Utility function to convert strings to enum values.
- **EnumUtils**: Helper method to convert enum values to strings.



## 0.0.1
### Initial release
- The first version of the `data_parser` package, designed for handling various data parsing tasks in Flutter, including JSON parsing, file encoding, and handling of common Flutter types (e.g., `Color`, `IconData`, `TextStyle`).
