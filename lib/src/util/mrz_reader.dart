import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

final class MRZReader {
  Future<void> readImage(
      File imageFile,
      Function(String? rrn, String? surName, String? firstName,
              String? licenseNumber)
          onDataFound) async {
    if (kIsWeb) {
      onDataFound(null, null, null, null);
      return;
    }
    final inputImage = InputImage.fromFile(imageFile);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    // iOS
    // FRONT
    // 5-0: Surname
    // 5-1: First name
    // 6-1: Birthplace Birthdate (D mmm yyyy)
    // 9-0: Nationality
    // 11-0: Card number
    // 13-0: Valid from - valid to (D.M.yyyy)
    // 19-0: Sex

    // BACK
    // 1-0: RRN
    // 5-1: RRN at end with 1 char before and one after
    // 5-1: SURNAME<<FIRST NAME<MIDDLE NAME<MIDDLE NAME<<<<<<

    // ANDROID
    // FRONT
    // 3-0: Surname
    // 4-1: Voornamen / Given names First name
    // 6-1: Nationality BELG
    // 7-0: Birthplace Birthdate (D mmm yyyy)
    // 9-0: Card number

    // BACK
    // 0-2: RRN
    // 7-0: RRN at end with 1 char before and one after
    // 7-1: SURNAME<<FIRST NAME<MIDDLE NAME<MIDDLE NAME<<<<<<

    String? rrn;
    String? surName;
    String? givenName;
    for (final block in recognizedText.blocks) {
      // TODO try drivers license OCR
      for (final line in block.lines) {
        final String text = line.text.replaceAll(" ", "");
        if ((text.contains("<<<<") || text.contains("««")) &&
            !text.startsWith("IDBEL")) {
          final nameParts = line.text
              .split("<<")
              .map((rawPart) => rawPart..replaceAll(" ", ""))
              .where((candidate) => candidate.length > 1)
              .toList();
          surName = nameParts.isNotEmpty
              ? nameParts.first.replaceAll("<", " ")
              : null;
          givenName =
              nameParts.length > 1 ? nameParts[1].split("<").first : null;
        } else if (text.length == 30 && !text.contains("<<")) {
          rrn = text.substring(text.length - 12, text.length - 1);
        }
      }
    }
    onDataFound(rrn, surName?.capitalized, givenName?.capitalized, null);
  }
}

extension StringCasingExtension on String {
  String get capitalized =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String get toTitleCase => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.capitalized)
      .join(' ');
}
