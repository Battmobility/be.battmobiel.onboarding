import 'package:batt_onboarding/src/data/onboarding_service.dart';
import 'package:batt_onboarding/src/domain/legal_mapper.dart';
import 'package:batt_onboarding/src/domain/personal_data_mapper.dart';
import 'package:image_picker/image_picker.dart';

import '../domain/onboarding_progress.dart';

final class OnboardingDatasource {
  final OnboardingService service = OnboardingService();

  OnboardingDatasource();

  Future<OnboardingProgress?> getOnboardingProgress() async {
    final contract = await service.getOnboardingProgress();
    return OnboardingProgress.fromContract(contract);
  }

  Future<bool> postConvictions(Map<String, dynamic> convictions) async {
    return service.postConvictions(convictions.toContractsOnboardingLegal());
  }

  Future<bool> postFiles(Map<String, XFile> documents) async {
    return service.postDocsHttp(documents);
  }

  Future<bool> postPersonalData(Map<String, dynamic> formData) async {
    return service.postPersonalData(formData.toContractsOnboardingPersonal());
  }

  Future<bool> postPhoneNumber(String phone) async {
    return service.postPhoneNumber(phone);
  }

  Future<bool> postVerificationCode(String phone, String code) async {
    return service.postVerificationCode(phone, code);
  }

  Future<bool> postNewClientData(Map<String, dynamic>? values) {
    return Future.value(false);
  }

  Future<bool> postNewContractData(Map<String, dynamic>? values) {
    return Future.value(false);
  }
}
