import 'package:batt_onboarding/api/generated/mobile_api.swagger.dart';

extension FromMap on Map<String, dynamic> {
  ContractsOnboardingPersonal toContractsOnboardingPersonal() {
    return ContractsOnboardingPersonal(
      box: this["box"] ?? "",
      city: this["city"],
      dateCurrentLicense: (this["dateCurrentLicense"] as DateTime).toUtc(),
      dateLicenseUntil: (this["dateLicenseUntil"] as DateTime).toUtc(),
      dateOfBirth: (this["dateOfBirth"] as DateTime).toUtc(),
      firstName: this["firstName"],
      houseNumber: this["houseNumber"],
      lastName: this["lastName"],
      licenseNumber: this["licenseNumber"],
      licenseType: (this["licenseType"] as String)
          .toContractsOnboardingPersonalLicenseType(),
      nationality: this["nationality"],
      postalCode: this["postalCode"],
      socialSecurityNumber: this["socialSecurityNumber"],
      street: this["street"],
    );
  }
}

extension FromString on String {
  ContractsOnboardingPersonalLicenseType
      toContractsOnboardingPersonalLicenseType() {
    if (this == "BELGIAN") {
      return ContractsOnboardingPersonalLicenseType.belgian;
    } else if (this == "EUROPEAN") {
      return ContractsOnboardingPersonalLicenseType.european;
    } else {
      return ContractsOnboardingPersonalLicenseType.other;
    }
  }
}
