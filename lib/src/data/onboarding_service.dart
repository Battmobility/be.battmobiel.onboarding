import 'package:batt_onboarding/api/generated/mobile_api.swagger.dart';
import 'package:batt_onboarding/src/data/api_factory.dart';
import 'package:flutter/foundation.dart';

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
      return response.isSuccessful;
    } catch (e, _) {
      return false;
    }
  }

  Future<bool> postPersonalData(Map<String, String> formData) async {
    // final response = await api.userV1UsersMePut(body: formData);
    return false;
  }
}
