// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile_api.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddVehicleLocationRequest _$AddVehicleLocationRequestFromJson(
        Map<String, dynamic> json) =>
    AddVehicleLocationRequest(
      from:
          json['from'] == null ? null : DateTime.parse(json['from'] as String),
      name: json['name'] as String?,
      vehicleBaseLocationId: json['vehicleBaseLocationId'] as String?,
    );

Map<String, dynamic> _$AddVehicleLocationRequestToJson(
        AddVehicleLocationRequest instance) =>
    <String, dynamic>{
      'from': instance.from?.toIso8601String(),
      'name': instance.name,
      'vehicleBaseLocationId': instance.vehicleBaseLocationId,
    };

AddVehiclesToGroupRequest _$AddVehiclesToGroupRequestFromJson(
        Map<String, dynamic> json) =>
    AddVehiclesToGroupRequest(
      vehicleIds: (json['vehicleIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$AddVehiclesToGroupRequestToJson(
        AddVehiclesToGroupRequest instance) =>
    <String, dynamic>{
      'vehicleIds': instance.vehicleIds,
    };

AdjacentNonAvailability _$AdjacentNonAvailabilityFromJson(
        Map<String, dynamic> json) =>
    AdjacentNonAvailability(
      active: json['active'] as bool?,
      bookingId: json['bookingId'] as String?,
      period: json['period'] == null
          ? null
          : Period.fromJson(json['period'] as Map<String, dynamic>),
      type: adjacentNonAvailabilityTypeNullableFromJson(json['type']),
      userId: json['userId'] as String?,
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$AdjacentNonAvailabilityToJson(
        AdjacentNonAvailability instance) =>
    <String, dynamic>{
      'active': instance.active,
      'bookingId': instance.bookingId,
      'period': instance.period?.toJson(),
      'type': adjacentNonAvailabilityTypeNullableToJson(instance.type),
      'userId': instance.userId,
      'userName': instance.userName,
    };

AvailabilityConflict _$AvailabilityConflictFromJson(
        Map<String, dynamic> json) =>
    AvailabilityConflict(
      nonAvailabilities: (json['nonAvailabilities'] as List<dynamic>?)
              ?.map((e) => NonAvailability.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      splitNonConflictPeriods:
          (json['splitNonConflictPeriods'] as List<dynamic>?)
                  ?.map((e) => Period.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
    );

Map<String, dynamic> _$AvailabilityConflictToJson(
        AvailabilityConflict instance) =>
    <String, dynamic>{
      'nonAvailabilities':
          instance.nonAvailabilities?.map((e) => e.toJson()).toList(),
      'splitNonConflictPeriods':
          instance.splitNonConflictPeriods?.map((e) => e.toJson()).toList(),
    };

BillingPrice _$BillingPriceFromJson(Map<String, dynamic> json) => BillingPrice(
      amount: (json['amount'] as num?)?.toInt(),
      changeFromHourlyToDaily: json['changeFromHourlyToDaily'] as bool?,
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      hourlyTotalNotCharged:
          (json['hourlyTotalNotCharged'] as num?)?.toDouble(),
      hourlyTotalNotChargedExclVat:
          (json['hourlyTotalNotChargedExclVat'] as num?)?.toDouble(),
      km: (json['km'] as num?)?.toInt(),
      kmPrice: (json['kmPrice'] as num?)?.toDouble(),
      kmPriceExclVat: (json['kmPriceExclVat'] as num?)?.toDouble(),
      kmTotal: (json['kmTotal'] as num?)?.toDouble(),
      kmTotalExclVat: (json['kmTotalExclVat'] as num?)?.toDouble(),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      timeAmount: (json['timeAmount'] as num?)?.toDouble(),
      timeTotal: (json['timeTotal'] as num?)?.toDouble(),
      timeTotalExclVat: (json['timeTotalExclVat'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
      totalExclVat: (json['totalExclVat'] as num?)?.toDouble(),
      totalVat: (json['totalVat'] as num?)?.toDouble(),
      unit: billingPriceUnitNullableFromJson(json['unit']),
      unitPrice: (json['unitPrice'] as num?)?.toDouble(),
      unitPriceExclVat: (json['unitPriceExclVat'] as num?)?.toDouble(),
      vatRate: (json['vatRate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BillingPriceToJson(BillingPrice instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'changeFromHourlyToDaily': instance.changeFromHourlyToDaily,
      'endDate': instance.endDate?.toIso8601String(),
      'hourlyTotalNotCharged': instance.hourlyTotalNotCharged,
      'hourlyTotalNotChargedExclVat': instance.hourlyTotalNotChargedExclVat,
      'km': instance.km,
      'kmPrice': instance.kmPrice,
      'kmPriceExclVat': instance.kmPriceExclVat,
      'kmTotal': instance.kmTotal,
      'kmTotalExclVat': instance.kmTotalExclVat,
      'startDate': instance.startDate?.toIso8601String(),
      'timeAmount': instance.timeAmount,
      'timeTotal': instance.timeTotal,
      'timeTotalExclVat': instance.timeTotalExclVat,
      'total': instance.total,
      'totalExclVat': instance.totalExclVat,
      'totalVat': instance.totalVat,
      'unit': billingPriceUnitNullableToJson(instance.unit),
      'unitPrice': instance.unitPrice,
      'unitPriceExclVat': instance.unitPriceExclVat,
      'vatRate': instance.vatRate,
    };

BodyStyle _$BodyStyleFromJson(Map<String, dynamic> json) => BodyStyle(
      description: json['description'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$BodyStyleToJson(BodyStyle instance) => <String, dynamic>{
      'description': instance.description,
      'id': instance.id,
    };

BodyStylePage _$BodyStylePageFromJson(Map<String, dynamic> json) =>
    BodyStylePage(
      bodyStyles: (json['bodyStyles'] as List<dynamic>?)
              ?.map((e) => BodyStyle.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$BodyStylePageToJson(BodyStylePage instance) =>
    <String, dynamic>{
      'bodyStyles': instance.bodyStyles?.map((e) => e.toJson()).toList(),
    };

Booking _$BookingFromJson(Map<String, dynamic> json) => Booking(
      adminComments: json['adminComments'] as String?,
      billingPrice: json['billingPrice'] == null
          ? null
          : BillingPrice.fromJson(json['billingPrice'] as Map<String, dynamic>),
      cancelDate: json['cancelDate'] == null
          ? null
          : DateTime.parse(json['cancelDate'] as String),
      cancelReason: json['cancelReason'] as String?,
      clientId: json['clientId'] as String?,
      comments: json['comments'] as String?,
      dateCreated: json['dateCreated'] == null
          ? null
          : DateTime.parse(json['dateCreated'] as String),
      id: json['id'] as String?,
      invoiceStatus:
          bookingInvoiceStatusNullableFromJson(json['invoiceStatus']),
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
      nextPossibleStatuses: bookingNextPossibleStatusesListFromJson(
          json['nextPossibleStatuses'] as List?),
      originalEndDate: json['originalEndDate'] == null
          ? null
          : DateTime.parse(json['originalEndDate'] as String),
      period: json['period'] == null
          ? null
          : Period.fromJson(json['period'] as Map<String, dynamic>),
      status: bookingStatusNullableFromJson(json['status']),
      userId: json['userId'] as String?,
      vehicle: json['vehicle'] == null
          ? null
          : Vehicle.fromJson(json['vehicle'] as Map<String, dynamic>),
      vehicleUsage: json['vehicleUsage'] == null
          ? null
          : VehicleUsage.fromJson(json['vehicleUsage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      'adminComments': instance.adminComments,
      'billingPrice': instance.billingPrice?.toJson(),
      'cancelDate': instance.cancelDate?.toIso8601String(),
      'cancelReason': instance.cancelReason,
      'clientId': instance.clientId,
      'comments': instance.comments,
      'dateCreated': instance.dateCreated?.toIso8601String(),
      'id': instance.id,
      'invoiceStatus':
          bookingInvoiceStatusNullableToJson(instance.invoiceStatus),
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
      'nextPossibleStatuses':
          bookingNextPossibleStatusesListToJson(instance.nextPossibleStatuses),
      'originalEndDate': instance.originalEndDate?.toIso8601String(),
      'period': instance.period?.toJson(),
      'status': bookingStatusNullableToJson(instance.status),
      'userId': instance.userId,
      'vehicle': instance.vehicle?.toJson(),
      'vehicleUsage': instance.vehicleUsage?.toJson(),
    };

BookingPrice _$BookingPriceFromJson(Map<String, dynamic> json) => BookingPrice(
      dayPrice: (json['dayPrice'] as num?)?.toDouble(),
      hourPrice: (json['hourPrice'] as num?)?.toDouble(),
      kmPrice: (json['kmPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BookingPriceToJson(BookingPrice instance) =>
    <String, dynamic>{
      'dayPrice': instance.dayPrice,
      'hourPrice': instance.hourPrice,
      'kmPrice': instance.kmPrice,
    };

BookingsPage _$BookingsPageFromJson(Map<String, dynamic> json) => BookingsPage(
      bookings: (json['bookings'] as List<dynamic>?)
              ?.map((e) => Booking.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$BookingsPageToJson(BookingsPage instance) =>
    <String, dynamic>{
      'bookings': instance.bookings?.map((e) => e.toJson()).toList(),
    };

CancelBookingRequest _$CancelBookingRequestFromJson(
        Map<String, dynamic> json) =>
    CancelBookingRequest(
      bookingId: json['bookingId'] as String?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$CancelBookingRequestToJson(
        CancelBookingRequest instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'reason': instance.reason,
    };

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      billingEmail: json['billingEmail'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      nr: json['nr'] as String?,
      postalCode: json['postalCode'] as String?,
      street: json['street'] as String?,
      users: (json['users'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      vat: json['vat'] as String?,
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'billingEmail': instance.billingEmail,
      'city': instance.city,
      'country': instance.country,
      'id': instance.id,
      'name': instance.name,
      'nr': instance.nr,
      'postalCode': instance.postalCode,
      'street': instance.street,
      'users': instance.users?.map((e) => e.toJson()).toList(),
      'vat': instance.vat,
    };

ConflictResolution _$ConflictResolutionFromJson(Map<String, dynamic> json) =>
    ConflictResolution(
      cancelReason: json['cancelReason'] as String?,
      conflictsHash: json['conflictsHash'] as String?,
      mode: conflictResolutionModeNullableFromJson(json['mode']),
    );

Map<String, dynamic> _$ConflictResolutionToJson(ConflictResolution instance) =>
    <String, dynamic>{
      'cancelReason': instance.cancelReason,
      'conflictsHash': instance.conflictsHash,
      'mode': conflictResolutionModeNullableToJson(instance.mode),
    };

CreateBodyStyleRequest _$CreateBodyStyleRequestFromJson(
        Map<String, dynamic> json) =>
    CreateBodyStyleRequest(
      description: json['description'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$CreateBodyStyleRequestToJson(
        CreateBodyStyleRequest instance) =>
    <String, dynamic>{
      'description': instance.description,
      'id': instance.id,
    };

CreateBookingRequest _$CreateBookingRequestFromJson(
        Map<String, dynamic> json) =>
    CreateBookingRequest(
      comments: json['comments'] as String?,
      period: json['period'] == null
          ? null
          : Period.fromJson(json['period'] as Map<String, dynamic>),
      userId: json['userId'] as String?,
      vehicleId: json['vehicleId'] as String,
    );

Map<String, dynamic> _$CreateBookingRequestToJson(
        CreateBookingRequest instance) =>
    <String, dynamic>{
      'comments': instance.comments,
      'period': instance.period?.toJson(),
      'userId': instance.userId,
      'vehicleId': instance.vehicleId,
    };

CreateNonAvailabilityRequest _$CreateNonAvailabilityRequestFromJson(
        Map<String, dynamic> json) =>
    CreateNonAvailabilityRequest(
      conflictResolution: json['conflictResolution'] == null
          ? null
          : ConflictResolution.fromJson(
              json['conflictResolution'] as Map<String, dynamic>),
      period: Period.fromJson(json['period'] as Map<String, dynamic>),
      recurringSchedule: json['recurringSchedule'] == null
          ? null
          : RecurringSchedule.fromJson(
              json['recurringSchedule'] as Map<String, dynamic>),
      vehicleId: json['vehicleId'] as String,
    );

Map<String, dynamic> _$CreateNonAvailabilityRequestToJson(
        CreateNonAvailabilityRequest instance) =>
    <String, dynamic>{
      'conflictResolution': instance.conflictResolution?.toJson(),
      'period': instance.period.toJson(),
      'recurringSchedule': instance.recurringSchedule?.toJson(),
      'vehicleId': instance.vehicleId,
    };

CreateUserRequest _$CreateUserRequestFromJson(Map<String, dynamic> json) =>
    CreateUserRequest(
      email: json['email'] as String,
      remoteId: json['remoteId'] as String,
    );

Map<String, dynamic> _$CreateUserRequestToJson(CreateUserRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'remoteId': instance.remoteId,
    };

CreateVehicleGroupRequest _$CreateVehicleGroupRequestFromJson(
        Map<String, dynamic> json) =>
    CreateVehicleGroupRequest(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CreateVehicleGroupRequestToJson(
        CreateVehicleGroupRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

CreateVehicleModelRequest _$CreateVehicleModelRequestFromJson(
        Map<String, dynamic> json) =>
    CreateVehicleModelRequest(
      bodyStyleId: json['bodyStyleId'] as String?,
      brandId: json['brandId'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CreateVehicleModelRequestToJson(
        CreateVehicleModelRequest instance) =>
    <String, dynamic>{
      'bodyStyleId': instance.bodyStyleId,
      'brandId': instance.brandId,
      'name': instance.name,
    };

CreateVehicleRequest _$CreateVehicleRequestFromJson(
        Map<String, dynamic> json) =>
    CreateVehicleRequest(
      id: json['id'] as String?,
      licensePlate: json['licensePlate'] as String?,
      vehicleModelId: json['vehicleModelId'] as String,
    );

Map<String, dynamic> _$CreateVehicleRequestToJson(
        CreateVehicleRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'licensePlate': instance.licensePlate,
      'vehicleModelId': instance.vehicleModelId,
    };

DeleteVehiclesFromGroupRequest _$DeleteVehiclesFromGroupRequestFromJson(
        Map<String, dynamic> json) =>
    DeleteVehiclesFromGroupRequest(
      vehicleIds: (json['vehicleIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$DeleteVehiclesFromGroupRequestToJson(
        DeleteVehiclesFromGroupRequest instance) =>
    <String, dynamic>{
      'vehicleIds': instance.vehicleIds,
    };

EndVehicleUsageRequest _$EndVehicleUsageRequestFromJson(
        Map<String, dynamic> json) =>
    EndVehicleUsageRequest(
      mileageValue: (json['mileageValue'] as num?)?.toDouble(),
      vehicleId: json['vehicleId'] as String?,
      vehicleUsageId: json['vehicleUsageId'] as String?,
    );

Map<String, dynamic> _$EndVehicleUsageRequestToJson(
        EndVehicleUsageRequest instance) =>
    <String, dynamic>{
      'mileageValue': instance.mileageValue,
      'vehicleId': instance.vehicleId,
      'vehicleUsageId': instance.vehicleUsageId,
    };

FiltersForBooking _$FiltersForBookingFromJson(Map<String, dynamic> json) =>
    FiltersForBooking(
      gpsLocation: json['gpsLocation'] == null
          ? null
          : GpsLocation.fromJson(json['gpsLocation'] as Map<String, dynamic>),
      vehicleFilterCriteria: json['vehicleFilterCriteria'] == null
          ? null
          : VehicleFilterCriteria.fromJson(
              json['vehicleFilterCriteria'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FiltersForBookingToJson(FiltersForBooking instance) =>
    <String, dynamic>{
      'gpsLocation': instance.gpsLocation?.toJson(),
      'vehicleFilterCriteria': instance.vehicleFilterCriteria?.toJson(),
    };

GpsCoordinate _$GpsCoordinateFromJson(Map<String, dynamic> json) =>
    GpsCoordinate(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GpsCoordinateToJson(GpsCoordinate instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

GpsLocation _$GpsLocationFromJson(Map<String, dynamic> json) => GpsLocation(
      address: json['address'] as String?,
      coordinates: json['coordinates'] == null
          ? null
          : GpsCoordinate.fromJson(json['coordinates'] as Map<String, dynamic>),
      vehicleBaseLocationId: json['vehicleBaseLocationId'] as String?,
    );

Map<String, dynamic> _$GpsLocationToJson(GpsLocation instance) =>
    <String, dynamic>{
      'address': instance.address,
      'coordinates': instance.coordinates?.toJson(),
      'vehicleBaseLocationId': instance.vehicleBaseLocationId,
    };

HomeFeedCard _$HomeFeedCardFromJson(Map<String, dynamic> json) => HomeFeedCard(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      fullBooking: json['fullBooking'] == null
          ? null
          : Booking.fromJson(json['fullBooking'] as Map<String, dynamic>),
      type: homeFeedCardTypeNullableFromJson(json['type']),
      vehicle: json['vehicle'] == null
          ? null
          : Vehicle.fromJson(json['vehicle'] as Map<String, dynamic>),
      vehicleUsage: json['vehicleUsage'] == null
          ? null
          : VehicleUsageReference.fromJson(
              json['vehicleUsage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeFeedCardToJson(HomeFeedCard instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'fullBooking': instance.fullBooking?.toJson(),
      'type': homeFeedCardTypeNullableToJson(instance.type),
      'vehicle': instance.vehicle?.toJson(),
      'vehicleUsage': instance.vehicleUsage?.toJson(),
    };

HomeFeedPage _$HomeFeedPageFromJson(Map<String, dynamic> json) => HomeFeedPage(
      homeFeedCards: (json['homeFeedCards'] as List<dynamic>?)
              ?.map((e) => HomeFeedCard.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$HomeFeedPageToJson(HomeFeedPage instance) =>
    <String, dynamic>{
      'homeFeedCards': instance.homeFeedCards?.map((e) => e.toJson()).toList(),
    };

MyAvailableVehicle _$MyAvailableVehicleFromJson(Map<String, dynamic> json) =>
    MyAvailableVehicle(
      nextNonAvailability: json['nextNonAvailability'] == null
          ? null
          : AdjacentNonAvailability.fromJson(
              json['nextNonAvailability'] as Map<String, dynamic>),
      overdue: json['overdue'] as bool?,
      previousNonAvailability: json['previousNonAvailability'] == null
          ? null
          : AdjacentNonAvailability.fromJson(
              json['previousNonAvailability'] as Map<String, dynamic>),
      type: myAvailableVehicleTypeNullableFromJson(json['type']),
      vehicle: json['vehicle'] == null
          ? null
          : Vehicle.fromJson(json['vehicle'] as Map<String, dynamic>),
      vehicleUsage: json['vehicleUsage'] == null
          ? null
          : VehicleUsage.fromJson(json['vehicleUsage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyAvailableVehicleToJson(MyAvailableVehicle instance) =>
    <String, dynamic>{
      'nextNonAvailability': instance.nextNonAvailability?.toJson(),
      'overdue': instance.overdue,
      'previousNonAvailability': instance.previousNonAvailability?.toJson(),
      'type': myAvailableVehicleTypeNullableToJson(instance.type),
      'vehicle': instance.vehicle?.toJson(),
      'vehicleUsage': instance.vehicleUsage?.toJson(),
    };

MyAvailableVehiclesPage _$MyAvailableVehiclesPageFromJson(
        Map<String, dynamic> json) =>
    MyAvailableVehiclesPage(
      currentNonAvailablePeriods: (json['currentNonAvailablePeriods']
                  as List<dynamic>?)
              ?.map(
                  (e) => MyAvailableVehicle.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$MyAvailableVehiclesPageToJson(
        MyAvailableVehiclesPage instance) =>
    <String, dynamic>{
      'currentNonAvailablePeriods':
          instance.currentNonAvailablePeriods?.map((e) => e.toJson()).toList(),
    };

NonAvailabilitiesPage _$NonAvailabilitiesPageFromJson(
        Map<String, dynamic> json) =>
    NonAvailabilitiesPage(
      nonAvailabilities: (json['nonAvailabilities'] as List<dynamic>?)
              ?.map((e) => NonAvailability.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$NonAvailabilitiesPageToJson(
        NonAvailabilitiesPage instance) =>
    <String, dynamic>{
      'nonAvailabilities':
          instance.nonAvailabilities?.map((e) => e.toJson()).toList(),
    };

NonAvailabilitiesPerVehicle _$NonAvailabilitiesPerVehicleFromJson(
        Map<String, dynamic> json) =>
    NonAvailabilitiesPerVehicle(
      currentPrivateUsageOverdue: json['currentPrivateUsageOverdue'] as bool?,
      currentPrivateUsageStart: json['currentPrivateUsageStart'] == null
          ? null
          : DateTime.parse(json['currentPrivateUsageStart'] as String),
      nonAvailabilities: (json['nonAvailabilities'] as List<dynamic>?)
              ?.map((e) => NonAvailability.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      vehicleId: json['vehicleId'] as String?,
      vehicleName: json['vehicleName'] as String?,
    );

Map<String, dynamic> _$NonAvailabilitiesPerVehicleToJson(
        NonAvailabilitiesPerVehicle instance) =>
    <String, dynamic>{
      'currentPrivateUsageOverdue': instance.currentPrivateUsageOverdue,
      'currentPrivateUsageStart':
          instance.currentPrivateUsageStart?.toIso8601String(),
      'nonAvailabilities':
          instance.nonAvailabilities?.map((e) => e.toJson()).toList(),
      'vehicleId': instance.vehicleId,
      'vehicleName': instance.vehicleName,
    };

NonAvailabilitiesPerVehiclePage _$NonAvailabilitiesPerVehiclePageFromJson(
        Map<String, dynamic> json) =>
    NonAvailabilitiesPerVehiclePage(
      availabilityEventsPerVehicle:
          json['availabilityEventsPerVehicle'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$NonAvailabilitiesPerVehiclePageToJson(
        NonAvailabilitiesPerVehiclePage instance) =>
    <String, dynamic>{
      'availabilityEventsPerVehicle': instance.availabilityEventsPerVehicle,
    };

NonAvailability _$NonAvailabilityFromJson(Map<String, dynamic> json) =>
    NonAvailability(
      booking: json['booking'] == null
          ? null
          : Booking.fromJson(json['booking'] as Map<String, dynamic>),
      fullPeriod: json['fullPeriod'] == null
          ? null
          : Period.fromJson(json['fullPeriod'] as Map<String, dynamic>),
      overdue: json['overdue'] as bool?,
      period: json['period'] == null
          ? null
          : Period.fromJson(json['period'] as Map<String, dynamic>),
      plannedPeriod: json['plannedPeriod'] == null
          ? null
          : Period.fromJson(json['plannedPeriod'] as Map<String, dynamic>),
      type: nonAvailabilityTypeNullableFromJson(json['type']),
      usagePeriod: json['usagePeriod'] == null
          ? null
          : Period.fromJson(json['usagePeriod'] as Map<String, dynamic>),
      vehicleId: json['vehicleId'] as String?,
    );

Map<String, dynamic> _$NonAvailabilityToJson(NonAvailability instance) =>
    <String, dynamic>{
      'booking': instance.booking?.toJson(),
      'fullPeriod': instance.fullPeriod?.toJson(),
      'overdue': instance.overdue,
      'period': instance.period?.toJson(),
      'plannedPeriod': instance.plannedPeriod?.toJson(),
      'type': nonAvailabilityTypeNullableToJson(instance.type),
      'usagePeriod': instance.usagePeriod?.toJson(),
      'vehicleId': instance.vehicleId,
    };

NonAvailabilityResponse _$NonAvailabilityResponseFromJson(
        Map<String, dynamic> json) =>
    NonAvailabilityResponse(
      conflictsByPeriod: json['conflictsByPeriod'] as Map<String, dynamic>?,
      conflictsHash: json['conflictsHash'] as String?,
      nonAvailabilities: (json['nonAvailabilities'] as List<dynamic>?)
              ?.map((e) => NonAvailability.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$NonAvailabilityResponseToJson(
        NonAvailabilityResponse instance) =>
    <String, dynamic>{
      'conflictsByPeriod': instance.conflictsByPeriod,
      'conflictsHash': instance.conflictsHash,
      'nonAvailabilities':
          instance.nonAvailabilities?.map((e) => e.toJson()).toList(),
    };

Period _$PeriodFromJson(Map<String, dynamic> json) => Period(
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
    );

Map<String, dynamic> _$PeriodToJson(Period instance) => <String, dynamic>{
      'end': instance.end?.toIso8601String(),
      'start': instance.start?.toIso8601String(),
    };

RecurringNonAvailability _$RecurringNonAvailabilityFromJson(
        Map<String, dynamic> json) =>
    RecurringNonAvailability(
      id: json['id'] as String?,
      schedule: json['schedule'] == null
          ? null
          : RecurringSchedule.fromJson(
              json['schedule'] as Map<String, dynamic>),
      vehicle: json['vehicle'] == null
          ? null
          : Vehicle.fromJson(json['vehicle'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecurringNonAvailabilityToJson(
        RecurringNonAvailability instance) =>
    <String, dynamic>{
      'id': instance.id,
      'schedule': instance.schedule?.toJson(),
      'vehicle': instance.vehicle?.toJson(),
    };

RecurringSchedule _$RecurringScheduleFromJson(Map<String, dynamic> json) =>
    RecurringSchedule(
      daysOfWeek: (json['daysOfWeek'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      endDate: DateTime.parse(json['endDate'] as String),
      interval: (json['interval'] as num?)?.toInt(),
      recurringType:
          recurringScheduleRecurringTypeFromJson(json['recurringType']),
      timeZone: recurringScheduleTimeZoneNullableFromJson(json['timeZone']),
    );

Map<String, dynamic> _$RecurringScheduleToJson(RecurringSchedule instance) =>
    <String, dynamic>{
      'daysOfWeek': instance.daysOfWeek,
      'endDate': instance.endDate.toIso8601String(),
      'interval': instance.interval,
      'recurringType':
          recurringScheduleRecurringTypeToJson(instance.recurringType),
      'timeZone': recurringScheduleTimeZoneNullableToJson(instance.timeZone),
    };

RegisterDeviceRequest _$RegisterDeviceRequestFromJson(
        Map<String, dynamic> json) =>
    RegisterDeviceRequest(
      active: json['active'] as bool?,
      token: json['token'] as String,
    );

Map<String, dynamic> _$RegisterDeviceRequestToJson(
        RegisterDeviceRequest instance) =>
    <String, dynamic>{
      'active': instance.active,
      'token': instance.token,
    };

ReplaceBookingRequest _$ReplaceBookingRequestFromJson(
        Map<String, dynamic> json) =>
    ReplaceBookingRequest(
      adminComments: json['adminComments'] as String?,
      authorizationComments: json['authorizationComments'] as String?,
      clientId: json['clientId'] as String?,
      comments: json['comments'] as String?,
      filtersForBooking: json['filtersForBooking'] == null
          ? null
          : FiltersForBooking.fromJson(
              json['filtersForBooking'] as Map<String, dynamic>),
      invoiceComments: json['invoiceComments'] as String?,
      originalBookingId: json['originalBookingId'] as String?,
      period: json['period'] == null
          ? null
          : Period.fromJson(json['period'] as Map<String, dynamic>),
      userId: json['userId'] as String?,
      vehicleId: json['vehicleId'] as String?,
    );

Map<String, dynamic> _$ReplaceBookingRequestToJson(
        ReplaceBookingRequest instance) =>
    <String, dynamic>{
      'adminComments': instance.adminComments,
      'authorizationComments': instance.authorizationComments,
      'clientId': instance.clientId,
      'comments': instance.comments,
      'filtersForBooking': instance.filtersForBooking?.toJson(),
      'invoiceComments': instance.invoiceComments,
      'originalBookingId': instance.originalBookingId,
      'period': instance.period?.toJson(),
      'userId': instance.userId,
      'vehicleId': instance.vehicleId,
    };

SearchBookingsRequest _$SearchBookingsRequestFromJson(
        Map<String, dynamic> json) =>
    SearchBookingsRequest(
      adminComments: json['adminComments'] as String?,
      clientId: json['clientId'] as String?,
      comments: json['comments'] as String?,
      endPeriod: json['endPeriod'] == null
          ? null
          : Period.fromJson(json['endPeriod'] as Map<String, dynamic>),
      invoiceStatuses: searchBookingsRequestInvoiceStatusesListFromJson(
          json['invoiceStatuses'] as List?),
      licensePlate: json['licensePlate'] as String?,
      startPeriod: json['startPeriod'] == null
          ? null
          : Period.fromJson(json['startPeriod'] as Map<String, dynamic>),
      statuses:
          searchBookingsRequestStatusesListFromJson(json['statuses'] as List?),
      userId: json['userId'] as String?,
      vehicleId: json['vehicleId'] as String?,
    );

Map<String, dynamic> _$SearchBookingsRequestToJson(
        SearchBookingsRequest instance) =>
    <String, dynamic>{
      'adminComments': instance.adminComments,
      'clientId': instance.clientId,
      'comments': instance.comments,
      'endPeriod': instance.endPeriod?.toJson(),
      'invoiceStatuses': searchBookingsRequestInvoiceStatusesListToJson(
          instance.invoiceStatuses),
      'licensePlate': instance.licensePlate,
      'startPeriod': instance.startPeriod?.toJson(),
      'statuses': searchBookingsRequestStatusesListToJson(instance.statuses),
      'userId': instance.userId,
      'vehicleId': instance.vehicleId,
    };

SearchNonAvailabilityEventsRequest _$SearchNonAvailabilityEventsRequestFromJson(
        Map<String, dynamic> json) =>
    SearchNonAvailabilityEventsRequest(
      period: json['period'] == null
          ? null
          : Period.fromJson(json['period'] as Map<String, dynamic>),
      vehicleIds: (json['vehicleIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$SearchNonAvailabilityEventsRequestToJson(
        SearchNonAvailabilityEventsRequest instance) =>
    <String, dynamic>{
      'period': instance.period?.toJson(),
      'vehicleIds': instance.vehicleIds,
    };

SearchUsersRequest _$SearchUsersRequestFromJson(Map<String, dynamic> json) =>
    SearchUsersRequest(
      defaultMembershipId: json['defaultMembershipId'] as String?,
      displayName: json['displayName'] as String?,
      favoriteLocation: json['favoriteLocation'] == null
          ? null
          : GpsLocation.fromJson(
              json['favoriteLocation'] as Map<String, dynamic>),
      favoritelocationDistance:
          (json['favoritelocationDistance'] as num?)?.toInt(),
      homeLocation: json['homeLocation'] == null
          ? null
          : GpsLocation.fromJson(json['homeLocation'] as Map<String, dynamic>),
      homelocationDistance: (json['homelocationDistance'] as num?)?.toInt(),
      remoteId: json['remoteId'] as String?,
      userName: json['userName'] as String?,
      workLocation: json['workLocation'] == null
          ? null
          : GpsLocation.fromJson(json['workLocation'] as Map<String, dynamic>),
      worklocationDistance: (json['worklocationDistance'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SearchUsersRequestToJson(SearchUsersRequest instance) =>
    <String, dynamic>{
      'defaultMembershipId': instance.defaultMembershipId,
      'displayName': instance.displayName,
      'favoriteLocation': instance.favoriteLocation?.toJson(),
      'favoritelocationDistance': instance.favoritelocationDistance,
      'homeLocation': instance.homeLocation?.toJson(),
      'homelocationDistance': instance.homelocationDistance,
      'remoteId': instance.remoteId,
      'userName': instance.userName,
      'workLocation': instance.workLocation?.toJson(),
      'worklocationDistance': instance.worklocationDistance,
    };

SearchVehiclesRequest _$SearchVehiclesRequestFromJson(
        Map<String, dynamic> json) =>
    SearchVehiclesRequest(
      location: json['location'] == null
          ? null
          : GpsCoordinate.fromJson(json['location'] as Map<String, dynamic>),
      maxDistance: (json['maxDistance'] as num?)?.toDouble(),
      period: json['period'] == null
          ? null
          : Period.fromJson(json['period'] as Map<String, dynamic>),
      subscriptionId: json['subscriptionId'] as String?,
      vehicleFilterCriteria: json['vehicleFilterCriteria'] == null
          ? null
          : VehicleFilterCriteria.fromJson(
              json['vehicleFilterCriteria'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchVehiclesRequestToJson(
        SearchVehiclesRequest instance) =>
    <String, dynamic>{
      'location': instance.location?.toJson(),
      'maxDistance': instance.maxDistance,
      'period': instance.period?.toJson(),
      'subscriptionId': instance.subscriptionId,
      'vehicleFilterCriteria': instance.vehicleFilterCriteria?.toJson(),
    };

StartVehicleUsageRequest _$StartVehicleUsageRequestFromJson(
        Map<String, dynamic> json) =>
    StartVehicleUsageRequest(
      bookingId: json['bookingId'] as String?,
      mileageValue: (json['mileageValue'] as num?)?.toDouble(),
      vehicleId: json['vehicleId'] as String?,
    );

Map<String, dynamic> _$StartVehicleUsageRequestToJson(
        StartVehicleUsageRequest instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'mileageValue': instance.mileageValue,
      'vehicleId': instance.vehicleId,
    };

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) => Subscription(
      clientId: (json['clientId'] as num?)?.toInt(),
      clientName: json['clientName'] as String?,
      clientRoles: subscriptionClientRolesNullableFromJson(json['clientRoles']),
      commitment: (json['commitment'] as num?)?.toInt(),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      id: (json['id'] as num?)?.toInt(),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      subscriptionType: json['subscriptionType'] as String?,
      vehicleId: json['vehicleId'] as String?,
    );

Map<String, dynamic> _$SubscriptionToJson(Subscription instance) =>
    <String, dynamic>{
      'clientId': instance.clientId,
      'clientName': instance.clientName,
      'clientRoles':
          subscriptionClientRolesNullableToJson(instance.clientRoles),
      'commitment': instance.commitment,
      'endDate': instance.endDate?.toIso8601String(),
      'id': instance.id,
      'startDate': instance.startDate?.toIso8601String(),
      'subscriptionType': instance.subscriptionType,
      'vehicleId': instance.vehicleId,
    };

Trip _$TripFromJson(Map<String, dynamic> json) => Trip(
      endPosition: json['endPosition'] == null
          ? null
          : GpsLocation.fromJson(json['endPosition'] as Map<String, dynamic>),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      mileageDelta: (json['mileageDelta'] as num?)?.toDouble(),
      mileageEnd: (json['mileageEnd'] as num?)?.toDouble(),
      mileageStart: (json['mileageStart'] as num?)?.toDouble(),
      startPosition: json['startPosition'] == null
          ? null
          : GpsLocation.fromJson(json['startPosition'] as Map<String, dynamic>),
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
    );

Map<String, dynamic> _$TripToJson(Trip instance) => <String, dynamic>{
      'endPosition': instance.endPosition?.toJson(),
      'endTime': instance.endTime?.toIso8601String(),
      'mileageDelta': instance.mileageDelta,
      'mileageEnd': instance.mileageEnd,
      'mileageStart': instance.mileageStart,
      'startPosition': instance.startPosition?.toJson(),
      'startTime': instance.startTime?.toIso8601String(),
    };

UpdateBookingRequest _$UpdateBookingRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateBookingRequest(
      adminComments: json['adminComments'] as String?,
      authorizationComments: json['authorizationComments'] as String?,
      comments: json['comments'] as String?,
      doNotInvoice: json['doNotInvoice'] as bool?,
      invoiceComments: json['invoiceComments'] as String?,
      invoiced: json['invoiced'] as bool?,
      needsCorrection: json['needsCorrection'] as bool?,
      needsCorrectionComments: json['needsCorrectionComments'] as String?,
      period: json['period'] == null
          ? null
          : Period.fromJson(json['period'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateBookingRequestToJson(
        UpdateBookingRequest instance) =>
    <String, dynamic>{
      'adminComments': instance.adminComments,
      'authorizationComments': instance.authorizationComments,
      'comments': instance.comments,
      'doNotInvoice': instance.doNotInvoice,
      'invoiceComments': instance.invoiceComments,
      'invoiced': instance.invoiced,
      'needsCorrection': instance.needsCorrection,
      'needsCorrectionComments': instance.needsCorrectionComments,
      'period': instance.period?.toJson(),
    };

UpdateNonAvailabilityRequest _$UpdateNonAvailabilityRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateNonAvailabilityRequest(
      availabilityId: json['availabilityId'] as String?,
      conflictResolution: json['conflictResolution'] == null
          ? null
          : ConflictResolution.fromJson(
              json['conflictResolution'] as Map<String, dynamic>),
      period: Period.fromJson(json['period'] as Map<String, dynamic>),
      recurringSchedule: json['recurringSchedule'] == null
          ? null
          : RecurringSchedule.fromJson(
              json['recurringSchedule'] as Map<String, dynamic>),
      removeRecurringSchedule: json['removeRecurringSchedule'] as bool?,
    );

Map<String, dynamic> _$UpdateNonAvailabilityRequestToJson(
        UpdateNonAvailabilityRequest instance) =>
    <String, dynamic>{
      'availabilityId': instance.availabilityId,
      'conflictResolution': instance.conflictResolution?.toJson(),
      'period': instance.period.toJson(),
      'recurringSchedule': instance.recurringSchedule?.toJson(),
      'removeRecurringSchedule': instance.removeRecurringSchedule,
    };

UpdateUserRequest _$UpdateUserRequestFromJson(Map<String, dynamic> json) =>
    UpdateUserRequest(
      biography: json['biography'] as String?,
      defaultMembershipId: json['defaultMembershipId'] as String?,
      displayName: json['displayName'] as String?,
      favoriteLocation: json['favoriteLocation'] == null
          ? null
          : GpsLocation.fromJson(
              json['favoriteLocation'] as Map<String, dynamic>),
      homeLocation: json['homeLocation'] == null
          ? null
          : GpsLocation.fromJson(json['homeLocation'] as Map<String, dynamic>),
      joinedSince: json['joinedSince'] == null
          ? null
          : DateTime.parse(json['joinedSince'] as String),
      pushNotificationsEnabled: json['pushNotificationsEnabled'] as bool?,
      role: updateUserRequestRoleNullableFromJson(json['role']),
      tripRegistrationEnabled: json['tripRegistrationEnabled'] as bool?,
      userName: json['userName'] as String?,
      workLocation: json['workLocation'] == null
          ? null
          : GpsLocation.fromJson(json['workLocation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateUserRequestToJson(UpdateUserRequest instance) =>
    <String, dynamic>{
      'biography': instance.biography,
      'defaultMembershipId': instance.defaultMembershipId,
      'displayName': instance.displayName,
      'favoriteLocation': instance.favoriteLocation?.toJson(),
      'homeLocation': instance.homeLocation?.toJson(),
      'joinedSince': instance.joinedSince?.toIso8601String(),
      'pushNotificationsEnabled': instance.pushNotificationsEnabled,
      'role': updateUserRequestRoleNullableToJson(instance.role),
      'tripRegistrationEnabled': instance.tripRegistrationEnabled,
      'userName': instance.userName,
      'workLocation': instance.workLocation?.toJson(),
    };

UpdateVehicleRequest _$UpdateVehicleRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateVehicleRequest(
      addVehicleLocationRequest: json['addVehicleLocationRequest'] == null
          ? null
          : AddVehicleLocationRequest.fromJson(
              json['addVehicleLocationRequest'] as Map<String, dynamic>),
      approvalType: updateVehicleRequestApprovalTypeNullableFromJson(
          json['approvalType']),
      clientId: json['clientId'] as String?,
      description: json['description'] as String?,
      electricRange: (json['electricRange'] as num?)?.toInt(),
      equipmentIds: (json['equipmentIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      expectedInFleetDate: json['expectedInFleetDate'] == null
          ? null
          : DateTime.parse(json['expectedInFleetDate'] as String),
      expectedOutOfFleetDate: json['expectedOutOfFleetDate'] == null
          ? null
          : DateTime.parse(json['expectedOutOfFleetDate'] as String),
      imageUrl: json['imageUrl'] as String?,
      intentIds: (json['intentIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      lastPosition: json['lastPosition'] == null
          ? null
          : GpsLocation.fromJson(json['lastPosition'] as Map<String, dynamic>),
      lastPositionTimestamp: json['lastPositionTimestamp'] == null
          ? null
          : DateTime.parse(json['lastPositionTimestamp'] as String),
      licensePlate: json['licensePlate'] as String?,
      name: json['name'] as String?,
      seats: (json['seats'] as num?)?.toInt(),
      typeId: json['typeId'] as String?,
      vehicleId: json['vehicleId'] as String?,
      vehicleInfo: json['vehicleInfo'] as String?,
      vehicleInfoPreBooking: json['vehicleInfoPreBooking'] as String?,
      vehicleTypeId: json['vehicleTypeId'] as String?,
    );

Map<String, dynamic> _$UpdateVehicleRequestToJson(
        UpdateVehicleRequest instance) =>
    <String, dynamic>{
      'addVehicleLocationRequest': instance.addVehicleLocationRequest?.toJson(),
      'approvalType':
          updateVehicleRequestApprovalTypeNullableToJson(instance.approvalType),
      'clientId': instance.clientId,
      'description': instance.description,
      'electricRange': instance.electricRange,
      'equipmentIds': instance.equipmentIds,
      'expectedInFleetDate': instance.expectedInFleetDate?.toIso8601String(),
      'expectedOutOfFleetDate':
          instance.expectedOutOfFleetDate?.toIso8601String(),
      'imageUrl': instance.imageUrl,
      'intentIds': instance.intentIds,
      'lastPosition': instance.lastPosition?.toJson(),
      'lastPositionTimestamp':
          instance.lastPositionTimestamp?.toIso8601String(),
      'licensePlate': instance.licensePlate,
      'name': instance.name,
      'seats': instance.seats,
      'typeId': instance.typeId,
      'vehicleId': instance.vehicleId,
      'vehicleInfo': instance.vehicleInfo,
      'vehicleInfoPreBooking': instance.vehicleInfoPreBooking,
      'vehicleTypeId': instance.vehicleTypeId,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      boxNumber: json['boxNumber'] as String?,
      city: json['city'] as String?,
      dateCurrentLicense: json['dateCurrentLicense'] as String?,
      dateLicenseUntil: json['dateLicenseUntil'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      documentLinks: (json['documentLinks'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      houseNumber: json['houseNumber'] as String?,
      id: (json['id'] as num?)?.toInt(),
      lastName: json['lastName'] as String?,
      licenseNum: json['licenseNum'] as String?,
      licenseType: (json['licenseType'] as num?)?.toInt(),
      nationality: json['nationality'] as String?,
      nrOfAccidents: (json['nrOfAccidents'] as num?)?.toInt(),
      phoneNumber: json['phoneNumber'] as String?,
      postalCode: json['postalCode'] as String?,
      sofBattRemoteId: json['sofBattRemoteId'] as String?,
      streetname: json['streetname'] as String?,
      subscriptions: (json['subscriptions'] as List<dynamic>?)
              ?.map((e) => Subscription.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      verifiedCellPhoneNumber: json['verifiedCellPhoneNumber'] as bool?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'boxNumber': instance.boxNumber,
      'city': instance.city,
      'dateCurrentLicense': instance.dateCurrentLicense,
      'dateLicenseUntil': instance.dateLicenseUntil,
      'dateOfBirth': instance.dateOfBirth,
      'documentLinks': instance.documentLinks,
      'email': instance.email,
      'firstName': instance.firstName,
      'houseNumber': instance.houseNumber,
      'id': instance.id,
      'lastName': instance.lastName,
      'licenseNum': instance.licenseNum,
      'licenseType': instance.licenseType,
      'nationality': instance.nationality,
      'nrOfAccidents': instance.nrOfAccidents,
      'phoneNumber': instance.phoneNumber,
      'postalCode': instance.postalCode,
      'sofBattRemoteId': instance.sofBattRemoteId,
      'streetname': instance.streetname,
      'subscriptions': instance.subscriptions?.map((e) => e.toJson()).toList(),
      'verifiedCellPhoneNumber': instance.verifiedCellPhoneNumber,
    };

UserPage _$UserPageFromJson(Map<String, dynamic> json) => UserPage(
      users: (json['users'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$UserPageToJson(UserPage instance) => <String, dynamic>{
      'users': instance.users?.map((e) => e.toJson()).toList(),
    };

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => Vehicle(
      distance: (json['distance'] as num?)?.toDouble(),
      electricRange: (json['electricRange'] as num?)?.toInt(),
      fanPrice: json['fanPrice'] == null
          ? null
          : BookingPrice.fromJson(json['fanPrice'] as Map<String, dynamic>),
      favorite: json['favorite'] as bool?,
      funPrice: json['funPrice'] == null
          ? null
          : BookingPrice.fromJson(json['funPrice'] as Map<String, dynamic>),
      homePosition: json['homePosition'] == null
          ? null
          : GpsLocation.fromJson(json['homePosition'] as Map<String, dynamic>),
      id: json['id'] as String?,
      imageUrl: json['imageUrl'] as String?,
      lastPosition: json['lastPosition'] == null
          ? null
          : GpsLocation.fromJson(json['lastPosition'] as Map<String, dynamic>),
      lastPositionTimestamp: json['lastPositionTimestamp'] == null
          ? null
          : DateTime.parse(json['lastPositionTimestamp'] as String),
      licensePlate: json['licensePlate'] as String?,
      name: json['name'] as String?,
      operationalStatus:
          vehicleOperationalStatusNullableFromJson(json['operationalStatus']),
      vehicleBodyStyle: json['vehicleBodyStyle'] == null
          ? null
          : BodyStyle.fromJson(
              json['vehicleBodyStyle'] as Map<String, dynamic>),
      vehicleBrand: json['vehicleBrand'] == null
          ? null
          : VehicleBrand.fromJson(json['vehicleBrand'] as Map<String, dynamic>),
      vehicleModel: json['vehicleModel'] == null
          ? null
          : VehicleModel.fromJson(json['vehicleModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
      'distance': instance.distance,
      'electricRange': instance.electricRange,
      'fanPrice': instance.fanPrice?.toJson(),
      'favorite': instance.favorite,
      'funPrice': instance.funPrice?.toJson(),
      'homePosition': instance.homePosition?.toJson(),
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'lastPosition': instance.lastPosition?.toJson(),
      'lastPositionTimestamp':
          instance.lastPositionTimestamp?.toIso8601String(),
      'licensePlate': instance.licensePlate,
      'name': instance.name,
      'operationalStatus':
          vehicleOperationalStatusNullableToJson(instance.operationalStatus),
      'vehicleBodyStyle': instance.vehicleBodyStyle?.toJson(),
      'vehicleBrand': instance.vehicleBrand?.toJson(),
      'vehicleModel': instance.vehicleModel?.toJson(),
    };

VehicleBaseLocation _$VehicleBaseLocationFromJson(Map<String, dynamic> json) =>
    VehicleBaseLocation(
      adType: json['adType'] as String?,
      borough: json['borough'] as String?,
      homePosition: json['homePosition'] == null
          ? null
          : GpsLocation.fromJson(json['homePosition'] as Map<String, dynamic>),
      id: json['id'] as String?,
      memo: json['memo'] as String?,
      name: json['name'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$VehicleBaseLocationToJson(
        VehicleBaseLocation instance) =>
    <String, dynamic>{
      'adType': instance.adType,
      'borough': instance.borough,
      'homePosition': instance.homePosition?.toJson(),
      'id': instance.id,
      'memo': instance.memo,
      'name': instance.name,
      'status': instance.status,
    };

VehicleBaseLocationPage _$VehicleBaseLocationPageFromJson(
        Map<String, dynamic> json) =>
    VehicleBaseLocationPage(
      vehicleBaseLocations: (json['vehicleBaseLocations'] as List<dynamic>?)
              ?.map((e) =>
                  VehicleBaseLocation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$VehicleBaseLocationPageToJson(
        VehicleBaseLocationPage instance) =>
    <String, dynamic>{
      'vehicleBaseLocations':
          instance.vehicleBaseLocations?.map((e) => e.toJson()).toList(),
    };

VehicleBrand _$VehicleBrandFromJson(Map<String, dynamic> json) => VehicleBrand(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$VehicleBrandToJson(VehicleBrand instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

VehicleBrandPage _$VehicleBrandPageFromJson(Map<String, dynamic> json) =>
    VehicleBrandPage(
      vehicleBrands: (json['vehicleBrands'] as List<dynamic>?)
              ?.map((e) => VehicleBrand.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$VehicleBrandPageToJson(VehicleBrandPage instance) =>
    <String, dynamic>{
      'vehicleBrands': instance.vehicleBrands?.map((e) => e.toJson()).toList(),
    };

VehicleFilterCriteria _$VehicleFilterCriteriaFromJson(
        Map<String, dynamic> json) =>
    VehicleFilterCriteria(
      bodyStyleIds: (json['bodyStyleIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      brandIds: (json['brandIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      licensePlate: json['licensePlate'] as String?,
      minRange: (json['minRange'] as num?)?.toInt(),
      modelIds: (json['modelIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      name: json['name'] as String?,
    );

Map<String, dynamic> _$VehicleFilterCriteriaToJson(
        VehicleFilterCriteria instance) =>
    <String, dynamic>{
      'bodyStyleIds': instance.bodyStyleIds,
      'brandIds': instance.brandIds,
      'licensePlate': instance.licensePlate,
      'minRange': instance.minRange,
      'modelIds': instance.modelIds,
      'name': instance.name,
    };

VehicleFilterEnums _$VehicleFilterEnumsFromJson(Map<String, dynamic> json) =>
    VehicleFilterEnums(
      bodyStyles: (json['bodyStyles'] as List<dynamic>?)
              ?.map((e) => BodyStyle.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      brands: (json['brands'] as List<dynamic>?)
              ?.map((e) => VehicleBrand.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      models: (json['models'] as List<dynamic>?)
              ?.map((e) => VehicleModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$VehicleFilterEnumsToJson(VehicleFilterEnums instance) =>
    <String, dynamic>{
      'bodyStyles': instance.bodyStyles?.map((e) => e.toJson()).toList(),
      'brands': instance.brands?.map((e) => e.toJson()).toList(),
      'models': instance.models?.map((e) => e.toJson()).toList(),
    };

VehicleGroup _$VehicleGroupFromJson(Map<String, dynamic> json) => VehicleGroup(
      id: json['id'] as String?,
      name: json['name'] as String?,
      vehicles: (json['vehicles'] as List<dynamic>?)
              ?.map((e) => Vehicle.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$VehicleGroupToJson(VehicleGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'vehicles': instance.vehicles?.map((e) => e.toJson()).toList(),
    };

VehicleGroupPage _$VehicleGroupPageFromJson(Map<String, dynamic> json) =>
    VehicleGroupPage(
      vehicleGroups: (json['vehicleGroups'] as List<dynamic>?)
              ?.map((e) => VehicleGroup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$VehicleGroupPageToJson(VehicleGroupPage instance) =>
    <String, dynamic>{
      'vehicleGroups': instance.vehicleGroups?.map((e) => e.toJson()).toList(),
    };

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) => VehicleModel(
      bodyStyle: json['bodyStyle'] == null
          ? null
          : BodyStyle.fromJson(json['bodyStyle'] as Map<String, dynamic>),
      brandId: json['brandId'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$VehicleModelToJson(VehicleModel instance) =>
    <String, dynamic>{
      'bodyStyle': instance.bodyStyle?.toJson(),
      'brandId': instance.brandId,
      'id': instance.id,
      'name': instance.name,
    };

VehicleModelPage _$VehicleModelPageFromJson(Map<String, dynamic> json) =>
    VehicleModelPage(
      vehicleModels: (json['vehicleModels'] as List<dynamic>?)
              ?.map((e) => VehicleModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$VehicleModelPageToJson(VehicleModelPage instance) =>
    <String, dynamic>{
      'vehicleModels': instance.vehicleModels?.map((e) => e.toJson()).toList(),
    };

VehicleUsage _$VehicleUsageFromJson(Map<String, dynamic> json) => VehicleUsage(
      id: json['id'] as String?,
      mileageDelta: (json['mileageDelta'] as num?)?.toDouble(),
      mileageEndValue: (json['mileageEndValue'] as num?)?.toDouble(),
      mileageStartValue: (json['mileageStartValue'] as num?)?.toDouble(),
      period: json['period'] == null
          ? null
          : Period.fromJson(json['period'] as Map<String, dynamic>),
      status: vehicleUsageStatusNullableFromJson(json['status']),
      statusMessage: json['statusMessage'] as String?,
      trips: (json['trips'] as List<dynamic>?)
              ?.map((e) => Trip.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$VehicleUsageToJson(VehicleUsage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mileageDelta': instance.mileageDelta,
      'mileageEndValue': instance.mileageEndValue,
      'mileageStartValue': instance.mileageStartValue,
      'period': instance.period?.toJson(),
      'status': vehicleUsageStatusNullableToJson(instance.status),
      'statusMessage': instance.statusMessage,
      'trips': instance.trips?.map((e) => e.toJson()).toList(),
    };

VehicleUsagePage _$VehicleUsagePageFromJson(Map<String, dynamic> json) =>
    VehicleUsagePage(
      vehicleUsages: (json['vehicleUsages'] as List<dynamic>?)
              ?.map((e) => VehicleUsage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$VehicleUsagePageToJson(VehicleUsagePage instance) =>
    <String, dynamic>{
      'vehicleUsages': instance.vehicleUsages?.map((e) => e.toJson()).toList(),
    };

VehicleUsageReference _$VehicleUsageReferenceFromJson(
        Map<String, dynamic> json) =>
    VehicleUsageReference(
      id: json['id'] as String?,
      period: json['period'] == null
          ? null
          : Period.fromJson(json['period'] as Map<String, dynamic>),
      status: vehicleUsageReferenceStatusNullableFromJson(json['status']),
      statusMessage: json['statusMessage'] as String?,
    );

Map<String, dynamic> _$VehicleUsageReferenceToJson(
        VehicleUsageReference instance) =>
    <String, dynamic>{
      'id': instance.id,
      'period': instance.period?.toJson(),
      'status': vehicleUsageReferenceStatusNullableToJson(instance.status),
      'statusMessage': instance.statusMessage,
    };

VehicleUsageUpdateStatusRequest _$VehicleUsageUpdateStatusRequestFromJson(
        Map<String, dynamic> json) =>
    VehicleUsageUpdateStatusRequest(
      mileage: (json['mileage'] as num?)?.toDouble(),
      status: vehicleUsageUpdateStatusRequestStatusFromJson(json['status']),
      statusMessage: json['statusMessage'] as String?,
    );

Map<String, dynamic> _$VehicleUsageUpdateStatusRequestToJson(
        VehicleUsageUpdateStatusRequest instance) =>
    <String, dynamic>{
      'mileage': instance.mileage,
      'status': vehicleUsageUpdateStatusRequestStatusToJson(instance.status),
      'statusMessage': instance.statusMessage,
    };

VehiclesPage _$VehiclesPageFromJson(Map<String, dynamic> json) => VehiclesPage(
      vehicles: (json['vehicles'] as List<dynamic>?)
              ?.map((e) => Vehicle.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$VehiclesPageToJson(VehiclesPage instance) =>
    <String, dynamic>{
      'vehicles': instance.vehicles?.map((e) => e.toJson()).toList(),
    };

ContractsConvictions _$ContractsConvictionsFromJson(
        Map<String, dynamic> json) =>
    ContractsConvictions(
      convictionBloodTestRefusal: json['convictionBloodTestRefusal'] as bool?,
      convictionDrunk: json['convictionDrunk'] as bool?,
      convictionHitAndRun: json['convictionHitAndRun'] as bool?,
      convictionIntoxicated: json['convictionIntoxicated'] as bool?,
      convictionLicenseRevocation: json['convictionLicenseRevocation'] as bool?,
    );

Map<String, dynamic> _$ContractsConvictionsToJson(
        ContractsConvictions instance) =>
    <String, dynamic>{
      'convictionBloodTestRefusal': instance.convictionBloodTestRefusal,
      'convictionDrunk': instance.convictionDrunk,
      'convictionHitAndRun': instance.convictionHitAndRun,
      'convictionIntoxicated': instance.convictionIntoxicated,
      'convictionLicenseRevocation': instance.convictionLicenseRevocation,
    };

ContractsCreateClient _$ContractsCreateClientFromJson(
        Map<String, dynamic> json) =>
    ContractsCreateClient(
      city: json['city'] as String,
      country: json['country'] as String,
      email: json['email'] as String,
      houseNumber: json['houseNumber'] as String,
      name: json['name'] as String,
      postalCode: json['postalCode'] as String,
      street: json['street'] as String,
      vat: json['vat'] as String?,
    );

Map<String, dynamic> _$ContractsCreateClientToJson(
        ContractsCreateClient instance) =>
    <String, dynamic>{
      'city': instance.city,
      'country': instance.country,
      'email': instance.email,
      'houseNumber': instance.houseNumber,
      'name': instance.name,
      'postalCode': instance.postalCode,
      'street': instance.street,
      'vat': instance.vat,
    };

ContractsOnboarding _$ContractsOnboardingFromJson(Map<String, dynamic> json) =>
    ContractsOnboarding(
      legal: json['legal'] == null
          ? null
          : ContractsOnboardingLegal.fromJson(
              json['legal'] as Map<String, dynamic>),
      personal: json['personal'] == null
          ? null
          : ContractsOnboardingPersonal.fromJson(
              json['personal'] as Map<String, dynamic>),
      phone: json['phone'] == null
          ? null
          : ContractsOnboardingPhone.fromJson(
              json['phone'] as Map<String, dynamic>),
      status: contractsOnboardingStatusNullableFromJson(json['status']),
    );

Map<String, dynamic> _$ContractsOnboardingToJson(
        ContractsOnboarding instance) =>
    <String, dynamic>{
      'legal': instance.legal?.toJson(),
      'personal': instance.personal?.toJson(),
      'phone': instance.phone?.toJson(),
      'status': contractsOnboardingStatusNullableToJson(instance.status),
    };

ContractsOnboardingLegal _$ContractsOnboardingLegalFromJson(
        Map<String, dynamic> json) =>
    ContractsOnboardingLegal(
      convictions: ContractsConvictions.fromJson(
          json['convictions'] as Map<String, dynamic>),
      nrOfAccidents: (json['nrOfAccidents'] as num).toInt(),
    );

Map<String, dynamic> _$ContractsOnboardingLegalToJson(
        ContractsOnboardingLegal instance) =>
    <String, dynamic>{
      'convictions': instance.convictions.toJson(),
      'nrOfAccidents': instance.nrOfAccidents,
    };

ContractsOnboardingPersonal _$ContractsOnboardingPersonalFromJson(
        Map<String, dynamic> json) =>
    ContractsOnboardingPersonal(
      box: json['box'] as String,
      city: json['city'] as String,
      dateCurrentLicense: DateTime.parse(json['dateCurrentLicense'] as String),
      dateLicenseUntil: DateTime.parse(json['dateLicenseUntil'] as String),
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      firstName: json['firstName'] as String,
      houseNumber: json['houseNumber'] as String,
      lastName: json['lastName'] as String,
      licenseNumber: json['licenseNumber'] as String,
      licenseType:
          contractsOnboardingPersonalLicenseTypeFromJson(json['licenseType']),
      nationality: json['nationality'] as String,
      postalCode: json['postalCode'] as String,
      socialSecurityNumber: json['socialSecurityNumber'] as String,
      street: json['street'] as String,
    );

Map<String, dynamic> _$ContractsOnboardingPersonalToJson(
        ContractsOnboardingPersonal instance) =>
    <String, dynamic>{
      'box': instance.box,
      'city': instance.city,
      'dateCurrentLicense': instance.dateCurrentLicense.toIso8601String(),
      'dateLicenseUntil': instance.dateLicenseUntil.toIso8601String(),
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'firstName': instance.firstName,
      'houseNumber': instance.houseNumber,
      'lastName': instance.lastName,
      'licenseNumber': instance.licenseNumber,
      'licenseType':
          contractsOnboardingPersonalLicenseTypeToJson(instance.licenseType),
      'nationality': instance.nationality,
      'postalCode': instance.postalCode,
      'socialSecurityNumber': instance.socialSecurityNumber,
      'street': instance.street,
    };

ContractsOnboardingPhone _$ContractsOnboardingPhoneFromJson(
        Map<String, dynamic> json) =>
    ContractsOnboardingPhone(
      phoneNumber: json['phoneNumber'] as String,
      phoneNumberValidationCode: json['phoneNumberValidationCode'] as String?,
    );

Map<String, dynamic> _$ContractsOnboardingPhoneToJson(
        ContractsOnboardingPhone instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'phoneNumberValidationCode': instance.phoneNumberValidationCode,
    };

ContractsPasswordReset _$ContractsPasswordResetFromJson(
        Map<String, dynamic> json) =>
    ContractsPasswordReset(
      email: json['email'] as String,
    );

Map<String, dynamic> _$ContractsPasswordResetToJson(
        ContractsPasswordReset instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

ContractsSignupUser _$ContractsSignupUserFromJson(Map<String, dynamic> json) =>
    ContractsSignupUser(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$ContractsSignupUserToJson(
        ContractsSignupUser instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

UserV1ImageUserIdPost$RequestBody _$UserV1ImageUserIdPost$RequestBodyFromJson(
        Map<String, dynamic> json) =>
    UserV1ImageUserIdPost$RequestBody(
      file: json['file'] as String,
    );

Map<String, dynamic> _$UserV1ImageUserIdPost$RequestBodyToJson(
        UserV1ImageUserIdPost$RequestBody instance) =>
    <String, dynamic>{
      'file': instance.file,
    };

UserV1UsersOnboardingDocumentsPut$RequestBody
    _$UserV1UsersOnboardingDocumentsPut$RequestBodyFromJson(
            Map<String, dynamic> json) =>
        UserV1UsersOnboardingDocumentsPut$RequestBody(
          backDriverLicense: json['backDriverLicense'] as String?,
          backId: json['backId'] as String?,
          damageStatistic: json['damageStatistic'] as String?,
          frontDriverLicense: json['frontDriverLicense'] as String?,
          frontId: json['frontId'] as String?,
          selfie: json['selfie'] as String?,
        );

Map<String, dynamic> _$UserV1UsersOnboardingDocumentsPut$RequestBodyToJson(
        UserV1UsersOnboardingDocumentsPut$RequestBody instance) =>
    <String, dynamic>{
      'backDriverLicense': instance.backDriverLicense,
      'backId': instance.backId,
      'damageStatistic': instance.damageStatistic,
      'frontDriverLicense': instance.frontDriverLicense,
      'frontId': instance.frontId,
      'selfie': instance.selfie,
    };

VehicleV1VehicleImageVehicleIdPost$RequestBody
    _$VehicleV1VehicleImageVehicleIdPost$RequestBodyFromJson(
            Map<String, dynamic> json) =>
        VehicleV1VehicleImageVehicleIdPost$RequestBody(
          file: json['file'] as String,
        );

Map<String, dynamic> _$VehicleV1VehicleImageVehicleIdPost$RequestBodyToJson(
        VehicleV1VehicleImageVehicleIdPost$RequestBody instance) =>
    <String, dynamic>{
      'file': instance.file,
    };
