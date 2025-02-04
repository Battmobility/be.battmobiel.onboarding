import 'package:batt_onboarding/api/generated/mobile_api.swagger.dart';
import 'package:batt_onboarding/src/data/api_factory.dart';

final class OnboardingService {
  MobileApi get api => ApiFactory.getMobileApi();

  Future<int> getOnboardingProgress() async {
    return Future.value(0); // TODO: add proper endpoint once defined
  }

  Future<User?> postFormData(Map<String, String> formData) async {
    final response = await api.userV1UsersMePut(body: formData);
    return response.body;
  }
}
