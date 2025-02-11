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

extension BinaryString on File {
  Future<String> toBinaryString() async {
    Uint8List bytes = await readAsBytes();
    String binaryString = '';
    for (var byte in bytes) {
      binaryString += byte.toRadixString(2).padLeft(8, '0');
    }
    return binaryString;
  }
}
