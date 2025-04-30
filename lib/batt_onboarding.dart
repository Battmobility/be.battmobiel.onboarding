library;

import 'package:batt_onboarding/src/data/api_factory.dart';
import 'package:batt_onboarding/src/domain/onboarding_progress.dart';
import 'package:batt_onboarding/src/domain/onboarding_repository_provider.dart';

import 'src/data/token_service.dart';

export 'src/presentation/batt_onboarding_ui.dart';
export 'src/presentation/onboarding_landing_form.dart';
export 'src/domain/onboarding_progress.dart';

Future<OnboardingProgress> getOnboardingStatus(
    String? apiUri, String? accessToken) async {
  if (accessToken != null) {
    ApiFactory.init(apiUri: apiUri);
    TokenService(accessToken);
    final progress = await onboardingRepository.getOnboardingProgress();
    return progress ?? OnboardingProgress.none();
  } else {
    return OnboardingProgress.none();
  }
}
