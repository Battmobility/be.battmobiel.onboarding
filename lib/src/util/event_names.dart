enum EventNames {
  continueLaterPressed,
  continueLaterCanceled,
  moreInfoPressed,
  idUploaded,
  idUploadFailed,
  drivingLicenseUploaded,
  drivingLicenseUploadFailed
}

extension Named on EventNames {
  String get name => toString().split('.').last;
}
