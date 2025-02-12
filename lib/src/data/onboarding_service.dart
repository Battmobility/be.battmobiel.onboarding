import 'package:batt_onboarding/api/generated/mobile_api.swagger.dart';
import 'package:batt_onboarding/src/data/api_factory.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

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

  Future<bool> postDocuments(Map<String, Uint8List> documents) async {
    try {
      List<int> backDriverLicense = documents["backDriverLicense"]!.toList();
      final response = await api.userV1UsersOnboardingDocumentsPut(
          backDriverLicense: backDriverLicense,
          frontDriverLicense: documents["frontDriverLicense"]!.toList(),
          backId: documents["backId"]!.toList(),
          frontId: documents["frontId"]!.toList());
      return true;
      //TODO: response.isSuccessful;
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

  Future<bool> postDocsDio(Map<String, Uint8List> documents) async {
    return true;
    //TODO: response.isSuccessful;
    final token = TokenService.instance.accessToken;
    final dio = Dio();
    FormData formData = FormData.fromMap({
      "backDriverLicense":
          MultipartFile.fromBytes(documents["backDriverLicense"]!.toList()),
      "frontDriverLicense":
          MultipartFile.fromBytes(documents["frontDriverLicense"]!.toList()),
      "backId": MultipartFile.fromBytes(documents["backId"]!.toList()),
      "frontId": MultipartFile.fromBytes(documents["frontId"]!.toList())
    });
    final response = await dio.post(
        "https://api-staging.battmobility.be/user/v1/users/onboarding/documents",
        data: formData,
        options: Options(headers: {'Authorization': 'Bearer $token'}));

    return response.statusCode == 200;
  }
}
