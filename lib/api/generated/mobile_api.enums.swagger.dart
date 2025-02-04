import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

enum AdjacentNonAvailabilityType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('BOOKING')
  booking('BOOKING'),
  @JsonValue('NOT_AVAILABLE')
  notAvailable('NOT_AVAILABLE'),
  @JsonValue('BLOCKED')
  blocked('BLOCKED'),
  @JsonValue('NOT_ALLOWED')
  notAllowed('NOT_ALLOWED');

  final String? value;

  const AdjacentNonAvailabilityType(this.value);
}

enum BillingPriceUnit {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('DAYS')
  days('DAYS'),
  @JsonValue('HOURS')
  hours('HOURS');

  final String? value;

  const BillingPriceUnit(this.value);
}

enum BookingInvoiceStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('TO_BE_INVOICED')
  toBeInvoiced('TO_BE_INVOICED'),
  @JsonValue('NEEDS_CORRECTION')
  needsCorrection('NEEDS_CORRECTION'),
  @JsonValue('NOT_INVOICED')
  notInvoiced('NOT_INVOICED'),
  @JsonValue('INVOICED')
  invoiced('INVOICED');

  final String? value;

  const BookingInvoiceStatus(this.value);
}

enum BookingNextPossibleStatuses {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AWAITING_APPROVAL')
  awaitingApproval('AWAITING_APPROVAL'),
  @JsonValue('APPROVED')
  approved('APPROVED'),
  @JsonValue('REJECTED')
  rejected('REJECTED'),
  @JsonValue('CANCELED')
  canceled('CANCELED'),
  @JsonValue('CANCELED_REMOTE')
  canceledRemote('CANCELED_REMOTE'),
  @JsonValue('EXPIRED')
  expired('EXPIRED'),
  @JsonValue('ACTIVE')
  active('ACTIVE'),
  @JsonValue('STOPPED')
  stopped('STOPPED');

  final String? value;

  const BookingNextPossibleStatuses(this.value);
}

enum BookingStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AWAITING_APPROVAL')
  awaitingApproval('AWAITING_APPROVAL'),
  @JsonValue('APPROVED')
  approved('APPROVED'),
  @JsonValue('REJECTED')
  rejected('REJECTED'),
  @JsonValue('CANCELED')
  canceled('CANCELED'),
  @JsonValue('CANCELED_REMOTE')
  canceledRemote('CANCELED_REMOTE'),
  @JsonValue('EXPIRED')
  expired('EXPIRED'),
  @JsonValue('ACTIVE')
  active('ACTIVE'),
  @JsonValue('STOPPED')
  stopped('STOPPED');

  final String? value;

  const BookingStatus(this.value);
}

enum ConflictResolutionMode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('SPLIT')
  split('SPLIT'),
  @JsonValue('CANCEL_BOOKINGS')
  cancelBookings('CANCEL_BOOKINGS');

  final String? value;

  const ConflictResolutionMode(this.value);
}

enum CreateVehicleRequestApprovalType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AUTOMATIC')
  automatic('AUTOMATIC'),
  @JsonValue('FIRST_TIME_ONLY')
  firstTimeOnly('FIRST_TIME_ONLY'),
  @JsonValue('MANUAL')
  manual('MANUAL');

  final String? value;

  const CreateVehicleRequestApprovalType(this.value);
}

enum CreateVehicleRequestTimeZone {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('BRUSSELS')
  brussels('BRUSSELS'),
  @JsonValue('LONDON')
  london('LONDON'),
  @JsonValue('NEW_YORK')
  newYork('NEW_YORK');

  final String? value;

  const CreateVehicleRequestTimeZone(this.value);
}

enum HomeFeedCardType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('OVERDUE_BOOKING')
  overdueBooking('OVERDUE_BOOKING'),
  @JsonValue('ACTIVE_VEHICLE_USAGE')
  activeVehicleUsage('ACTIVE_VEHICLE_USAGE'),
  @JsonValue('CANCELED_REMOTE')
  canceledRemote('CANCELED_REMOTE'),
  @JsonValue('BOOKING_TO_APPROVE')
  bookingToApprove('BOOKING_TO_APPROVE'),
  @JsonValue('UPCOMING_BOOKING')
  upcomingBooking('UPCOMING_BOOKING');

  final String? value;

  const HomeFeedCardType(this.value);
}

enum MyAvailableVehicleType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AVAILABLE')
  available('AVAILABLE'),
  @JsonValue('DEFAULT_NOT_AVAILABLE')
  defaultNotAvailable('DEFAULT_NOT_AVAILABLE'),
  @JsonValue('BLOCKED')
  blocked('BLOCKED'),
  @JsonValue('IN_USE_BY_OWNER')
  inUseByOwner('IN_USE_BY_OWNER');

  final String? value;

  const MyAvailableVehicleType(this.value);
}

enum NonAvailabilityType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('BOOKING')
  booking('BOOKING'),
  @JsonValue('NOT_AVAILABLE')
  notAvailable('NOT_AVAILABLE'),
  @JsonValue('BLOCKED')
  blocked('BLOCKED'),
  @JsonValue('NOT_ALLOWED')
  notAllowed('NOT_ALLOWED');

  final String? value;

  const NonAvailabilityType(this.value);
}

enum RecurringScheduleRecurringType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('DAILY')
  daily('DAILY'),
  @JsonValue('WEEKLY')
  weekly('WEEKLY'),
  @JsonValue('WEEKDAYS')
  weekdays('WEEKDAYS'),
  @JsonValue('MONTHLY')
  monthly('MONTHLY'),
  @JsonValue('MONTHLY_SAME_WEEKDAY')
  monthlySameWeekday('MONTHLY_SAME_WEEKDAY');

  final String? value;

  const RecurringScheduleRecurringType(this.value);
}

enum RecurringScheduleTimeZone {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('BRUSSELS')
  brussels('BRUSSELS'),
  @JsonValue('LONDON')
  london('LONDON'),
  @JsonValue('NEW_YORK')
  newYork('NEW_YORK');

  final String? value;

  const RecurringScheduleTimeZone(this.value);
}

enum SearchBookingsRequestInvoiceStatuses {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('TO_BE_INVOICED')
  toBeInvoiced('TO_BE_INVOICED'),
  @JsonValue('NEEDS_CORRECTION')
  needsCorrection('NEEDS_CORRECTION'),
  @JsonValue('NOT_INVOICED')
  notInvoiced('NOT_INVOICED'),
  @JsonValue('INVOICED')
  invoiced('INVOICED');

  final String? value;

  const SearchBookingsRequestInvoiceStatuses(this.value);
}

enum SearchBookingsRequestStatuses {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AWAITING_APPROVAL')
  awaitingApproval('AWAITING_APPROVAL'),
  @JsonValue('APPROVED')
  approved('APPROVED'),
  @JsonValue('REJECTED')
  rejected('REJECTED'),
  @JsonValue('CANCELED')
  canceled('CANCELED'),
  @JsonValue('CANCELED_REMOTE')
  canceledRemote('CANCELED_REMOTE'),
  @JsonValue('EXPIRED')
  expired('EXPIRED'),
  @JsonValue('ACTIVE')
  active('ACTIVE'),
  @JsonValue('STOPPED')
  stopped('STOPPED');

  final String? value;

  const SearchBookingsRequestStatuses(this.value);
}

enum SubscriptionClientRoles {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('User')
  user('User'),
  @JsonValue('MainUser')
  mainuser('MainUser');

  final String? value;

  const SubscriptionClientRoles(this.value);
}

enum UpdateUserRequestRole {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('BATTFUN')
  battfun('BATTFUN'),
  @JsonValue('BATTFAN')
  battfan('BATTFAN'),
  @JsonValue('BATTMAX')
  battmax('BATTMAX'),
  @JsonValue('BATTADMIN')
  battadmin('BATTADMIN');

  final String? value;

  const UpdateUserRequestRole(this.value);
}

enum UpdateVehicleRequestApprovalType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AUTOMATIC')
  automatic('AUTOMATIC'),
  @JsonValue('FIRST_TIME_ONLY')
  firstTimeOnly('FIRST_TIME_ONLY'),
  @JsonValue('MANUAL')
  manual('MANUAL');

  final String? value;

  const UpdateVehicleRequestApprovalType(this.value);
}

enum UpdateVehicleRequestTimeZone {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('BRUSSELS')
  brussels('BRUSSELS'),
  @JsonValue('LONDON')
  london('LONDON'),
  @JsonValue('NEW_YORK')
  newYork('NEW_YORK');

  final String? value;

  const UpdateVehicleRequestTimeZone(this.value);
}

enum UserOnboardingStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('NONE')
  none('NONE'),
  @JsonValue('PENDING')
  pending('PENDING'),
  @JsonValue('REJECTED')
  rejected('REJECTED'),
  @JsonValue('COMPLETED')
  completed('COMPLETED');

  final String? value;

  const UserOnboardingStatus(this.value);
}

enum VehicleOperationalStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ONBOARDING')
  onboarding('ONBOARDING'),
  @JsonValue('ACTIVE')
  active('ACTIVE'),
  @JsonValue('PHASED_OUT')
  phasedOut('PHASED_OUT');

  final String? value;

  const VehicleOperationalStatus(this.value);
}

enum VehicleUsageStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('UNLOCKING')
  unlocking('UNLOCKING'),
  @JsonValue('BLUETOOTH_UNLOCKING')
  bluetoothUnlocking('BLUETOOTH_UNLOCKING'),
  @JsonValue('UNLOCK_FAILED')
  unlockFailed('UNLOCK_FAILED'),
  @JsonValue('UNLOCKED')
  unlocked('UNLOCKED'),
  @JsonValue('LOCKING')
  locking('LOCKING'),
  @JsonValue('BLUETOOTH_LOCKING')
  bluetoothLocking('BLUETOOTH_LOCKING'),
  @JsonValue('LOCK_FAILED')
  lockFailed('LOCK_FAILED'),
  @JsonValue('LOCKED')
  locked('LOCKED');

  final String? value;

  const VehicleUsageStatus(this.value);
}

enum VehicleUsageReferenceStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('UNLOCKING')
  unlocking('UNLOCKING'),
  @JsonValue('BLUETOOTH_UNLOCKING')
  bluetoothUnlocking('BLUETOOTH_UNLOCKING'),
  @JsonValue('UNLOCK_FAILED')
  unlockFailed('UNLOCK_FAILED'),
  @JsonValue('UNLOCKED')
  unlocked('UNLOCKED'),
  @JsonValue('LOCKING')
  locking('LOCKING'),
  @JsonValue('BLUETOOTH_LOCKING')
  bluetoothLocking('BLUETOOTH_LOCKING'),
  @JsonValue('LOCK_FAILED')
  lockFailed('LOCK_FAILED'),
  @JsonValue('LOCKED')
  locked('LOCKED');

  final String? value;

  const VehicleUsageReferenceStatus(this.value);
}

enum VehicleUsageUpdateStatusRequestStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('UNLOCKING')
  unlocking('UNLOCKING'),
  @JsonValue('BLUETOOTH_UNLOCKING')
  bluetoothUnlocking('BLUETOOTH_UNLOCKING'),
  @JsonValue('UNLOCK_FAILED')
  unlockFailed('UNLOCK_FAILED'),
  @JsonValue('UNLOCKED')
  unlocked('UNLOCKED'),
  @JsonValue('LOCKING')
  locking('LOCKING'),
  @JsonValue('BLUETOOTH_LOCKING')
  bluetoothLocking('BLUETOOTH_LOCKING'),
  @JsonValue('LOCK_FAILED')
  lockFailed('LOCK_FAILED'),
  @JsonValue('LOCKED')
  locked('LOCKED');

  final String? value;

  const VehicleUsageUpdateStatusRequestStatus(this.value);
}

enum UserV1UsersRolesRoleGetRole {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('BATTFUN')
  battfun('BATTFUN'),
  @JsonValue('BATTFAN')
  battfan('BATTFAN'),
  @JsonValue('BATTMAX')
  battmax('BATTMAX'),
  @JsonValue('BATTADMIN')
  battadmin('BATTADMIN');

  final String? value;

  const UserV1UsersRolesRoleGetRole(this.value);
}
