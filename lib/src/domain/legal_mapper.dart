import 'package:batt_onboarding/api/generated/mobile_api.swagger.dart';

extension FromMap on Map<String, dynamic> {
  ContractsOnboardingLegal toContractsOnboardingLegal() {
    return ContractsOnboardingLegal(
      convictions: ContractsConvictions(
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

extension ToMap on ContractsOnboardingLegal {
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
