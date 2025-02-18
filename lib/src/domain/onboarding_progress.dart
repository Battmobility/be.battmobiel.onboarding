import 'package:batt_onboarding/api/generated/mobile_api.swagger.dart';

final class OnboardingProgress {
  final Map<String, dynamic> legal;
  final Map<String, dynamic> personal;
  int progress;

  OnboardingProgress({
    required this.legal,
    required this.personal,
    required this.progress,
  });

  factory OnboardingProgress.fromContract(ContractsOnboarding? contract) {
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
        progress: contract.progress,
      );
    } else {
      return OnboardingProgress(
        legal: {},
        personal: {},
        progress: 0,
      );
    }
  }
}

extension Progress on ContractsOnboarding {
  int get progress {
    switch (status) {
      case ContractsOnboardingStatus.completed:
        return 5;
      case ContractsOnboardingStatus.phone:
        return 4;
      case ContractsOnboardingStatus.personal:
        return 3;
      case ContractsOnboardingStatus.conviction:
        return 1;
      default:
        return 0; // Default progress if status is unknown or not applicable
    }
  }
}
