import 'package:batt_onboarding/api/generated/mobile_api.swagger.dart';

extension FromMap on Map<String, dynamic> {
  ContractsOnboardingPersonal toContractsOnboardingPersonal() {
    return ContractsOnboardingPersonal(
      box: this["box"],
      city: this["city"],
      dateCurrentLicense: this["dateCurrentLicense"],
      dateLicenseUntil: this["dateLicenseUntil"],
      dateOfBirth: this["dateOfBirth"],
      firstName: this["firstName"],
      houseNumber: this["houseNumber"],
      lastName: this["lastName"],
      licenseNumber: this["licenseNumber"],
      licenseType: this["licenseType"],
      nationality: this["nationality"],
      postalCode: this["postalCode"],
      socialSecurityNumber: this["socialSecurityNumber"],
      street: this["street"],
    );
  }
}
