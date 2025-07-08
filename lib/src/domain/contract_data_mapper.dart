import 'package:batt_kit/api/generated/batt_kit.enums.swagger.dart';
import 'package:batt_kit/api/generated/batt_kit.models.swagger.dart';

extension ContractDataMapper on Map<String, dynamic> {
  CreateNewUsageContractRequest toContract() {
    return CreateNewUsageContractRequest(
        formula: (this["formula"].toString()).toApi(),
        memo: "Created by onboarding v2",
        commitmentAmountInclVat: double.tryParse(this['commitment'].toString()),
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
      case "battFunPlus":
        return ClientContractFormula.battfunplus;
      case "battFanPlus":
        return ClientContractFormula.battfanplus;
      case "battForBusiness":
        return ClientContractFormula.battforbusiness;
      case "battFunPlusDL":
        return ClientContractFormula.battfunplusdl;
      case "battMax":
        return ClientContractFormula.battmax;
      default:
        return ClientContractFormula.battfun;
    }
  }
}
