import 'dart:io';

import 'package:batt_onboarding/src/data/onboarding_service.dart';
import 'package:batt_onboarding/src/domain/documents_mapper.dart';
import 'package:batt_onboarding/src/domain/legal_mapper.dart';

final class OnboardingDatasource {
  final OnboardingService service = OnboardingService();

  OnboardingDatasource();

  Future<int> getOnboardingProgress() async {
    return await service.getOnboardingProgress();
  }

  Future<bool> postConvictions(Map<String, dynamic> convictions) async {
    return service.postConvictions(convictions.toContractsOnboardingLegal());
  }

  Future<bool> postDocuments(Map<String, File> documents) async {
    final map = await documents.toBinaryStringMap();
    return service.postDocuments(map);
  }

  Future<bool> postPersonalData(Map<String, String> formData) async {
    return false;
  }
}
