import 'package:batt_onboarding/src/data/onboarding_datasource.dart';
import 'package:batt_onboarding/src/domain/onboarding_progress.dart';
import 'package:image_picker/image_picker.dart';

final class OnboardingRepository {
  final OnboardingDatasource datasource = OnboardingDatasource();

  Future<OnboardingProgress?> getOnboardingProgress() async {
    return await datasource.getOnboardingProgress();
  }

  Future<bool> postConvictions(Map<String, dynamic> convictons) async {
    return await datasource.postConvictions(convictons);
  }

  Future<bool> postIdFiles(Map<String, dynamic> idFiles) async {
    try {
      final docsMap = {
        "backId": idFiles["backId"] as XFile,
        "frontId": idFiles["frontId"] as XFile,
        "backDriverLicense": idFiles["backDriverLicense"] as XFile,
        "frontDriverLicense": idFiles["frontDriverLicense"] as XFile,
      };
      return await datasource.postIdFiles(docsMap);
    } catch (e, _) {
      if (e is TypeError) {
        return false;
      }
      rethrow;
    }
  }

  Future<bool> postPersonalData(Map<String, dynamic> personalData) async {
    return await datasource.postPersonalData(personalData);
  }

  Future<bool> postPhoneNumber(String phone) async {
    return await datasource.postPhoneNumber(phone);
  }

  Future<bool> postVerificationCode(String phone, String code) async {
    return await datasource.postVerificationCode(phone, code);
  }

  Future<int?> postNewClientData(Map<String, dynamic> values) async {
    return await datasource.postNewClientData(values);
  }

  Future<bool> postNewContractData(Map<String, dynamic> values) async {
    return await datasource.postNewContractData(
      values["clientId"],
      values["delegatedTrustClientId"] ?? 0,
      values,
    );
  }
}
