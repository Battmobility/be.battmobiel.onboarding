import 'dart:typed_data';

import 'package:batt_onboarding/src/data/onboarding_datasource.dart';
import 'package:image_picker/image_picker.dart';
import 'package:universal_io/io.dart';

final class OnboardingRepository {
  final OnboardingDatasource datasource = OnboardingDatasource();

  Future<int> getOnboardingProgress() async {
    return Future.value(0); // TODO: add proper endpoint once defined
  }

  Future<bool> postConvictions(Map<String, dynamic> convictons) async {
    return await datasource.postConvictions(convictons);
  }

  Future<bool> postFiles(Map<String, dynamic> files) async {
    final docsMap = {
      "backDriverLicense": files["backDriverLicense"] as XFile,
      "frontDriverLicense": files["frontDriverLicense"] as XFile,
      "backId": files["backId"] as XFile,
      "frontId": files["frontId"] as XFile
    };

    return await datasource.postFiles(docsMap);
  }

  Future<bool> postPersonalData(Map<String, dynamic> personalData) async {
    return await datasource.postPersonalData(personalData);
  }
}
