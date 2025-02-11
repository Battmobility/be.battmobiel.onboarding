import 'dart:io';

import 'package:flutter/foundation.dart';

extension FromMap on Map<String, File> {
  Future<Map<String, String>> toBinaryStringMap() async {
    final convertedMap = <String, String>{};
    for (final entry in entries) {
      final file = entry.value;
      final binaryString = await file.toBinaryString();
      convertedMap[entry.key] = binaryString;
    }
    return convertedMap;
  }
}

extension Base64String on File {
  Future<String> toBinaryString() async {
    final filzeSize = await length();
    print("${filzeSize / 1024}");

    Uint8List bytes = await readAsBytes();

    String binaryString = '';
    for (var byte in bytes) {
      binaryString += byte.toRadixString(2).padLeft(8, '0');
    }
    return binaryString;
  }
}
