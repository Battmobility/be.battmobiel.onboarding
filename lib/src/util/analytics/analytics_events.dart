enum AnalyticsEvent {
  backPressed,
  continueLaterPressed,
  continueLaterCanceled,
  moreInfoPressed,
  scanIdBackPressed,
  idUploaded,
  idUploadFailed,
  drivingLicenseUploaded,
  drivingLicenseUploadFailed
}

extension Named on AnalyticsEvent {
  String get name => toString().split('.').last;
}
