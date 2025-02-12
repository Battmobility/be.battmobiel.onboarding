import 'dart:typed_data';

import 'package:batt_onboarding/src/data/onboarding_datasource.dart';

final class OnboardingRepository {
  final OnboardingDatasource datasource = OnboardingDatasource();

  Future<int> getOnboardingProgress() async {
    return Future.value(0); // TODO: add proper endpoint once defined
  }

  Future<bool> postConvictions(Map<String, dynamic> convictons) async {
    return await datasource.postConvictions(convictons);
  }

  Future<bool> postDocuments(Map<String, dynamic> documents) async {
    final docsMap = {
      "backDriverLicense": documents["backDriverLicense"] as Uint8List,
      "frontDriverLicense": documents["frontDriverLicense"] as Uint8List,
      "backId": documents["backId"] as Uint8List,
      "frontId": documents["frontId"] as Uint8List
    };

    return await datasource.postDocuments(docsMap);
  }

  Future<bool> postPersonalData(Map<String, dynamic> personalData) async {
    return await datasource.postPersonalData(personalData);
  }
}
