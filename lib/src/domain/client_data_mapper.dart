import 'package:batt_onboarding/api/generated/mobile_api.swagger.dart' as api;

extension FromMap on Map<String, dynamic> {
  api.ContractsCreateClient toClientCreation() {
    return api.ContractsCreateClient(
      name: this["name"],
      email: this["email"],
      city: this["city"],
      country: this["country"],
      houseNumber: this["houseNumber"],
      postalCode: this["postalCode"],
      street: this["street"],
      vat: this["vat"],
    );
  }
}
