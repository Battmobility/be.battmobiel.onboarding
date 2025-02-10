import 'package:batt_onboarding/src/data/onboarding_service.dart';
import 'package:batt_onboarding/src/domain/legal_mapper.dart';

final class OnboardingDatasource {
  final OnboardingService service = OnboardingService();

  OnboardingDatasource();

  Future<int> getOnboardingProgress() async {
    return await service.getOnboardingProgress();
  }

  Future<bool> postConvictions(Map<String, dynamic> convictions) async {
    return service.postConvictions(convictions.toContractsOnboardingLegal());
  }

  Future<bool> postFile(Map<String, dynamic> convictions) async {
    return false;
  }

  Future<bool> postPersonalData(Map<String, String> formData) async {
    return false;
  }
}
