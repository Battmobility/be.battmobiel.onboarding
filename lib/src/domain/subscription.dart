final class Subscription {
  final int? id;
  final int? clientId;
  final String? clientName;
  final String? clientRoles;
  final int? commitment;
  final String? subscriptionType;
  final DateTime? startDate;
  final DateTime? endDate;
  final SubscriptionContract? subscriptionContract;
  final int? delegatedTrustClientId;
  final List<BattFormula>? possibleFormulas;
  final String? vehicleId;
  final List<String>? vehicles;

  const Subscription({
    this.id,
    this.clientId,
    this.clientName,
    this.clientRoles,
    this.commitment,
    this.subscriptionType,
    this.startDate,
    this.endDate,
    this.subscriptionContract,
    this.delegatedTrustClientId,
    this.possibleFormulas,
    this.vehicleId,
    this.vehicles,
  });
}

final class SubscriptionContract {
  final int? commitment;
  final String? subscriptionType;
  final DateTime? startDate;
  final DateTime? endDate;

  const SubscriptionContract({
    this.commitment,
    this.subscriptionType,
    this.startDate,
    this.endDate,
  });
}

final class BattFormula {
  final BattFormulaType? type;
  final int? warrantyAmount;
  final int? minCommitment;

  const BattFormula({
    this.type,
    this.warrantyAmount,
    this.minCommitment,
  });
}

enum BattFormulaType {
  battFun,
  battFan,
  battFunPlus,
  battFunPlusDL,
  battFanPlus,
  battMax,
  battForBusiness,
}
