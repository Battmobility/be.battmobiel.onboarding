import 'package:batt_kit/api/generated/batt_kit.swagger.dart' as api;
import 'package:batt_onboarding/src/domain/subscription.dart';
import 'package:batt_onboarding/src/domain/subscription_mapper.dart';

final class OnboardingProgress {
  final Map<String, dynamic> legal;
  final Map<String, dynamic> personal;
  int progress;
  final List<Subscription> subscriptions;

  OnboardingProgress({
    required this.legal,
    required this.personal,
    required this.progress,
    required this.subscriptions,
  });

  factory OnboardingProgress.fromContract(api.Onboarding? contract) {
    if (contract != null) {
      return OnboardingProgress(
        legal: {
          "convictionBloodTestRefusal":
              contract.legal?.convictions.convictionBloodTestRefusal,
          "convictionDrunk": contract.legal?.convictions.convictionDrunk,
          "convictionHitAndRun":
              contract.legal?.convictions.convictionHitAndRun,
          "convictionIntoxicated":
              contract.legal?.convictions.convictionIntoxicated,
          "convictionLicenseRevocation":
              contract.legal?.convictions.convictionLicenseRevocation,
          "nrOfAccidents": contract.legal?.nrOfAccidents,
          "answeredTruthfully": contract.progress > 0,
        },
        personal: {
          "box": contract.personal?.box,
          "city": contract.personal?.city,
          "dateCurrentLicense": contract.personal?.dateCurrentLicense,
          "dateLicenseUntil": contract.personal?.dateLicenseUntil,
          "dateOfBirth": contract.personal?.dateOfBirth,
          "firstName": contract.personal?.firstName,
          "houseNumber": contract.personal?.houseNumber,
          "lastName": contract.personal?.lastName,
          "licenseNumber": contract.personal?.licenseNumber,
          "licenseType": contract.personal?.licenseType.value,
          "nationality": contract.personal?.nationality,
          "postalCode": contract.personal?.postalCode,
          "socialSecurityNumber": contract.personal?.socialSecurityNumber,
          "street": contract.personal?.street,
        },
        subscriptions:
            (contract.$client?.subscriptions ?? List<api.Subscription>.empty())
                .toDomain(),
        progress: contract.progress,
      );
    } else {
      return OnboardingProgress(
        legal: {},
        personal: {},
        subscriptions: [],
        progress: 0,
      );
    }
  }

  factory OnboardingProgress.none() {
    return OnboardingProgress(
      legal: {},
      personal: {},
      subscriptions: [],
      progress: 0,
    );
  }
}

extension Progress on api.Onboarding {
  int get progress {
    switch (status) {
      case api.OnboardingStatus.completed:
        return 5;
      case api.OnboardingStatus.phone:
        return 4;
      case api.OnboardingStatus.personal:
        return 3;
      case api.OnboardingStatus.documents:
        return 2;
      case api.OnboardingStatus.conviction:
        return 1;
      default:
        return 0; // Default progress if status is unknown or not applicable
    }
  }
}
