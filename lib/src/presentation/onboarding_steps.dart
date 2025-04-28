import 'package:batt_onboarding/src/util/mrz_reader.dart';

enum OnboardingSteps {
  intro,
  personal,
  address,
  phone,
  phoneVerification,
  documentsExplainer,
  idDocuments,
  driversLicense,
  legal,
  legalDetails,
  deposit,
  confirmation
}

extension OnboardingStepName on OnboardingSteps {
  String get name => toString().split('.').last.capitalized;
}

extension Skip on OnboardingSteps {
  bool get canSkip {
    switch (this) {
      case OnboardingSteps.intro:
      case OnboardingSteps.personal:
      case OnboardingSteps.address:
      case OnboardingSteps.phoneVerification:
      case OnboardingSteps.confirmation:
        return false;
      case OnboardingSteps.phone:
      case OnboardingSteps.legal:
      case OnboardingSteps.legalDetails:
      case OnboardingSteps.deposit:
      case OnboardingSteps.documentsExplainer:
      case OnboardingSteps.idDocuments:
      case OnboardingSteps.driversLicense:
        return true;
    }
  }
}
