import 'package:batt_kit/api/generated/batt_kit.swagger.dart';

extension FromMap on Map<String, dynamic> {
  OnboardingLegal toContractsOnboardingLegal() {
    return OnboardingLegal(
      convictions: Convictions(
          convictionBloodTestRefusal:
              this["convictionBloodTestRefusal"] == true,
          convictionDrunk: this["convictionDrunk"] == true,
          convictionHitAndRun: this["convictionHitAndRun"] == true,
          convictionIntoxicated: this["convictionIntoxicated"] == true,
          convictionLicenseRevocation: this["convictionDrunk"] == true),
      nrOfAccidents: this["nrOfAccidents"],
    );
  }
}

extension ToMap on OnboardingLegal {
  Map<String, dynamic> toMap() {
    return {
      "convictionBloodTestRefusal": convictions.convictionBloodTestRefusal,
      "convictionDrunk": convictions.convictionDrunk,
      "convictionHitAndRun": convictions.convictionHitAndRun,
      "convictionIntoxicated": convictions.convictionIntoxicated,
      "convictionLicenseRevocation": convictions.convictionLicenseRevocation,
      "nrOfAccidents": nrOfAccidents,
    };
  }
}
