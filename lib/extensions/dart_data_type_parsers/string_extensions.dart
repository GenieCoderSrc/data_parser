import 'package:data_parser/extensions/helper_data/irregular_plurals.dart';

extension StringExtensions on String {
  int toInt() => int.tryParse(this) ?? -1;

  double? toDouble() => double.tryParse(this);

  // String toTitleCase() {
  //   return replaceAllMapped(
  //           RegExp(r'([a-z])([A-Z])'), (Match m) => '${m[1]} ${m[2]}')
  //       .split(' ')
  //       .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
  //       .join(' ');
  // }
  String toTitleCase() {
    final acronyms = ['API', 'DB', 'ID']; // Add more acronyms as needed

    return replaceAllMapped(RegExp(r'([a-z])([A-Z])'),
            (Match m) => '${m[1]} ${m[2]}') // Handle camelCase
        .split(RegExp(r'[_\s]+')) // Split by underscore or spaces
        .map((word) {
      final upperWord = word.toUpperCase();
      if (acronyms.contains(upperWord)) {
        return upperWord; // Keep acronyms fully capitalized
      }
      return word[0].toUpperCase() +
          word.substring(1).toLowerCase(); // Title case for normal words
    }).join(' ');
  }

  String toPluralCase() {
    // Ensure the string is not null or empty
    if (isEmpty) {
      return '';
    }

    final word = this;

    // Check for irregular plurals
    if (irregularPlurals.containsKey(word.toLowerCase())) {
      // Safely access the plural and capitalize it
      final plural = irregularPlurals[word.toLowerCase()]!;
      return word[0].toUpperCase() + plural.substring(1);
    }

    // Rule for words ending with 'y' (consonant + y -> ies)
    if (word.endsWith('y') && !isVowel(word[word.length - 2])) {
      return '${word.substring(0, word.length - 1)}ies';
    }

    // Rule for words ending with 's', 'x', 'z', 'ch', or 'sh' -> add 'es'
    if (RegExp(r'(s|x|z|ch|sh)$').hasMatch(word)) {
      return '${word}es';
    }

    // Default rule -> add 's'
    return '${word}s';
  }

  // Helper function to check if a character is a vowel
  bool isVowel(String char) {
    return 'aeiou'.contains(char.toLowerCase());
  }

  String toSnakeCase() {
    // Ensure the string is not null or empty
    if (isEmpty) {
      return '';
    }

    final word = this;

    // Remove any non-alphanumeric characters except for spaces
    final cleanWord = word.replaceAll(RegExp(r'[^\w\s]'), '');

    // Replace spaces and camelCase with underscores and convert to lowercase
    final snakeCase = cleanWord
        .replaceAllMapped(
            RegExp(r'([a-z])([A-Z])'), (Match m) => '${m[1]}_${m[2]}')
        .replaceAll(RegExp(r'\s+'), '_')
        .toLowerCase();

    return snakeCase;
  }
}
