import 'package:batt_onboarding/api/generated/mobile_api.models.swagger.dart';

import '../../api/generated/mobile_api.enums.swagger.dart';

extension ContractDataMapper on Map<String, dynamic> {
  CreateNewUsageContractRequest toContract() {
    return CreateNewUsageContractRequest(
        formula: (this["formula"] as String).toApi(),
        commitmentAmountInclVat: double.tryParse(this['commitment']),
        startDate: DateTime.now().toUtc());
  }
}

extension SubscriptionTypeMapper on String {
  ClientContractFormula toApi() {
    switch (this) {
      case "battFan":
        return ClientContractFormula.battfan;
      case "battFun":
        return ClientContractFormula.battfun;
      case "battMax":
        return ClientContractFormula.battmax;
      default:
        return ClientContractFormula.battfun;
    }
  }
}
