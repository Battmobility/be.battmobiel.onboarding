import 'package:batt_kit/api/generated/batt_kit.swagger.dart' as api;

extension FromMap on Map<String, dynamic> {
  api.CreateClient toClientCreation() {
    return api.CreateClient(
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
