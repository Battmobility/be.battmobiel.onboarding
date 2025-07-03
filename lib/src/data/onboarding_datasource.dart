import 'package:batt_onboarding/src/data/onboarding_service.dart';
import 'package:batt_onboarding/src/domain/client_data_mapper.dart';
import 'package:batt_onboarding/src/domain/contract_data_mapper.dart';
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

  Future<bool> postIdFiles(Map<String, XFile> documents) async {
    return service.postIdFiles(documents);
  }

  Future<bool> postPersonalData(Map<String, dynamic> formData) async {
    return service.postPersonalData(formData.toOnboardingPersonal());
  }

  Future<bool> postPhoneNumber(String phone) async {
    return service.postPhoneNumber(phone);
  }

  Future<bool> postVerificationCode(String phone, String code) async {
    return service.postVerificationCode(phone, code);
  }

  Future<int?> postNewClientData(Map<String, dynamic> values) async {
    return service.postNewClientData(values.toClientCreation());
  }

  Future<bool> postNewContractData(int clientId, int? delegatedTrustClientId,
      Map<String, dynamic> values) async {
    return service.postNewContractData(
      clientId,
      delegatedTrustClientId,
      values.toContract(),
    );
  }
}
