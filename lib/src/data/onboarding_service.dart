import 'package:batt_onboarding/api/generated/mobile_api.swagger.dart';
import 'package:batt_onboarding/src/data/api_factory.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:universal_io/io.dart' as uio;
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' as http_parser;
import 'token_service.dart';

final class OnboardingService {
  MobileApi get api => ApiFactory.getMobileApi();

  Future<int> getOnboardingProgress() async {
    return Future.value(0); // TODO: add proper endpoint once defined
  }

  Future<bool> postConvictions(ContractsOnboardingLegal convictions) async {
    final response = await api.userV1UsersOnboardingLegalPut(body: convictions);
    return response.isSuccessful;
  }

  Future<bool> postDocsHttp(Map<String, XFile> documents) async {
    try {
      List<int> backDriverLicense =
          await documents["backDriverLicense"]!.readAsBytes();
      List<int> frontDriverLicense =
          await documents["frontDriverLicense"]!.readAsBytes();
      List<int> backId = await documents["backId"]!.readAsBytes();
      List<int> frontId = await documents["frontId"]!.readAsBytes();

      final response = await api.userV1UsersOnboardingDocumentsPut(
          backDriverLicense: MultipartFile.fromBytes(
              "backDriverLicense", backDriverLicense,
              filename: 'backDriverLicense.jpg'),
          frontDriverLicense: MultipartFile.fromBytes(
              "frontDriverLicense", frontDriverLicense,
              filename: 'frontDriverLicense.jpg'),
          backId:
              MultipartFile.fromBytes("backId", backId, filename: 'backId.jpg'),
          frontId: MultipartFile.fromBytes("frontId", frontId,
              filename: 'frontId.jpg'));

      return response.isSuccessful;
    } catch (e, _) {
      return false;
    }
  }

  Future<bool> postPersonalData(
      ContractsOnboardingPersonal personalData) async {
    try {
      final response =
          await api.userV1UsersOnboardingPersonalPut(body: personalData);
      return response.isSuccessful;
    } catch (e, _) {
      return false;
    }
  }

/*
  Future<bool> postDocsHttp(Map<String, XFile> documents) async {
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(
          "https://api-staging.battmobility.be/user/v1/users/onboarding/documents"),
    );
    final token = TokenService.instance.accessToken;

    request.headers.addAll(
      {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'},
    );

    for (final fileEntry in documents.entries) {
      final bytes = await fileEntry.value.readAsBytes();
      request.files.add(
        http.MultipartFile.fromBytes(
          fileEntry.key,
          bytes,
          contentType: http_parser.MediaType(
              'application', fileEntry.value.mimeType ?? "octet-stream"),
          filename: fileEntry.value.name,
        ),
      );
    }

    var streamedResponse = await request.send();
    var result = await http.Response.fromStream(streamedResponse);
    return result.statusCode == 200;
  }
*/ /*
  Future<bool> postDocsDio(Map<String, Uint8List> documents) async {
    //TODO: response.isSuccessful;
    final token = TokenService.instance.accessToken;
    final dio = Dio();

    final licenseBackFileBytes = documents["backDriverLicense"]!;

    FormData formData = FormData.fromMap({
      "backDriverLicense": licenseBackFileBytes,
    });
    final response = await dio.put(
        "https://api-staging.battmobility.be/user/v1/users/onboarding/documents",
        data: formData,
        options: Options(headers: {'Authorization': 'Bearer $token'}));

    return response.statusCode == 200;
  }
  */
}
