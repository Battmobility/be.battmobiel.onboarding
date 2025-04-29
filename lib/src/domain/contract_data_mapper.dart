import 'package:batt_kit/api/generated/batt_kit.enums.swagger.dart';
import 'package:batt_kit/api/generated/batt_kit.models.swagger.dart';

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
