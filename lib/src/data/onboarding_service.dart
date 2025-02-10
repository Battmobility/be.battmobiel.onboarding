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

  Future<bool> postFile(Uint8List bytes) async {
    //final response = await api.userV1UsersMeConvictionsPost(body: Uint8List bytes);
    return false;
  }

  Future<bool> postPersonalData(Map<String, String> formData) async {
    // final response = await api.userV1UsersMePut(body: formData);
    return false;
  }
}
