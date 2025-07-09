import 'package:batt_kit/api/generated/batt_kit.swagger.dart' as api;
import 'package:batt_onboarding/src/domain/subscription.dart';
import 'package:batt_onboarding/src/domain/subscription_mapper.dart';

final class OnboardingProgress {
  final Map<String, dynamic> legal;
  final Map<String, dynamic> personal;
  final Map<String, dynamic> phone;

  int progress;
  final List<Subscription> subscriptions;

  OnboardingProgress({
    required this.legal,
    required this.personal,
    required this.progress,
    required this.phone,
    required this.subscriptions,
  });

  factory OnboardingProgress.fromContract(api.Onboarding? onboarding) {
    if (onboarding != null) {
      return OnboardingProgress(
        legal: {
          "convictionBloodTestRefusal":
              onboarding.legal?.convictions.convictionBloodTestRefusal,
          "convictionDrunk": onboarding.legal?.convictions.convictionDrunk,
          "convictionHitAndRun":
              onboarding.legal?.convictions.convictionHitAndRun,
          "convictionIntoxicated":
              onboarding.legal?.convictions.convictionIntoxicated,
          "convictionLicenseRevocation":
              onboarding.legal?.convictions.convictionLicenseRevocation,
          "nrOfAccidents": onboarding.legal?.nrOfAccidents,
          "answeredTruthfully": onboarding.progress > 0,
        },
        personal: {
          "box": onboarding.personal?.box,
          "city": onboarding.personal?.city,
          "dateCurrentLicense": onboarding.personal?.dateCurrentLicense,
          "dateLicenseUntil": onboarding.personal?.dateLicenseUntil,
          "dateOfBirth": onboarding.personal?.dateOfBirth,
          "firstName": onboarding.personal?.firstName,
          "houseNumber": onboarding.personal?.houseNumber,
          "lastName": onboarding.personal?.lastName,
          "licenseNumber": onboarding.personal?.licenseNumber,
          "licenseType": onboarding.personal?.licenseType.value,
          "nationality": onboarding.personal?.nationality,
          "postalCode": onboarding.personal?.postalCode,
          "socialSecurityNumber": onboarding.personal?.socialSecurityNumber,
          "street": onboarding.personal?.street,
        },
        phone: {
          "phoneNumber": onboarding.phone?.phoneNumber,
        },
        subscriptions: (onboarding.$client?.subscriptions ??
                List<api.Subscription>.empty())
            .toDomain(),
        progress: onboarding.progress,
      );
    } else {
      return OnboardingProgress(
        legal: {},
        personal: {},
        phone: {},
        subscriptions: [],
        progress: 0,
      );
    }
  }

  factory OnboardingProgress.none() {
    return OnboardingProgress(
      legal: {},
      personal: {},
      phone: {},
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
