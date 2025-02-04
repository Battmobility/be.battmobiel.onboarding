import 'package:batt_onboarding/src/data/onboarding_datasource.dart';

final class OnboardingRepository {
  final OnboardingDatasource datasource = OnboardingDatasource();

  Future<int> getOnboardingProgress() async {
    return Future.value(0); // TODO: add proper endpoint once defined
  }

  Future<bool> postFormData(Map<String, String> formData) async {
    return await datasource.postFormData(formData);
  }
}
