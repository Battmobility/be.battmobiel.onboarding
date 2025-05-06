import 'package:batt_kit/api/generated/batt_kit.swagger.dart';

extension FromMap on Map<String, dynamic> {
  OnboardingPersonal toOnboardingPersonal() {
    return OnboardingPersonal(
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

extension ToMap on OnboardingPersonal {
  Map<String, dynamic> toMap() {
    return {
      "box": box,
      "city": city,
      "dateCurrentLicense": dateCurrentLicense.toUtc(),
      "dateLicenseUntil": dateLicenseUntil.toUtc(),
      "dateOfBirth": dateOfBirth.toUtc(),
      "firstName": firstName,
      "houseNumber": houseNumber,
      "lastName": lastName,
      "licenseNumber": licenseNumber,
      "licenseType": licenseType.value,
      "nationality": nationality,
      "postalCode": postalCode,
      "socialSecurityNumber": socialSecurityNumber,
      "street": street,
    };
  }
}

extension FromString on String {
  OnboardingPersonalLicenseType toContractsOnboardingPersonalLicenseType() {
    if (this == "BELGIAN") {
      return OnboardingPersonalLicenseType.belgian;
    } else if (this == "EUROPEAN") {
      return OnboardingPersonalLicenseType.european;
    } else {
      return OnboardingPersonalLicenseType.other;
    }
  }
}
