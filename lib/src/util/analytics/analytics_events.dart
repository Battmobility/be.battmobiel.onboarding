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
        return 'start-onboarding';
      case AnalyticsAction.createCredentials:
        return 'create-credentials';
      case AnalyticsAction.viewIntro:
        return 'view-intro';
      case AnalyticsAction.editPersonalData:
        return 'edit-personal-data';
      case AnalyticsAction.editAddress:
        return 'edit-address';
      case AnalyticsAction.enterPhone:
        return 'enter-phone';
      case AnalyticsAction.confirmPhone:
        return 'confirm-phone';
      case AnalyticsAction.uploadId:
        return 'upload-id';
      case AnalyticsAction.uploadLicense:
        return 'upload-license';
      case AnalyticsAction.enterAccidents:
        return 'enter-accidents';
      case AnalyticsAction.enterConvictions:
        return 'enter-convictions';
      case AnalyticsAction.pickFormula:
        return 'pick-formula';
      case AnalyticsAction.createClient:
        return 'create-client';
      case AnalyticsAction.pickFleet:
        return 'pick-fleet';
      case AnalyticsAction.payDeposit:
        return 'pay-deposit';
      case AnalyticsAction.allowNotifications:
        return 'allow-notifications';
      case AnalyticsAction.finishOnboarding:
        return 'finish-onboarding';
      case AnalyticsAction.exitOnboarding:
        return 'exit-onboarding';
      case AnalyticsAction.viewExplainer:
        return 'view-explainer';
      case AnalyticsAction.goBack:
        return 'go-back';
    }
  }
}
