import 'package:batt_onboarding/src/util/mrz_reader.dart';

enum OnboardingSteps {
  intro,
  personal,
  address,
  phone,
  phoneVerification,
  documentsExplainer,
  idDocuments,
  legal,
  deposit,
  confirmation
}

extension OnboardingStepName on OnboardingSteps {
  String get name => toString().split('.').last.capitalized;
}

extension Skip on OnboardingSteps {
  bool get hasNext {
    switch (this) {
      case OnboardingSteps.phoneVerification:
      case OnboardingSteps.phone:
      case OnboardingSteps.confirmation:
        return false;
      default:
        return true;
    }
  }

  bool get canSkip {
    switch (this) {
      case OnboardingSteps.intro:
      case OnboardingSteps.personal:
      case OnboardingSteps.address:
      case OnboardingSteps.confirmation:
        return false;
      case OnboardingSteps.phone:
      case OnboardingSteps.phoneVerification:
      case OnboardingSteps.legal:
      case OnboardingSteps.deposit:
      case OnboardingSteps.documentsExplainer:
      case OnboardingSteps.idDocuments:
        return false; // TODO: re-enable when deploying for app
    }
  }
}
