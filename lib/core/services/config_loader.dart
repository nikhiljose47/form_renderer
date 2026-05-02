import 'dart:convert';
import 'package:flutter/services.dart';

class ConfigLoader {

  // Load the data as Map from the given json path
  static Future<Map<String, dynamic>> load(String path) async {
    final jsonString = await rootBundle.loadString(path);
    final data = json.decode(jsonString);
    return Map<String, dynamic>.from(data);
  }
}
