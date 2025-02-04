import 'package:batt_onboarding/src/data/onboarding_service.dart';

final class OnboardingDatasource {
  final OnboardingService service = OnboardingService();

  OnboardingDatasource();

  Future<int> getOnboardingProgress() async {
    return await service.getOnboardingProgress();
  }

  Future<bool> postFormData(Map<String, String> formData) async {
    final user = await service.postFormData(formData);
    return user != null;
  }
}
