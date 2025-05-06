enum AnalyticsAction {
  startOnboarding,
  createCredentials,
  viewIntro,
  editPersonalData,
  editAddress,
  enterPhone,
  confirmPhone,
  uploadId,
  uploadLicense,
  enterAccidents,
  enterConvictions,
  pickFormula,
  createClient,
  pickFleet,
  payDeposit,
  allowNotifications,
  finishOnboarding,
  exitOnboarding,
  viewExplainer,
  goBack
}

extension Named on AnalyticsAction {
  String get name {
    switch (this) {
      case AnalyticsAction.startOnboarding:
        return 'start_onboarding';
      case AnalyticsAction.createCredentials:
        return 'create_credentials';
      case AnalyticsAction.viewIntro:
        return 'view_intro';
      case AnalyticsAction.editPersonalData:
        return 'edit_personal_data';
      case AnalyticsAction.editAddress:
        return 'edit_address';
      case AnalyticsAction.enterPhone:
        return 'enter_phone';
      case AnalyticsAction.confirmPhone:
        return 'confirm_phone';
      case AnalyticsAction.uploadId:
        return 'upload_id';
      case AnalyticsAction.uploadLicense:
        return 'upload_license';
      case AnalyticsAction.enterAccidents:
        return 'enter_accidents';
      case AnalyticsAction.enterConvictions:
        return 'enter_convictions';
      case AnalyticsAction.pickFormula:
        return 'pick_formula';
      case AnalyticsAction.createClient:
        return 'create_client';
      case AnalyticsAction.pickFleet:
        return 'pick_fleet';
      case AnalyticsAction.payDeposit:
        return 'pay_deposit';
      case AnalyticsAction.allowNotifications:
        return 'allow_notifications';
      case AnalyticsAction.finishOnboarding:
        return 'finish_onboarding';
      case AnalyticsAction.exitOnboarding:
        return 'exit_onboarding';
      case AnalyticsAction.viewExplainer:
        return 'view_explainer';
      case AnalyticsAction.goBack:
        return 'go_back';
    }
  }
}
