import 'package:batt_kit/api/generated/batt_kit.swagger.dart' as api;
import 'package:batt_onboarding/src/domain/subscription.dart';

extension ToDomain on Iterable<api.Subscription>? {
  List<Subscription> toDomain() {
    if (this == null || (this ?? []).isEmpty) {
      return [];
    }
    return this!.map((sub) => sub.toDomain()).toList();
  }
}

extension ApiToDomain on api.Subscription {
  Subscription toDomain() {
    return Subscription(
      id: id,
      clientId: clientId,
      clientName: clientName,
      clientRoles: clientRoles?.name,
      commitment: commitment,
      subscriptionType: subscriptionType,
      startDate: startDate,
      endDate: endDate,
      subscriptionContract: subscriptionContract?.toDomain(),
      delegatedTrustClientId: delegatedTrustClientId,
      possibleFormulas:
          possibleFormulas?.map((formula) => formula.toDomain()).toList(),
      vehicleId: vehicleId,
      vehicles: vehicles,
    );
  }
}

extension ApiContractToDomain on api.SubscriptionContract {
  SubscriptionContract toDomain() {
    return SubscriptionContract(
      commitment: commitment,
      subscriptionType: subscriptionType,
      startDate: startDate,
      endDate: endDate,
    );
  }
}

extension ApiBattFormulaToDomain on api.BattFormula {
  BattFormula toDomain() {
    return BattFormula(
      type: type.toDomain(),
      warrantyAmount: warrantyAmount,
      minCommitment: minCommitment,
    );
  }
}

extension ApiBattFormulaTypeToDomain on api.BattFormulaType? {
  BattFormulaType toDomain() {
    switch (this) {
      case api.BattFormulaType.battfan:
        return BattFormulaType.battFan;
      case api.BattFormulaType.battfanplus:
        return BattFormulaType.battFanPlus;
      case api.BattFormulaType.battfun:
        return BattFormulaType.battFun;
      case api.BattFormulaType.battfunplus:
        return BattFormulaType.battFunPlus;
      case api.BattFormulaType.batt4bussiness:
        return BattFormulaType.battForBusiness;
      default:
        return BattFormulaType.battFun;
    }
  }
}
