// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'mobile_api.enums.swagger.dart' as enums;

part 'mobile_api.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class AddVehicleLocationRequest {
  const AddVehicleLocationRequest({
    this.from,
    this.name,
    this.vehicleBaseLocationId,
  });

  factory AddVehicleLocationRequest.fromJson(Map<String, dynamic> json) =>
      _$AddVehicleLocationRequestFromJson(json);

  static const toJsonFactory = _$AddVehicleLocationRequestToJson;
  Map<String, dynamic> toJson() => _$AddVehicleLocationRequestToJson(this);

  @JsonKey(name: 'from')
  final DateTime? from;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'vehicleBaseLocationId')
  final String? vehicleBaseLocationId;
  static const fromJsonFactory = _$AddVehicleLocationRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AddVehicleLocationRequest &&
            (identical(other.from, from) ||
                const DeepCollectionEquality().equals(other.from, from)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.vehicleBaseLocationId, vehicleBaseLocationId) ||
                const DeepCollectionEquality().equals(
                    other.vehicleBaseLocationId, vehicleBaseLocationId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(from) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(vehicleBaseLocationId) ^
      runtimeType.hashCode;
}

extension $AddVehicleLocationRequestExtension on AddVehicleLocationRequest {
  AddVehicleLocationRequest copyWith(
      {DateTime? from, String? name, String? vehicleBaseLocationId}) {
    return AddVehicleLocationRequest(
        from: from ?? this.from,
        name: name ?? this.name,
        vehicleBaseLocationId:
            vehicleBaseLocationId ?? this.vehicleBaseLocationId);
  }

  AddVehicleLocationRequest copyWithWrapped(
      {Wrapped<DateTime?>? from,
      Wrapped<String?>? name,
      Wrapped<String?>? vehicleBaseLocationId}) {
    return AddVehicleLocationRequest(
        from: (from != null ? from.value : this.from),
        name: (name != null ? name.value : this.name),
        vehicleBaseLocationId: (vehicleBaseLocationId != null
            ? vehicleBaseLocationId.value
            : this.vehicleBaseLocationId));
  }
}

@JsonSerializable(explicitToJson: true)
class AddVehiclesToGroupRequest {
  const AddVehiclesToGroupRequest({
    this.vehicleIds,
  });

  factory AddVehiclesToGroupRequest.fromJson(Map<String, dynamic> json) =>
      _$AddVehiclesToGroupRequestFromJson(json);

  static const toJsonFactory = _$AddVehiclesToGroupRequestToJson;
  Map<String, dynamic> toJson() => _$AddVehiclesToGroupRequestToJson(this);

  @JsonKey(name: 'vehicleIds', defaultValue: <String>[])
  final List<String>? vehicleIds;
  static const fromJsonFactory = _$AddVehiclesToGroupRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AddVehiclesToGroupRequest &&
            (identical(other.vehicleIds, vehicleIds) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleIds, vehicleIds)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(vehicleIds) ^ runtimeType.hashCode;
}

extension $AddVehiclesToGroupRequestExtension on AddVehiclesToGroupRequest {
  AddVehiclesToGroupRequest copyWith({List<String>? vehicleIds}) {
    return AddVehiclesToGroupRequest(vehicleIds: vehicleIds ?? this.vehicleIds);
  }

  AddVehiclesToGroupRequest copyWithWrapped(
      {Wrapped<List<String>?>? vehicleIds}) {
    return AddVehiclesToGroupRequest(
        vehicleIds: (vehicleIds != null ? vehicleIds.value : this.vehicleIds));
  }
}

@JsonSerializable(explicitToJson: true)
class AdjacentNonAvailability {
  const AdjacentNonAvailability({
    this.active,
    this.bookingId,
    this.period,
    this.type,
    this.userId,
    this.userName,
  });

  factory AdjacentNonAvailability.fromJson(Map<String, dynamic> json) =>
      _$AdjacentNonAvailabilityFromJson(json);

  static const toJsonFactory = _$AdjacentNonAvailabilityToJson;
  Map<String, dynamic> toJson() => _$AdjacentNonAvailabilityToJson(this);

  @JsonKey(name: 'active')
  final bool? active;
  @JsonKey(name: 'bookingId')
  final String? bookingId;
  @JsonKey(name: 'period')
  final Period? period;
  @JsonKey(
    name: 'type',
    toJson: adjacentNonAvailabilityTypeNullableToJson,
    fromJson: adjacentNonAvailabilityTypeNullableFromJson,
  )
  final enums.AdjacentNonAvailabilityType? type;
  @JsonKey(name: 'userId')
  final String? userId;
  @JsonKey(name: 'userName')
  final String? userName;
  static const fromJsonFactory = _$AdjacentNonAvailabilityFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AdjacentNonAvailability &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.bookingId, bookingId) ||
                const DeepCollectionEquality()
                    .equals(other.bookingId, bookingId)) &&
            (identical(other.period, period) ||
                const DeepCollectionEquality().equals(other.period, period)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(bookingId) ^
      const DeepCollectionEquality().hash(period) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(userName) ^
      runtimeType.hashCode;
}

extension $AdjacentNonAvailabilityExtension on AdjacentNonAvailability {
  AdjacentNonAvailability copyWith(
      {bool? active,
      String? bookingId,
      Period? period,
      enums.AdjacentNonAvailabilityType? type,
      String? userId,
      String? userName}) {
    return AdjacentNonAvailability(
        active: active ?? this.active,
        bookingId: bookingId ?? this.bookingId,
        period: period ?? this.period,
        type: type ?? this.type,
        userId: userId ?? this.userId,
        userName: userName ?? this.userName);
  }

  AdjacentNonAvailability copyWithWrapped(
      {Wrapped<bool?>? active,
      Wrapped<String?>? bookingId,
      Wrapped<Period?>? period,
      Wrapped<enums.AdjacentNonAvailabilityType?>? type,
      Wrapped<String?>? userId,
      Wrapped<String?>? userName}) {
    return AdjacentNonAvailability(
        active: (active != null ? active.value : this.active),
        bookingId: (bookingId != null ? bookingId.value : this.bookingId),
        period: (period != null ? period.value : this.period),
        type: (type != null ? type.value : this.type),
        userId: (userId != null ? userId.value : this.userId),
        userName: (userName != null ? userName.value : this.userName));
  }
}

@JsonSerializable(explicitToJson: true)
class AvailabilityConflict {
  const AvailabilityConflict({
    this.nonAvailabilities,
    this.splitNonConflictPeriods,
  });

  factory AvailabilityConflict.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityConflictFromJson(json);

  static const toJsonFactory = _$AvailabilityConflictToJson;
  Map<String, dynamic> toJson() => _$AvailabilityConflictToJson(this);

  @JsonKey(name: 'nonAvailabilities', defaultValue: <NonAvailability>[])
  final List<NonAvailability>? nonAvailabilities;
  @JsonKey(name: 'splitNonConflictPeriods', defaultValue: <Period>[])
  final List<Period>? splitNonConflictPeriods;
  static const fromJsonFactory = _$AvailabilityConflictFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AvailabilityConflict &&
            (identical(other.nonAvailabilities, nonAvailabilities) ||
                const DeepCollectionEquality()
                    .equals(other.nonAvailabilities, nonAvailabilities)) &&
            (identical(
                    other.splitNonConflictPeriods, splitNonConflictPeriods) ||
                const DeepCollectionEquality().equals(
                    other.splitNonConflictPeriods, splitNonConflictPeriods)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(nonAvailabilities) ^
      const DeepCollectionEquality().hash(splitNonConflictPeriods) ^
      runtimeType.hashCode;
}

extension $AvailabilityConflictExtension on AvailabilityConflict {
  AvailabilityConflict copyWith(
      {List<NonAvailability>? nonAvailabilities,
      List<Period>? splitNonConflictPeriods}) {
    return AvailabilityConflict(
        nonAvailabilities: nonAvailabilities ?? this.nonAvailabilities,
        splitNonConflictPeriods:
            splitNonConflictPeriods ?? this.splitNonConflictPeriods);
  }

  AvailabilityConflict copyWithWrapped(
      {Wrapped<List<NonAvailability>?>? nonAvailabilities,
      Wrapped<List<Period>?>? splitNonConflictPeriods}) {
    return AvailabilityConflict(
        nonAvailabilities: (nonAvailabilities != null
            ? nonAvailabilities.value
            : this.nonAvailabilities),
        splitNonConflictPeriods: (splitNonConflictPeriods != null
            ? splitNonConflictPeriods.value
            : this.splitNonConflictPeriods));
  }
}

@JsonSerializable(explicitToJson: true)
class BillingPrice {
  const BillingPrice({
    this.amount,
    this.changeFromHourlyToDaily,
    this.endDate,
    this.hourlyTotalNotCharged,
    this.hourlyTotalNotChargedExclVat,
    this.km,
    this.kmPrice,
    this.kmPriceExclVat,
    this.kmTotal,
    this.kmTotalExclVat,
    this.startDate,
    this.timeAmount,
    this.timeTotal,
    this.timeTotalExclVat,
    this.total,
    this.totalExclVat,
    this.totalVat,
    this.unit,
    this.unitPrice,
    this.unitPriceExclVat,
    this.vatRate,
  });

  factory BillingPrice.fromJson(Map<String, dynamic> json) =>
      _$BillingPriceFromJson(json);

  static const toJsonFactory = _$BillingPriceToJson;
  Map<String, dynamic> toJson() => _$BillingPriceToJson(this);

  @JsonKey(name: 'amount')
  final int? amount;
  @JsonKey(name: 'changeFromHourlyToDaily')
  final bool? changeFromHourlyToDaily;
  @JsonKey(name: 'endDate')
  final DateTime? endDate;
  @JsonKey(name: 'hourlyTotalNotCharged')
  final double? hourlyTotalNotCharged;
  @JsonKey(name: 'hourlyTotalNotChargedExclVat')
  final double? hourlyTotalNotChargedExclVat;
  @JsonKey(name: 'km')
  final int? km;
  @JsonKey(name: 'kmPrice')
  final double? kmPrice;
  @JsonKey(name: 'kmPriceExclVat')
  final double? kmPriceExclVat;
  @JsonKey(name: 'kmTotal')
  final double? kmTotal;
  @JsonKey(name: 'kmTotalExclVat')
  final double? kmTotalExclVat;
  @JsonKey(name: 'startDate')
  final DateTime? startDate;
  @JsonKey(name: 'timeAmount')
  final double? timeAmount;
  @JsonKey(name: 'timeTotal')
  final double? timeTotal;
  @JsonKey(name: 'timeTotalExclVat')
  final double? timeTotalExclVat;
  @JsonKey(name: 'total')
  final double? total;
  @JsonKey(name: 'totalExclVat')
  final double? totalExclVat;
  @JsonKey(name: 'totalVat')
  final double? totalVat;
  @JsonKey(
    name: 'unit',
    toJson: billingPriceUnitNullableToJson,
    fromJson: billingPriceUnitNullableFromJson,
  )
  final enums.BillingPriceUnit? unit;
  @JsonKey(name: 'unitPrice')
  final double? unitPrice;
  @JsonKey(name: 'unitPriceExclVat')
  final double? unitPriceExclVat;
  @JsonKey(name: 'vatRate')
  final double? vatRate;
  static const fromJsonFactory = _$BillingPriceFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BillingPrice &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.changeFromHourlyToDaily, changeFromHourlyToDaily) ||
                const DeepCollectionEquality().equals(
                    other.changeFromHourlyToDaily, changeFromHourlyToDaily)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.hourlyTotalNotCharged, hourlyTotalNotCharged) ||
                const DeepCollectionEquality().equals(
                    other.hourlyTotalNotCharged, hourlyTotalNotCharged)) &&
            (identical(other.hourlyTotalNotChargedExclVat, hourlyTotalNotChargedExclVat) ||
                const DeepCollectionEquality().equals(
                    other.hourlyTotalNotChargedExclVat,
                    hourlyTotalNotChargedExclVat)) &&
            (identical(other.km, km) ||
                const DeepCollectionEquality().equals(other.km, km)) &&
            (identical(other.kmPrice, kmPrice) ||
                const DeepCollectionEquality()
                    .equals(other.kmPrice, kmPrice)) &&
            (identical(other.kmPriceExclVat, kmPriceExclVat) ||
                const DeepCollectionEquality()
                    .equals(other.kmPriceExclVat, kmPriceExclVat)) &&
            (identical(other.kmTotal, kmTotal) ||
                const DeepCollectionEquality()
                    .equals(other.kmTotal, kmTotal)) &&
            (identical(other.kmTotalExclVat, kmTotalExclVat) ||
                const DeepCollectionEquality()
                    .equals(other.kmTotalExclVat, kmTotalExclVat)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.timeAmount, timeAmount) ||
                const DeepCollectionEquality()
                    .equals(other.timeAmount, timeAmount)) &&
            (identical(other.timeTotal, timeTotal) ||
                const DeepCollectionEquality()
                    .equals(other.timeTotal, timeTotal)) &&
            (identical(other.timeTotalExclVat, timeTotalExclVat) ||
                const DeepCollectionEquality()
                    .equals(other.timeTotalExclVat, timeTotalExclVat)) &&
            (identical(other.total, total) || const DeepCollectionEquality().equals(other.total, total)) &&
            (identical(other.totalExclVat, totalExclVat) || const DeepCollectionEquality().equals(other.totalExclVat, totalExclVat)) &&
            (identical(other.totalVat, totalVat) || const DeepCollectionEquality().equals(other.totalVat, totalVat)) &&
            (identical(other.unit, unit) || const DeepCollectionEquality().equals(other.unit, unit)) &&
            (identical(other.unitPrice, unitPrice) || const DeepCollectionEquality().equals(other.unitPrice, unitPrice)) &&
            (identical(other.unitPriceExclVat, unitPriceExclVat) || const DeepCollectionEquality().equals(other.unitPriceExclVat, unitPriceExclVat)) &&
            (identical(other.vatRate, vatRate) || const DeepCollectionEquality().equals(other.vatRate, vatRate)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(changeFromHourlyToDaily) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(hourlyTotalNotCharged) ^
      const DeepCollectionEquality().hash(hourlyTotalNotChargedExclVat) ^
      const DeepCollectionEquality().hash(km) ^
      const DeepCollectionEquality().hash(kmPrice) ^
      const DeepCollectionEquality().hash(kmPriceExclVat) ^
      const DeepCollectionEquality().hash(kmTotal) ^
      const DeepCollectionEquality().hash(kmTotalExclVat) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(timeAmount) ^
      const DeepCollectionEquality().hash(timeTotal) ^
      const DeepCollectionEquality().hash(timeTotalExclVat) ^
      const DeepCollectionEquality().hash(total) ^
      const DeepCollectionEquality().hash(totalExclVat) ^
      const DeepCollectionEquality().hash(totalVat) ^
      const DeepCollectionEquality().hash(unit) ^
      const DeepCollectionEquality().hash(unitPrice) ^
      const DeepCollectionEquality().hash(unitPriceExclVat) ^
      const DeepCollectionEquality().hash(vatRate) ^
      runtimeType.hashCode;
}

extension $BillingPriceExtension on BillingPrice {
  BillingPrice copyWith(
      {int? amount,
      bool? changeFromHourlyToDaily,
      DateTime? endDate,
      double? hourlyTotalNotCharged,
      double? hourlyTotalNotChargedExclVat,
      int? km,
      double? kmPrice,
      double? kmPriceExclVat,
      double? kmTotal,
      double? kmTotalExclVat,
      DateTime? startDate,
      double? timeAmount,
      double? timeTotal,
      double? timeTotalExclVat,
      double? total,
      double? totalExclVat,
      double? totalVat,
      enums.BillingPriceUnit? unit,
      double? unitPrice,
      double? unitPriceExclVat,
      double? vatRate}) {
    return BillingPrice(
        amount: amount ?? this.amount,
        changeFromHourlyToDaily:
            changeFromHourlyToDaily ?? this.changeFromHourlyToDaily,
        endDate: endDate ?? this.endDate,
        hourlyTotalNotCharged:
            hourlyTotalNotCharged ?? this.hourlyTotalNotCharged,
        hourlyTotalNotChargedExclVat:
            hourlyTotalNotChargedExclVat ?? this.hourlyTotalNotChargedExclVat,
        km: km ?? this.km,
        kmPrice: kmPrice ?? this.kmPrice,
        kmPriceExclVat: kmPriceExclVat ?? this.kmPriceExclVat,
        kmTotal: kmTotal ?? this.kmTotal,
        kmTotalExclVat: kmTotalExclVat ?? this.kmTotalExclVat,
        startDate: startDate ?? this.startDate,
        timeAmount: timeAmount ?? this.timeAmount,
        timeTotal: timeTotal ?? this.timeTotal,
        timeTotalExclVat: timeTotalExclVat ?? this.timeTotalExclVat,
        total: total ?? this.total,
        totalExclVat: totalExclVat ?? this.totalExclVat,
        totalVat: totalVat ?? this.totalVat,
        unit: unit ?? this.unit,
        unitPrice: unitPrice ?? this.unitPrice,
        unitPriceExclVat: unitPriceExclVat ?? this.unitPriceExclVat,
        vatRate: vatRate ?? this.vatRate);
  }

  BillingPrice copyWithWrapped(
      {Wrapped<int?>? amount,
      Wrapped<bool?>? changeFromHourlyToDaily,
      Wrapped<DateTime?>? endDate,
      Wrapped<double?>? hourlyTotalNotCharged,
      Wrapped<double?>? hourlyTotalNotChargedExclVat,
      Wrapped<int?>? km,
      Wrapped<double?>? kmPrice,
      Wrapped<double?>? kmPriceExclVat,
      Wrapped<double?>? kmTotal,
      Wrapped<double?>? kmTotalExclVat,
      Wrapped<DateTime?>? startDate,
      Wrapped<double?>? timeAmount,
      Wrapped<double?>? timeTotal,
      Wrapped<double?>? timeTotalExclVat,
      Wrapped<double?>? total,
      Wrapped<double?>? totalExclVat,
      Wrapped<double?>? totalVat,
      Wrapped<enums.BillingPriceUnit?>? unit,
      Wrapped<double?>? unitPrice,
      Wrapped<double?>? unitPriceExclVat,
      Wrapped<double?>? vatRate}) {
    return BillingPrice(
        amount: (amount != null ? amount.value : this.amount),
        changeFromHourlyToDaily: (changeFromHourlyToDaily != null
            ? changeFromHourlyToDaily.value
            : this.changeFromHourlyToDaily),
        endDate: (endDate != null ? endDate.value : this.endDate),
        hourlyTotalNotCharged: (hourlyTotalNotCharged != null
            ? hourlyTotalNotCharged.value
            : this.hourlyTotalNotCharged),
        hourlyTotalNotChargedExclVat: (hourlyTotalNotChargedExclVat != null
            ? hourlyTotalNotChargedExclVat.value
            : this.hourlyTotalNotChargedExclVat),
        km: (km != null ? km.value : this.km),
        kmPrice: (kmPrice != null ? kmPrice.value : this.kmPrice),
        kmPriceExclVat: (kmPriceExclVat != null
            ? kmPriceExclVat.value
            : this.kmPriceExclVat),
        kmTotal: (kmTotal != null ? kmTotal.value : this.kmTotal),
        kmTotalExclVat: (kmTotalExclVat != null
            ? kmTotalExclVat.value
            : this.kmTotalExclVat),
        startDate: (startDate != null ? startDate.value : this.startDate),
        timeAmount: (timeAmount != null ? timeAmount.value : this.timeAmount),
        timeTotal: (timeTotal != null ? timeTotal.value : this.timeTotal),
        timeTotalExclVat: (timeTotalExclVat != null
            ? timeTotalExclVat.value
            : this.timeTotalExclVat),
        total: (total != null ? total.value : this.total),
        totalExclVat:
            (totalExclVat != null ? totalExclVat.value : this.totalExclVat),
        totalVat: (totalVat != null ? totalVat.value : this.totalVat),
        unit: (unit != null ? unit.value : this.unit),
        unitPrice: (unitPrice != null ? unitPrice.value : this.unitPrice),
        unitPriceExclVat: (unitPriceExclVat != null
            ? unitPriceExclVat.value
            : this.unitPriceExclVat),
        vatRate: (vatRate != null ? vatRate.value : this.vatRate));
  }
}

@JsonSerializable(explicitToJson: true)
class BodyStyle {
  const BodyStyle({
    this.description,
    this.id,
  });

  factory BodyStyle.fromJson(Map<String, dynamic> json) =>
      _$BodyStyleFromJson(json);

  static const toJsonFactory = _$BodyStyleToJson;
  Map<String, dynamic> toJson() => _$BodyStyleToJson(this);

  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'id')
  final String? id;
  static const fromJsonFactory = _$BodyStyleFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BodyStyle &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $BodyStyleExtension on BodyStyle {
  BodyStyle copyWith({String? description, String? id}) {
    return BodyStyle(
        description: description ?? this.description, id: id ?? this.id);
  }

  BodyStyle copyWithWrapped(
      {Wrapped<String?>? description, Wrapped<String?>? id}) {
    return BodyStyle(
        description:
            (description != null ? description.value : this.description),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class BodyStylePage {
  const BodyStylePage({
    this.bodyStyles,
  });

  factory BodyStylePage.fromJson(Map<String, dynamic> json) =>
      _$BodyStylePageFromJson(json);

  static const toJsonFactory = _$BodyStylePageToJson;
  Map<String, dynamic> toJson() => _$BodyStylePageToJson(this);

  @JsonKey(name: 'bodyStyles', defaultValue: <BodyStyle>[])
  final List<BodyStyle>? bodyStyles;
  static const fromJsonFactory = _$BodyStylePageFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BodyStylePage &&
            (identical(other.bodyStyles, bodyStyles) ||
                const DeepCollectionEquality()
                    .equals(other.bodyStyles, bodyStyles)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(bodyStyles) ^ runtimeType.hashCode;
}

extension $BodyStylePageExtension on BodyStylePage {
  BodyStylePage copyWith({List<BodyStyle>? bodyStyles}) {
    return BodyStylePage(bodyStyles: bodyStyles ?? this.bodyStyles);
  }

  BodyStylePage copyWithWrapped({Wrapped<List<BodyStyle>?>? bodyStyles}) {
    return BodyStylePage(
        bodyStyles: (bodyStyles != null ? bodyStyles.value : this.bodyStyles));
  }
}

@JsonSerializable(explicitToJson: true)
class Booking {
  const Booking({
    this.adminComments,
    this.billingPrice,
    this.cancelDate,
    this.cancelReason,
    this.clientId,
    this.comments,
    this.dateCreated,
    this.id,
    this.invoiceStatus,
    this.lastUpdated,
    this.nextPossibleStatuses,
    this.originalEndDate,
    this.period,
    this.status,
    this.userId,
    this.vehicle,
    this.vehicleUsage,
  });

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);

  static const toJsonFactory = _$BookingToJson;
  Map<String, dynamic> toJson() => _$BookingToJson(this);

  @JsonKey(name: 'adminComments')
  final String? adminComments;
  @JsonKey(name: 'billingPrice')
  final BillingPrice? billingPrice;
  @JsonKey(name: 'cancelDate')
  final DateTime? cancelDate;
  @JsonKey(name: 'cancelReason')
  final String? cancelReason;
  @JsonKey(name: 'clientId')
  final String? clientId;
  @JsonKey(name: 'comments')
  final String? comments;
  @JsonKey(name: 'dateCreated')
  final DateTime? dateCreated;
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(
    name: 'invoiceStatus',
    toJson: bookingInvoiceStatusNullableToJson,
    fromJson: bookingInvoiceStatusNullableFromJson,
  )
  final enums.BookingInvoiceStatus? invoiceStatus;
  @JsonKey(name: 'lastUpdated')
  final DateTime? lastUpdated;
  @JsonKey(
    name: 'nextPossibleStatuses',
    toJson: bookingNextPossibleStatusesListToJson,
    fromJson: bookingNextPossibleStatusesListFromJson,
  )
  final List<enums.BookingNextPossibleStatuses>? nextPossibleStatuses;
  @JsonKey(name: 'originalEndDate')
  final DateTime? originalEndDate;
  @JsonKey(name: 'period')
  final Period? period;
  @JsonKey(
    name: 'status',
    toJson: bookingStatusNullableToJson,
    fromJson: bookingStatusNullableFromJson,
  )
  final enums.BookingStatus? status;
  @JsonKey(name: 'userId')
  final String? userId;
  @JsonKey(name: 'vehicle')
  final Vehicle? vehicle;
  @JsonKey(name: 'vehicleUsage')
  final VehicleUsage? vehicleUsage;
  static const fromJsonFactory = _$BookingFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Booking &&
            (identical(other.adminComments, adminComments) ||
                const DeepCollectionEquality()
                    .equals(other.adminComments, adminComments)) &&
            (identical(other.billingPrice, billingPrice) ||
                const DeepCollectionEquality()
                    .equals(other.billingPrice, billingPrice)) &&
            (identical(other.cancelDate, cancelDate) ||
                const DeepCollectionEquality()
                    .equals(other.cancelDate, cancelDate)) &&
            (identical(other.cancelReason, cancelReason) ||
                const DeepCollectionEquality()
                    .equals(other.cancelReason, cancelReason)) &&
            (identical(other.clientId, clientId) ||
                const DeepCollectionEquality()
                    .equals(other.clientId, clientId)) &&
            (identical(other.comments, comments) ||
                const DeepCollectionEquality()
                    .equals(other.comments, comments)) &&
            (identical(other.dateCreated, dateCreated) ||
                const DeepCollectionEquality()
                    .equals(other.dateCreated, dateCreated)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.invoiceStatus, invoiceStatus) ||
                const DeepCollectionEquality()
                    .equals(other.invoiceStatus, invoiceStatus)) &&
            (identical(other.lastUpdated, lastUpdated) ||
                const DeepCollectionEquality()
                    .equals(other.lastUpdated, lastUpdated)) &&
            (identical(other.nextPossibleStatuses, nextPossibleStatuses) ||
                const DeepCollectionEquality().equals(
                    other.nextPossibleStatuses, nextPossibleStatuses)) &&
            (identical(other.originalEndDate, originalEndDate) ||
                const DeepCollectionEquality()
                    .equals(other.originalEndDate, originalEndDate)) &&
            (identical(other.period, period) ||
                const DeepCollectionEquality().equals(other.period, period)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.vehicle, vehicle) ||
                const DeepCollectionEquality()
                    .equals(other.vehicle, vehicle)) &&
            (identical(other.vehicleUsage, vehicleUsage) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleUsage, vehicleUsage)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(adminComments) ^
      const DeepCollectionEquality().hash(billingPrice) ^
      const DeepCollectionEquality().hash(cancelDate) ^
      const DeepCollectionEquality().hash(cancelReason) ^
      const DeepCollectionEquality().hash(clientId) ^
      const DeepCollectionEquality().hash(comments) ^
      const DeepCollectionEquality().hash(dateCreated) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(invoiceStatus) ^
      const DeepCollectionEquality().hash(lastUpdated) ^
      const DeepCollectionEquality().hash(nextPossibleStatuses) ^
      const DeepCollectionEquality().hash(originalEndDate) ^
      const DeepCollectionEquality().hash(period) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(vehicle) ^
      const DeepCollectionEquality().hash(vehicleUsage) ^
      runtimeType.hashCode;
}

extension $BookingExtension on Booking {
  Booking copyWith(
      {String? adminComments,
      BillingPrice? billingPrice,
      DateTime? cancelDate,
      String? cancelReason,
      String? clientId,
      String? comments,
      DateTime? dateCreated,
      String? id,
      enums.BookingInvoiceStatus? invoiceStatus,
      DateTime? lastUpdated,
      List<enums.BookingNextPossibleStatuses>? nextPossibleStatuses,
      DateTime? originalEndDate,
      Period? period,
      enums.BookingStatus? status,
      String? userId,
      Vehicle? vehicle,
      VehicleUsage? vehicleUsage}) {
    return Booking(
        adminComments: adminComments ?? this.adminComments,
        billingPrice: billingPrice ?? this.billingPrice,
        cancelDate: cancelDate ?? this.cancelDate,
        cancelReason: cancelReason ?? this.cancelReason,
        clientId: clientId ?? this.clientId,
        comments: comments ?? this.comments,
        dateCreated: dateCreated ?? this.dateCreated,
        id: id ?? this.id,
        invoiceStatus: invoiceStatus ?? this.invoiceStatus,
        lastUpdated: lastUpdated ?? this.lastUpdated,
        nextPossibleStatuses: nextPossibleStatuses ?? this.nextPossibleStatuses,
        originalEndDate: originalEndDate ?? this.originalEndDate,
        period: period ?? this.period,
        status: status ?? this.status,
        userId: userId ?? this.userId,
        vehicle: vehicle ?? this.vehicle,
        vehicleUsage: vehicleUsage ?? this.vehicleUsage);
  }

  Booking copyWithWrapped(
      {Wrapped<String?>? adminComments,
      Wrapped<BillingPrice?>? billingPrice,
      Wrapped<DateTime?>? cancelDate,
      Wrapped<String?>? cancelReason,
      Wrapped<String?>? clientId,
      Wrapped<String?>? comments,
      Wrapped<DateTime?>? dateCreated,
      Wrapped<String?>? id,
      Wrapped<enums.BookingInvoiceStatus?>? invoiceStatus,
      Wrapped<DateTime?>? lastUpdated,
      Wrapped<List<enums.BookingNextPossibleStatuses>?>? nextPossibleStatuses,
      Wrapped<DateTime?>? originalEndDate,
      Wrapped<Period?>? period,
      Wrapped<enums.BookingStatus?>? status,
      Wrapped<String?>? userId,
      Wrapped<Vehicle?>? vehicle,
      Wrapped<VehicleUsage?>? vehicleUsage}) {
    return Booking(
        adminComments:
            (adminComments != null ? adminComments.value : this.adminComments),
        billingPrice:
            (billingPrice != null ? billingPrice.value : this.billingPrice),
        cancelDate: (cancelDate != null ? cancelDate.value : this.cancelDate),
        cancelReason:
            (cancelReason != null ? cancelReason.value : this.cancelReason),
        clientId: (clientId != null ? clientId.value : this.clientId),
        comments: (comments != null ? comments.value : this.comments),
        dateCreated:
            (dateCreated != null ? dateCreated.value : this.dateCreated),
        id: (id != null ? id.value : this.id),
        invoiceStatus:
            (invoiceStatus != null ? invoiceStatus.value : this.invoiceStatus),
        lastUpdated:
            (lastUpdated != null ? lastUpdated.value : this.lastUpdated),
        nextPossibleStatuses: (nextPossibleStatuses != null
            ? nextPossibleStatuses.value
            : this.nextPossibleStatuses),
        originalEndDate: (originalEndDate != null
            ? originalEndDate.value
            : this.originalEndDate),
        period: (period != null ? period.value : this.period),
        status: (status != null ? status.value : this.status),
        userId: (userId != null ? userId.value : this.userId),
        vehicle: (vehicle != null ? vehicle.value : this.vehicle),
        vehicleUsage:
            (vehicleUsage != null ? vehicleUsage.value : this.vehicleUsage));
  }
}

@JsonSerializable(explicitToJson: true)
class BookingPrice {
  const BookingPrice({
    this.dayPrice,
    this.hourPrice,
    this.kmPrice,
  });

  factory BookingPrice.fromJson(Map<String, dynamic> json) =>
      _$BookingPriceFromJson(json);

  static const toJsonFactory = _$BookingPriceToJson;
  Map<String, dynamic> toJson() => _$BookingPriceToJson(this);

  @JsonKey(name: 'dayPrice')
  final double? dayPrice;
  @JsonKey(name: 'hourPrice')
  final double? hourPrice;
  @JsonKey(name: 'kmPrice')
  final double? kmPrice;
  static const fromJsonFactory = _$BookingPriceFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BookingPrice &&
            (identical(other.dayPrice, dayPrice) ||
                const DeepCollectionEquality()
                    .equals(other.dayPrice, dayPrice)) &&
            (identical(other.hourPrice, hourPrice) ||
                const DeepCollectionEquality()
                    .equals(other.hourPrice, hourPrice)) &&
            (identical(other.kmPrice, kmPrice) ||
                const DeepCollectionEquality().equals(other.kmPrice, kmPrice)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(dayPrice) ^
      const DeepCollectionEquality().hash(hourPrice) ^
      const DeepCollectionEquality().hash(kmPrice) ^
      runtimeType.hashCode;
}

extension $BookingPriceExtension on BookingPrice {
  BookingPrice copyWith(
      {double? dayPrice, double? hourPrice, double? kmPrice}) {
    return BookingPrice(
        dayPrice: dayPrice ?? this.dayPrice,
        hourPrice: hourPrice ?? this.hourPrice,
        kmPrice: kmPrice ?? this.kmPrice);
  }

  BookingPrice copyWithWrapped(
      {Wrapped<double?>? dayPrice,
      Wrapped<double?>? hourPrice,
      Wrapped<double?>? kmPrice}) {
    return BookingPrice(
        dayPrice: (dayPrice != null ? dayPrice.value : this.dayPrice),
        hourPrice: (hourPrice != null ? hourPrice.value : this.hourPrice),
        kmPrice: (kmPrice != null ? kmPrice.value : this.kmPrice));
  }
}

@JsonSerializable(explicitToJson: true)
class BookingsPage {
  const BookingsPage({
    this.bookings,
  });

  factory BookingsPage.fromJson(Map<String, dynamic> json) =>
      _$BookingsPageFromJson(json);

  static const toJsonFactory = _$BookingsPageToJson;
  Map<String, dynamic> toJson() => _$BookingsPageToJson(this);

  @JsonKey(name: 'bookings', defaultValue: <Booking>[])
  final List<Booking>? bookings;
  static const fromJsonFactory = _$BookingsPageFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BookingsPage &&
            (identical(other.bookings, bookings) ||
                const DeepCollectionEquality()
                    .equals(other.bookings, bookings)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(bookings) ^ runtimeType.hashCode;
}

extension $BookingsPageExtension on BookingsPage {
  BookingsPage copyWith({List<Booking>? bookings}) {
    return BookingsPage(bookings: bookings ?? this.bookings);
  }

  BookingsPage copyWithWrapped({Wrapped<List<Booking>?>? bookings}) {
    return BookingsPage(
        bookings: (bookings != null ? bookings.value : this.bookings));
  }
}

@JsonSerializable(explicitToJson: true)
class CancelBookingRequest {
  const CancelBookingRequest({
    this.bookingId,
    this.reason,
  });

  factory CancelBookingRequest.fromJson(Map<String, dynamic> json) =>
      _$CancelBookingRequestFromJson(json);

  static const toJsonFactory = _$CancelBookingRequestToJson;
  Map<String, dynamic> toJson() => _$CancelBookingRequestToJson(this);

  @JsonKey(name: 'bookingId')
  final String? bookingId;
  @JsonKey(name: 'reason')
  final String? reason;
  static const fromJsonFactory = _$CancelBookingRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CancelBookingRequest &&
            (identical(other.bookingId, bookingId) ||
                const DeepCollectionEquality()
                    .equals(other.bookingId, bookingId)) &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(bookingId) ^
      const DeepCollectionEquality().hash(reason) ^
      runtimeType.hashCode;
}

extension $CancelBookingRequestExtension on CancelBookingRequest {
  CancelBookingRequest copyWith({String? bookingId, String? reason}) {
    return CancelBookingRequest(
        bookingId: bookingId ?? this.bookingId, reason: reason ?? this.reason);
  }

  CancelBookingRequest copyWithWrapped(
      {Wrapped<String?>? bookingId, Wrapped<String?>? reason}) {
    return CancelBookingRequest(
        bookingId: (bookingId != null ? bookingId.value : this.bookingId),
        reason: (reason != null ? reason.value : this.reason));
  }
}

@JsonSerializable(explicitToJson: true)
class Client {
  const Client({
    this.billingEmail,
    this.city,
    this.country,
    this.id,
    this.name,
    this.nr,
    this.postalCode,
    this.street,
    this.users,
    this.vat,
  });

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  static const toJsonFactory = _$ClientToJson;
  Map<String, dynamic> toJson() => _$ClientToJson(this);

  @JsonKey(name: 'billingEmail')
  final String? billingEmail;
  @JsonKey(name: 'city')
  final String? city;
  @JsonKey(name: 'country')
  final String? country;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'nr')
  final String? nr;
  @JsonKey(name: 'postalCode')
  final String? postalCode;
  @JsonKey(name: 'street')
  final String? street;
  @JsonKey(name: 'users', defaultValue: <User>[])
  final List<User>? users;
  @JsonKey(name: 'vat')
  final String? vat;
  static const fromJsonFactory = _$ClientFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Client &&
            (identical(other.billingEmail, billingEmail) ||
                const DeepCollectionEquality()
                    .equals(other.billingEmail, billingEmail)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.nr, nr) ||
                const DeepCollectionEquality().equals(other.nr, nr)) &&
            (identical(other.postalCode, postalCode) ||
                const DeepCollectionEquality()
                    .equals(other.postalCode, postalCode)) &&
            (identical(other.street, street) ||
                const DeepCollectionEquality().equals(other.street, street)) &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)) &&
            (identical(other.vat, vat) ||
                const DeepCollectionEquality().equals(other.vat, vat)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(billingEmail) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(nr) ^
      const DeepCollectionEquality().hash(postalCode) ^
      const DeepCollectionEquality().hash(street) ^
      const DeepCollectionEquality().hash(users) ^
      const DeepCollectionEquality().hash(vat) ^
      runtimeType.hashCode;
}

extension $ClientExtension on Client {
  Client copyWith(
      {String? billingEmail,
      String? city,
      String? country,
      int? id,
      String? name,
      String? nr,
      String? postalCode,
      String? street,
      List<User>? users,
      String? vat}) {
    return Client(
        billingEmail: billingEmail ?? this.billingEmail,
        city: city ?? this.city,
        country: country ?? this.country,
        id: id ?? this.id,
        name: name ?? this.name,
        nr: nr ?? this.nr,
        postalCode: postalCode ?? this.postalCode,
        street: street ?? this.street,
        users: users ?? this.users,
        vat: vat ?? this.vat);
  }

  Client copyWithWrapped(
      {Wrapped<String?>? billingEmail,
      Wrapped<String?>? city,
      Wrapped<String?>? country,
      Wrapped<int?>? id,
      Wrapped<String?>? name,
      Wrapped<String?>? nr,
      Wrapped<String?>? postalCode,
      Wrapped<String?>? street,
      Wrapped<List<User>?>? users,
      Wrapped<String?>? vat}) {
    return Client(
        billingEmail:
            (billingEmail != null ? billingEmail.value : this.billingEmail),
        city: (city != null ? city.value : this.city),
        country: (country != null ? country.value : this.country),
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        nr: (nr != null ? nr.value : this.nr),
        postalCode: (postalCode != null ? postalCode.value : this.postalCode),
        street: (street != null ? street.value : this.street),
        users: (users != null ? users.value : this.users),
        vat: (vat != null ? vat.value : this.vat));
  }
}

@JsonSerializable(explicitToJson: true)
class ConflictResolution {
  const ConflictResolution({
    this.cancelReason,
    this.conflictsHash,
    this.mode,
  });

  factory ConflictResolution.fromJson(Map<String, dynamic> json) =>
      _$ConflictResolutionFromJson(json);

  static const toJsonFactory = _$ConflictResolutionToJson;
  Map<String, dynamic> toJson() => _$ConflictResolutionToJson(this);

  @JsonKey(name: 'cancelReason')
  final String? cancelReason;
  @JsonKey(name: 'conflictsHash')
  final String? conflictsHash;
  @JsonKey(
    name: 'mode',
    toJson: conflictResolutionModeNullableToJson,
    fromJson: conflictResolutionModeNullableFromJson,
  )
  final enums.ConflictResolutionMode? mode;
  static const fromJsonFactory = _$ConflictResolutionFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ConflictResolution &&
            (identical(other.cancelReason, cancelReason) ||
                const DeepCollectionEquality()
                    .equals(other.cancelReason, cancelReason)) &&
            (identical(other.conflictsHash, conflictsHash) ||
                const DeepCollectionEquality()
                    .equals(other.conflictsHash, conflictsHash)) &&
            (identical(other.mode, mode) ||
                const DeepCollectionEquality().equals(other.mode, mode)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(cancelReason) ^
      const DeepCollectionEquality().hash(conflictsHash) ^
      const DeepCollectionEquality().hash(mode) ^
      runtimeType.hashCode;
}

extension $ConflictResolutionExtension on ConflictResolution {
  ConflictResolution copyWith(
      {String? cancelReason,
      String? conflictsHash,
      enums.ConflictResolutionMode? mode}) {
    return ConflictResolution(
        cancelReason: cancelReason ?? this.cancelReason,
        conflictsHash: conflictsHash ?? this.conflictsHash,
        mode: mode ?? this.mode);
  }

  ConflictResolution copyWithWrapped(
      {Wrapped<String?>? cancelReason,
      Wrapped<String?>? conflictsHash,
      Wrapped<enums.ConflictResolutionMode?>? mode}) {
    return ConflictResolution(
        cancelReason:
            (cancelReason != null ? cancelReason.value : this.cancelReason),
        conflictsHash:
            (conflictsHash != null ? conflictsHash.value : this.conflictsHash),
        mode: (mode != null ? mode.value : this.mode));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateBodyStyleRequest {
  const CreateBodyStyleRequest({
    this.description,
    this.id,
  });

  factory CreateBodyStyleRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateBodyStyleRequestFromJson(json);

  static const toJsonFactory = _$CreateBodyStyleRequestToJson;
  Map<String, dynamic> toJson() => _$CreateBodyStyleRequestToJson(this);

  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'id')
  final String? id;
  static const fromJsonFactory = _$CreateBodyStyleRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CreateBodyStyleRequest &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $CreateBodyStyleRequestExtension on CreateBodyStyleRequest {
  CreateBodyStyleRequest copyWith({String? description, String? id}) {
    return CreateBodyStyleRequest(
        description: description ?? this.description, id: id ?? this.id);
  }

  CreateBodyStyleRequest copyWithWrapped(
      {Wrapped<String?>? description, Wrapped<String?>? id}) {
    return CreateBodyStyleRequest(
        description:
            (description != null ? description.value : this.description),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateBookingRequest {
  const CreateBookingRequest({
    this.comments,
    this.period,
    this.userId,
    required this.vehicleId,
  });

  factory CreateBookingRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateBookingRequestFromJson(json);

  static const toJsonFactory = _$CreateBookingRequestToJson;
  Map<String, dynamic> toJson() => _$CreateBookingRequestToJson(this);

  @JsonKey(name: 'comments')
  final String? comments;
  @JsonKey(name: 'period')
  final Period? period;
  @JsonKey(name: 'userId')
  final String? userId;
  @JsonKey(name: 'vehicleId')
  final String vehicleId;
  static const fromJsonFactory = _$CreateBookingRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CreateBookingRequest &&
            (identical(other.comments, comments) ||
                const DeepCollectionEquality()
                    .equals(other.comments, comments)) &&
            (identical(other.period, period) ||
                const DeepCollectionEquality().equals(other.period, period)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.vehicleId, vehicleId) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleId, vehicleId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(comments) ^
      const DeepCollectionEquality().hash(period) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(vehicleId) ^
      runtimeType.hashCode;
}

extension $CreateBookingRequestExtension on CreateBookingRequest {
  CreateBookingRequest copyWith(
      {String? comments, Period? period, String? userId, String? vehicleId}) {
    return CreateBookingRequest(
        comments: comments ?? this.comments,
        period: period ?? this.period,
        userId: userId ?? this.userId,
        vehicleId: vehicleId ?? this.vehicleId);
  }

  CreateBookingRequest copyWithWrapped(
      {Wrapped<String?>? comments,
      Wrapped<Period?>? period,
      Wrapped<String?>? userId,
      Wrapped<String>? vehicleId}) {
    return CreateBookingRequest(
        comments: (comments != null ? comments.value : this.comments),
        period: (period != null ? period.value : this.period),
        userId: (userId != null ? userId.value : this.userId),
        vehicleId: (vehicleId != null ? vehicleId.value : this.vehicleId));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateNonAvailabilityRequest {
  const CreateNonAvailabilityRequest({
    this.conflictResolution,
    required this.period,
    this.recurringSchedule,
    required this.vehicleId,
  });

  factory CreateNonAvailabilityRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateNonAvailabilityRequestFromJson(json);

  static const toJsonFactory = _$CreateNonAvailabilityRequestToJson;
  Map<String, dynamic> toJson() => _$CreateNonAvailabilityRequestToJson(this);

  @JsonKey(name: 'conflictResolution')
  final ConflictResolution? conflictResolution;
  @JsonKey(name: 'period')
  final Period period;
  @JsonKey(name: 'recurringSchedule')
  final RecurringSchedule? recurringSchedule;
  @JsonKey(name: 'vehicleId')
  final String vehicleId;
  static const fromJsonFactory = _$CreateNonAvailabilityRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CreateNonAvailabilityRequest &&
            (identical(other.conflictResolution, conflictResolution) ||
                const DeepCollectionEquality()
                    .equals(other.conflictResolution, conflictResolution)) &&
            (identical(other.period, period) ||
                const DeepCollectionEquality().equals(other.period, period)) &&
            (identical(other.recurringSchedule, recurringSchedule) ||
                const DeepCollectionEquality()
                    .equals(other.recurringSchedule, recurringSchedule)) &&
            (identical(other.vehicleId, vehicleId) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleId, vehicleId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(conflictResolution) ^
      const DeepCollectionEquality().hash(period) ^
      const DeepCollectionEquality().hash(recurringSchedule) ^
      const DeepCollectionEquality().hash(vehicleId) ^
      runtimeType.hashCode;
}

extension $CreateNonAvailabilityRequestExtension
    on CreateNonAvailabilityRequest {
  CreateNonAvailabilityRequest copyWith(
      {ConflictResolution? conflictResolution,
      Period? period,
      RecurringSchedule? recurringSchedule,
      String? vehicleId}) {
    return CreateNonAvailabilityRequest(
        conflictResolution: conflictResolution ?? this.conflictResolution,
        period: period ?? this.period,
        recurringSchedule: recurringSchedule ?? this.recurringSchedule,
        vehicleId: vehicleId ?? this.vehicleId);
  }

  CreateNonAvailabilityRequest copyWithWrapped(
      {Wrapped<ConflictResolution?>? conflictResolution,
      Wrapped<Period>? period,
      Wrapped<RecurringSchedule?>? recurringSchedule,
      Wrapped<String>? vehicleId}) {
    return CreateNonAvailabilityRequest(
        conflictResolution: (conflictResolution != null
            ? conflictResolution.value
            : this.conflictResolution),
        period: (period != null ? period.value : this.period),
        recurringSchedule: (recurringSchedule != null
            ? recurringSchedule.value
            : this.recurringSchedule),
        vehicleId: (vehicleId != null ? vehicleId.value : this.vehicleId));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateUserRequest {
  const CreateUserRequest({
    required this.email,
    required this.remoteId,
  });

  factory CreateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateUserRequestFromJson(json);

  static const toJsonFactory = _$CreateUserRequestToJson;
  Map<String, dynamic> toJson() => _$CreateUserRequestToJson(this);

  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'remoteId')
  final String remoteId;
  static const fromJsonFactory = _$CreateUserRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CreateUserRequest &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.remoteId, remoteId) ||
                const DeepCollectionEquality()
                    .equals(other.remoteId, remoteId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(remoteId) ^
      runtimeType.hashCode;
}

extension $CreateUserRequestExtension on CreateUserRequest {
  CreateUserRequest copyWith({String? email, String? remoteId}) {
    return CreateUserRequest(
        email: email ?? this.email, remoteId: remoteId ?? this.remoteId);
  }

  CreateUserRequest copyWithWrapped(
      {Wrapped<String>? email, Wrapped<String>? remoteId}) {
    return CreateUserRequest(
        email: (email != null ? email.value : this.email),
        remoteId: (remoteId != null ? remoteId.value : this.remoteId));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateVehicleGroupRequest {
  const CreateVehicleGroupRequest({
    this.id,
    this.name,
  });

  factory CreateVehicleGroupRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateVehicleGroupRequestFromJson(json);

  static const toJsonFactory = _$CreateVehicleGroupRequestToJson;
  Map<String, dynamic> toJson() => _$CreateVehicleGroupRequestToJson(this);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$CreateVehicleGroupRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CreateVehicleGroupRequest &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $CreateVehicleGroupRequestExtension on CreateVehicleGroupRequest {
  CreateVehicleGroupRequest copyWith({String? id, String? name}) {
    return CreateVehicleGroupRequest(
        id: id ?? this.id, name: name ?? this.name);
  }

  CreateVehicleGroupRequest copyWithWrapped(
      {Wrapped<String?>? id, Wrapped<String?>? name}) {
    return CreateVehicleGroupRequest(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateVehicleModelRequest {
  const CreateVehicleModelRequest({
    this.bodyStyleId,
    this.brandId,
    this.name,
  });

  factory CreateVehicleModelRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateVehicleModelRequestFromJson(json);

  static const toJsonFactory = _$CreateVehicleModelRequestToJson;
  Map<String, dynamic> toJson() => _$CreateVehicleModelRequestToJson(this);

  @JsonKey(name: 'bodyStyleId')
  final String? bodyStyleId;
  @JsonKey(name: 'brandId')
  final String? brandId;
  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$CreateVehicleModelRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CreateVehicleModelRequest &&
            (identical(other.bodyStyleId, bodyStyleId) ||
                const DeepCollectionEquality()
                    .equals(other.bodyStyleId, bodyStyleId)) &&
            (identical(other.brandId, brandId) ||
                const DeepCollectionEquality()
                    .equals(other.brandId, brandId)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(bodyStyleId) ^
      const DeepCollectionEquality().hash(brandId) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $CreateVehicleModelRequestExtension on CreateVehicleModelRequest {
  CreateVehicleModelRequest copyWith(
      {String? bodyStyleId, String? brandId, String? name}) {
    return CreateVehicleModelRequest(
        bodyStyleId: bodyStyleId ?? this.bodyStyleId,
        brandId: brandId ?? this.brandId,
        name: name ?? this.name);
  }

  CreateVehicleModelRequest copyWithWrapped(
      {Wrapped<String?>? bodyStyleId,
      Wrapped<String?>? brandId,
      Wrapped<String?>? name}) {
    return CreateVehicleModelRequest(
        bodyStyleId:
            (bodyStyleId != null ? bodyStyleId.value : this.bodyStyleId),
        brandId: (brandId != null ? brandId.value : this.brandId),
        name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateVehicleRequest {
  const CreateVehicleRequest({
    this.id,
    this.licensePlate,
    required this.vehicleModelId,
  });

  factory CreateVehicleRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateVehicleRequestFromJson(json);

  static const toJsonFactory = _$CreateVehicleRequestToJson;
  Map<String, dynamic> toJson() => _$CreateVehicleRequestToJson(this);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'licensePlate')
  final String? licensePlate;
  @JsonKey(name: 'vehicleModelId')
  final String vehicleModelId;
  static const fromJsonFactory = _$CreateVehicleRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CreateVehicleRequest &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.licensePlate, licensePlate) ||
                const DeepCollectionEquality()
                    .equals(other.licensePlate, licensePlate)) &&
            (identical(other.vehicleModelId, vehicleModelId) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleModelId, vehicleModelId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(licensePlate) ^
      const DeepCollectionEquality().hash(vehicleModelId) ^
      runtimeType.hashCode;
}

extension $CreateVehicleRequestExtension on CreateVehicleRequest {
  CreateVehicleRequest copyWith(
      {String? id, String? licensePlate, String? vehicleModelId}) {
    return CreateVehicleRequest(
        id: id ?? this.id,
        licensePlate: licensePlate ?? this.licensePlate,
        vehicleModelId: vehicleModelId ?? this.vehicleModelId);
  }

  CreateVehicleRequest copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? licensePlate,
      Wrapped<String>? vehicleModelId}) {
    return CreateVehicleRequest(
        id: (id != null ? id.value : this.id),
        licensePlate:
            (licensePlate != null ? licensePlate.value : this.licensePlate),
        vehicleModelId: (vehicleModelId != null
            ? vehicleModelId.value
            : this.vehicleModelId));
  }
}

@JsonSerializable(explicitToJson: true)
class DeleteVehiclesFromGroupRequest {
  const DeleteVehiclesFromGroupRequest({
    this.vehicleIds,
  });

  factory DeleteVehiclesFromGroupRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteVehiclesFromGroupRequestFromJson(json);

  static const toJsonFactory = _$DeleteVehiclesFromGroupRequestToJson;
  Map<String, dynamic> toJson() => _$DeleteVehiclesFromGroupRequestToJson(this);

  @JsonKey(name: 'vehicleIds', defaultValue: <String>[])
  final List<String>? vehicleIds;
  static const fromJsonFactory = _$DeleteVehiclesFromGroupRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DeleteVehiclesFromGroupRequest &&
            (identical(other.vehicleIds, vehicleIds) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleIds, vehicleIds)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(vehicleIds) ^ runtimeType.hashCode;
}

extension $DeleteVehiclesFromGroupRequestExtension
    on DeleteVehiclesFromGroupRequest {
  DeleteVehiclesFromGroupRequest copyWith({List<String>? vehicleIds}) {
    return DeleteVehiclesFromGroupRequest(
        vehicleIds: vehicleIds ?? this.vehicleIds);
  }

  DeleteVehiclesFromGroupRequest copyWithWrapped(
      {Wrapped<List<String>?>? vehicleIds}) {
    return DeleteVehiclesFromGroupRequest(
        vehicleIds: (vehicleIds != null ? vehicleIds.value : this.vehicleIds));
  }
}

@JsonSerializable(explicitToJson: true)
class EndVehicleUsageRequest {
  const EndVehicleUsageRequest({
    this.mileageValue,
    this.vehicleId,
    this.vehicleUsageId,
  });

  factory EndVehicleUsageRequest.fromJson(Map<String, dynamic> json) =>
      _$EndVehicleUsageRequestFromJson(json);

  static const toJsonFactory = _$EndVehicleUsageRequestToJson;
  Map<String, dynamic> toJson() => _$EndVehicleUsageRequestToJson(this);

  @JsonKey(name: 'mileageValue')
  final double? mileageValue;
  @JsonKey(name: 'vehicleId')
  final String? vehicleId;
  @JsonKey(name: 'vehicleUsageId')
  final String? vehicleUsageId;
  static const fromJsonFactory = _$EndVehicleUsageRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is EndVehicleUsageRequest &&
            (identical(other.mileageValue, mileageValue) ||
                const DeepCollectionEquality()
                    .equals(other.mileageValue, mileageValue)) &&
            (identical(other.vehicleId, vehicleId) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleId, vehicleId)) &&
            (identical(other.vehicleUsageId, vehicleUsageId) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleUsageId, vehicleUsageId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(mileageValue) ^
      const DeepCollectionEquality().hash(vehicleId) ^
      const DeepCollectionEquality().hash(vehicleUsageId) ^
      runtimeType.hashCode;
}

extension $EndVehicleUsageRequestExtension on EndVehicleUsageRequest {
  EndVehicleUsageRequest copyWith(
      {double? mileageValue, String? vehicleId, String? vehicleUsageId}) {
    return EndVehicleUsageRequest(
        mileageValue: mileageValue ?? this.mileageValue,
        vehicleId: vehicleId ?? this.vehicleId,
        vehicleUsageId: vehicleUsageId ?? this.vehicleUsageId);
  }

  EndVehicleUsageRequest copyWithWrapped(
      {Wrapped<double?>? mileageValue,
      Wrapped<String?>? vehicleId,
      Wrapped<String?>? vehicleUsageId}) {
    return EndVehicleUsageRequest(
        mileageValue:
            (mileageValue != null ? mileageValue.value : this.mileageValue),
        vehicleId: (vehicleId != null ? vehicleId.value : this.vehicleId),
        vehicleUsageId: (vehicleUsageId != null
            ? vehicleUsageId.value
            : this.vehicleUsageId));
  }
}

@JsonSerializable(explicitToJson: true)
class FiltersForBooking {
  const FiltersForBooking({
    this.gpsLocation,
    this.vehicleFilterCriteria,
  });

  factory FiltersForBooking.fromJson(Map<String, dynamic> json) =>
      _$FiltersForBookingFromJson(json);

  static const toJsonFactory = _$FiltersForBookingToJson;
  Map<String, dynamic> toJson() => _$FiltersForBookingToJson(this);

  @JsonKey(name: 'gpsLocation')
  final GpsLocation? gpsLocation;
  @JsonKey(name: 'vehicleFilterCriteria')
  final VehicleFilterCriteria? vehicleFilterCriteria;
  static const fromJsonFactory = _$FiltersForBookingFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is FiltersForBooking &&
            (identical(other.gpsLocation, gpsLocation) ||
                const DeepCollectionEquality()
                    .equals(other.gpsLocation, gpsLocation)) &&
            (identical(other.vehicleFilterCriteria, vehicleFilterCriteria) ||
                const DeepCollectionEquality().equals(
                    other.vehicleFilterCriteria, vehicleFilterCriteria)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(gpsLocation) ^
      const DeepCollectionEquality().hash(vehicleFilterCriteria) ^
      runtimeType.hashCode;
}

extension $FiltersForBookingExtension on FiltersForBooking {
  FiltersForBooking copyWith(
      {GpsLocation? gpsLocation,
      VehicleFilterCriteria? vehicleFilterCriteria}) {
    return FiltersForBooking(
        gpsLocation: gpsLocation ?? this.gpsLocation,
        vehicleFilterCriteria:
            vehicleFilterCriteria ?? this.vehicleFilterCriteria);
  }

  FiltersForBooking copyWithWrapped(
      {Wrapped<GpsLocation?>? gpsLocation,
      Wrapped<VehicleFilterCriteria?>? vehicleFilterCriteria}) {
    return FiltersForBooking(
        gpsLocation:
            (gpsLocation != null ? gpsLocation.value : this.gpsLocation),
        vehicleFilterCriteria: (vehicleFilterCriteria != null
            ? vehicleFilterCriteria.value
            : this.vehicleFilterCriteria));
  }
}

@JsonSerializable(explicitToJson: true)
class GpsCoordinate {
  const GpsCoordinate({
    this.latitude,
    this.longitude,
  });

  factory GpsCoordinate.fromJson(Map<String, dynamic> json) =>
      _$GpsCoordinateFromJson(json);

  static const toJsonFactory = _$GpsCoordinateToJson;
  Map<String, dynamic> toJson() => _$GpsCoordinateToJson(this);

  @JsonKey(name: 'latitude')
  final double? latitude;
  @JsonKey(name: 'longitude')
  final double? longitude;
  static const fromJsonFactory = _$GpsCoordinateFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GpsCoordinate &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      runtimeType.hashCode;
}

extension $GpsCoordinateExtension on GpsCoordinate {
  GpsCoordinate copyWith({double? latitude, double? longitude}) {
    return GpsCoordinate(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude);
  }

  GpsCoordinate copyWithWrapped(
      {Wrapped<double?>? latitude, Wrapped<double?>? longitude}) {
    return GpsCoordinate(
        latitude: (latitude != null ? latitude.value : this.latitude),
        longitude: (longitude != null ? longitude.value : this.longitude));
  }
}

@JsonSerializable(explicitToJson: true)
class GpsLocation {
  const GpsLocation({
    this.address,
    this.coordinates,
    this.vehicleBaseLocationId,
  });

  factory GpsLocation.fromJson(Map<String, dynamic> json) =>
      _$GpsLocationFromJson(json);

  static const toJsonFactory = _$GpsLocationToJson;
  Map<String, dynamic> toJson() => _$GpsLocationToJson(this);

  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'coordinates')
  final GpsCoordinate? coordinates;
  @JsonKey(name: 'vehicleBaseLocationId')
  final String? vehicleBaseLocationId;
  static const fromJsonFactory = _$GpsLocationFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GpsLocation &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.coordinates, coordinates) ||
                const DeepCollectionEquality()
                    .equals(other.coordinates, coordinates)) &&
            (identical(other.vehicleBaseLocationId, vehicleBaseLocationId) ||
                const DeepCollectionEquality().equals(
                    other.vehicleBaseLocationId, vehicleBaseLocationId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(coordinates) ^
      const DeepCollectionEquality().hash(vehicleBaseLocationId) ^
      runtimeType.hashCode;
}

extension $GpsLocationExtension on GpsLocation {
  GpsLocation copyWith(
      {String? address,
      GpsCoordinate? coordinates,
      String? vehicleBaseLocationId}) {
    return GpsLocation(
        address: address ?? this.address,
        coordinates: coordinates ?? this.coordinates,
        vehicleBaseLocationId:
            vehicleBaseLocationId ?? this.vehicleBaseLocationId);
  }

  GpsLocation copyWithWrapped(
      {Wrapped<String?>? address,
      Wrapped<GpsCoordinate?>? coordinates,
      Wrapped<String?>? vehicleBaseLocationId}) {
    return GpsLocation(
        address: (address != null ? address.value : this.address),
        coordinates:
            (coordinates != null ? coordinates.value : this.coordinates),
        vehicleBaseLocationId: (vehicleBaseLocationId != null
            ? vehicleBaseLocationId.value
            : this.vehicleBaseLocationId));
  }
}

@JsonSerializable(explicitToJson: true)
class HomeFeedCard {
  const HomeFeedCard({
    this.date,
    this.fullBooking,
    this.type,
    this.vehicle,
    this.vehicleUsage,
  });

  factory HomeFeedCard.fromJson(Map<String, dynamic> json) =>
      _$HomeFeedCardFromJson(json);

  static const toJsonFactory = _$HomeFeedCardToJson;
  Map<String, dynamic> toJson() => _$HomeFeedCardToJson(this);

  @JsonKey(name: 'date')
  final DateTime? date;
  @JsonKey(name: 'fullBooking')
  final Booking? fullBooking;
  @JsonKey(
    name: 'type',
    toJson: homeFeedCardTypeNullableToJson,
    fromJson: homeFeedCardTypeNullableFromJson,
  )
  final enums.HomeFeedCardType? type;
  @JsonKey(name: 'vehicle')
  final Vehicle? vehicle;
  @JsonKey(name: 'vehicleUsage')
  final VehicleUsageReference? vehicleUsage;
  static const fromJsonFactory = _$HomeFeedCardFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is HomeFeedCard &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.fullBooking, fullBooking) ||
                const DeepCollectionEquality()
                    .equals(other.fullBooking, fullBooking)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.vehicle, vehicle) ||
                const DeepCollectionEquality()
                    .equals(other.vehicle, vehicle)) &&
            (identical(other.vehicleUsage, vehicleUsage) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleUsage, vehicleUsage)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(fullBooking) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(vehicle) ^
      const DeepCollectionEquality().hash(vehicleUsage) ^
      runtimeType.hashCode;
}

extension $HomeFeedCardExtension on HomeFeedCard {
  HomeFeedCard copyWith(
      {DateTime? date,
      Booking? fullBooking,
      enums.HomeFeedCardType? type,
      Vehicle? vehicle,
      VehicleUsageReference? vehicleUsage}) {
    return HomeFeedCard(
        date: date ?? this.date,
        fullBooking: fullBooking ?? this.fullBooking,
        type: type ?? this.type,
        vehicle: vehicle ?? this.vehicle,
        vehicleUsage: vehicleUsage ?? this.vehicleUsage);
  }

  HomeFeedCard copyWithWrapped(
      {Wrapped<DateTime?>? date,
      Wrapped<Booking?>? fullBooking,
      Wrapped<enums.HomeFeedCardType?>? type,
      Wrapped<Vehicle?>? vehicle,
      Wrapped<VehicleUsageReference?>? vehicleUsage}) {
    return HomeFeedCard(
        date: (date != null ? date.value : this.date),
        fullBooking:
            (fullBooking != null ? fullBooking.value : this.fullBooking),
        type: (type != null ? type.value : this.type),
        vehicle: (vehicle != null ? vehicle.value : this.vehicle),
        vehicleUsage:
            (vehicleUsage != null ? vehicleUsage.value : this.vehicleUsage));
  }
}

@JsonSerializable(explicitToJson: true)
class HomeFeedPage {
  const HomeFeedPage({
    this.homeFeedCards,
  });

  factory HomeFeedPage.fromJson(Map<String, dynamic> json) =>
      _$HomeFeedPageFromJson(json);

  static const toJsonFactory = _$HomeFeedPageToJson;
  Map<String, dynamic> toJson() => _$HomeFeedPageToJson(this);

  @JsonKey(name: 'homeFeedCards', defaultValue: <HomeFeedCard>[])
  final List<HomeFeedCard>? homeFeedCards;
  static const fromJsonFactory = _$HomeFeedPageFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is HomeFeedPage &&
            (identical(other.homeFeedCards, homeFeedCards) ||
                const DeepCollectionEquality()
                    .equals(other.homeFeedCards, homeFeedCards)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(homeFeedCards) ^ runtimeType.hashCode;
}

extension $HomeFeedPageExtension on HomeFeedPage {
  HomeFeedPage copyWith({List<HomeFeedCard>? homeFeedCards}) {
    return HomeFeedPage(homeFeedCards: homeFeedCards ?? this.homeFeedCards);
  }

  HomeFeedPage copyWithWrapped({Wrapped<List<HomeFeedCard>?>? homeFeedCards}) {
    return HomeFeedPage(
        homeFeedCards:
            (homeFeedCards != null ? homeFeedCards.value : this.homeFeedCards));
  }
}

@JsonSerializable(explicitToJson: true)
class MyAvailableVehicle {
  const MyAvailableVehicle({
    this.nextNonAvailability,
    this.overdue,
    this.previousNonAvailability,
    this.type,
    this.vehicle,
    this.vehicleUsage,
  });

  factory MyAvailableVehicle.fromJson(Map<String, dynamic> json) =>
      _$MyAvailableVehicleFromJson(json);

  static const toJsonFactory = _$MyAvailableVehicleToJson;
  Map<String, dynamic> toJson() => _$MyAvailableVehicleToJson(this);

  @JsonKey(name: 'nextNonAvailability')
  final AdjacentNonAvailability? nextNonAvailability;
  @JsonKey(name: 'overdue')
  final bool? overdue;
  @JsonKey(name: 'previousNonAvailability')
  final AdjacentNonAvailability? previousNonAvailability;
  @JsonKey(
    name: 'type',
    toJson: myAvailableVehicleTypeNullableToJson,
    fromJson: myAvailableVehicleTypeNullableFromJson,
  )
  final enums.MyAvailableVehicleType? type;
  @JsonKey(name: 'vehicle')
  final Vehicle? vehicle;
  @JsonKey(name: 'vehicleUsage')
  final VehicleUsage? vehicleUsage;
  static const fromJsonFactory = _$MyAvailableVehicleFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is MyAvailableVehicle &&
            (identical(other.nextNonAvailability, nextNonAvailability) ||
                const DeepCollectionEquality()
                    .equals(other.nextNonAvailability, nextNonAvailability)) &&
            (identical(other.overdue, overdue) ||
                const DeepCollectionEquality()
                    .equals(other.overdue, overdue)) &&
            (identical(
                    other.previousNonAvailability, previousNonAvailability) ||
                const DeepCollectionEquality().equals(
                    other.previousNonAvailability, previousNonAvailability)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.vehicle, vehicle) ||
                const DeepCollectionEquality()
                    .equals(other.vehicle, vehicle)) &&
            (identical(other.vehicleUsage, vehicleUsage) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleUsage, vehicleUsage)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(nextNonAvailability) ^
      const DeepCollectionEquality().hash(overdue) ^
      const DeepCollectionEquality().hash(previousNonAvailability) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(vehicle) ^
      const DeepCollectionEquality().hash(vehicleUsage) ^
      runtimeType.hashCode;
}

extension $MyAvailableVehicleExtension on MyAvailableVehicle {
  MyAvailableVehicle copyWith(
      {AdjacentNonAvailability? nextNonAvailability,
      bool? overdue,
      AdjacentNonAvailability? previousNonAvailability,
      enums.MyAvailableVehicleType? type,
      Vehicle? vehicle,
      VehicleUsage? vehicleUsage}) {
    return MyAvailableVehicle(
        nextNonAvailability: nextNonAvailability ?? this.nextNonAvailability,
        overdue: overdue ?? this.overdue,
        previousNonAvailability:
            previousNonAvailability ?? this.previousNonAvailability,
        type: type ?? this.type,
        vehicle: vehicle ?? this.vehicle,
        vehicleUsage: vehicleUsage ?? this.vehicleUsage);
  }

  MyAvailableVehicle copyWithWrapped(
      {Wrapped<AdjacentNonAvailability?>? nextNonAvailability,
      Wrapped<bool?>? overdue,
      Wrapped<AdjacentNonAvailability?>? previousNonAvailability,
      Wrapped<enums.MyAvailableVehicleType?>? type,
      Wrapped<Vehicle?>? vehicle,
      Wrapped<VehicleUsage?>? vehicleUsage}) {
    return MyAvailableVehicle(
        nextNonAvailability: (nextNonAvailability != null
            ? nextNonAvailability.value
            : this.nextNonAvailability),
        overdue: (overdue != null ? overdue.value : this.overdue),
        previousNonAvailability: (previousNonAvailability != null
            ? previousNonAvailability.value
            : this.previousNonAvailability),
        type: (type != null ? type.value : this.type),
        vehicle: (vehicle != null ? vehicle.value : this.vehicle),
        vehicleUsage:
            (vehicleUsage != null ? vehicleUsage.value : this.vehicleUsage));
  }
}

@JsonSerializable(explicitToJson: true)
class MyAvailableVehiclesPage {
  const MyAvailableVehiclesPage({
    this.currentNonAvailablePeriods,
  });

  factory MyAvailableVehiclesPage.fromJson(Map<String, dynamic> json) =>
      _$MyAvailableVehiclesPageFromJson(json);

  static const toJsonFactory = _$MyAvailableVehiclesPageToJson;
  Map<String, dynamic> toJson() => _$MyAvailableVehiclesPageToJson(this);

  @JsonKey(
      name: 'currentNonAvailablePeriods', defaultValue: <MyAvailableVehicle>[])
  final List<MyAvailableVehicle>? currentNonAvailablePeriods;
  static const fromJsonFactory = _$MyAvailableVehiclesPageFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is MyAvailableVehiclesPage &&
            (identical(other.currentNonAvailablePeriods,
                    currentNonAvailablePeriods) ||
                const DeepCollectionEquality().equals(
                    other.currentNonAvailablePeriods,
                    currentNonAvailablePeriods)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(currentNonAvailablePeriods) ^
      runtimeType.hashCode;
}

extension $MyAvailableVehiclesPageExtension on MyAvailableVehiclesPage {
  MyAvailableVehiclesPage copyWith(
      {List<MyAvailableVehicle>? currentNonAvailablePeriods}) {
    return MyAvailableVehiclesPage(
        currentNonAvailablePeriods:
            currentNonAvailablePeriods ?? this.currentNonAvailablePeriods);
  }

  MyAvailableVehiclesPage copyWithWrapped(
      {Wrapped<List<MyAvailableVehicle>?>? currentNonAvailablePeriods}) {
    return MyAvailableVehiclesPage(
        currentNonAvailablePeriods: (currentNonAvailablePeriods != null
            ? currentNonAvailablePeriods.value
            : this.currentNonAvailablePeriods));
  }
}

@JsonSerializable(explicitToJson: true)
class NonAvailabilitiesPage {
  const NonAvailabilitiesPage({
    this.nonAvailabilities,
  });

  factory NonAvailabilitiesPage.fromJson(Map<String, dynamic> json) =>
      _$NonAvailabilitiesPageFromJson(json);

  static const toJsonFactory = _$NonAvailabilitiesPageToJson;
  Map<String, dynamic> toJson() => _$NonAvailabilitiesPageToJson(this);

  @JsonKey(name: 'nonAvailabilities', defaultValue: <NonAvailability>[])
  final List<NonAvailability>? nonAvailabilities;
  static const fromJsonFactory = _$NonAvailabilitiesPageFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is NonAvailabilitiesPage &&
            (identical(other.nonAvailabilities, nonAvailabilities) ||
                const DeepCollectionEquality()
                    .equals(other.nonAvailabilities, nonAvailabilities)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(nonAvailabilities) ^
      runtimeType.hashCode;
}

extension $NonAvailabilitiesPageExtension on NonAvailabilitiesPage {
  NonAvailabilitiesPage copyWith({List<NonAvailability>? nonAvailabilities}) {
    return NonAvailabilitiesPage(
        nonAvailabilities: nonAvailabilities ?? this.nonAvailabilities);
  }

  NonAvailabilitiesPage copyWithWrapped(
      {Wrapped<List<NonAvailability>?>? nonAvailabilities}) {
    return NonAvailabilitiesPage(
        nonAvailabilities: (nonAvailabilities != null
            ? nonAvailabilities.value
            : this.nonAvailabilities));
  }
}

@JsonSerializable(explicitToJson: true)
class NonAvailabilitiesPerVehicle {
  const NonAvailabilitiesPerVehicle({
    this.currentPrivateUsageOverdue,
    this.currentPrivateUsageStart,
    this.nonAvailabilities,
    this.vehicleId,
    this.vehicleName,
  });

  factory NonAvailabilitiesPerVehicle.fromJson(Map<String, dynamic> json) =>
      _$NonAvailabilitiesPerVehicleFromJson(json);

  static const toJsonFactory = _$NonAvailabilitiesPerVehicleToJson;
  Map<String, dynamic> toJson() => _$NonAvailabilitiesPerVehicleToJson(this);

  @JsonKey(name: 'currentPrivateUsageOverdue')
  final bool? currentPrivateUsageOverdue;
  @JsonKey(name: 'currentPrivateUsageStart')
  final DateTime? currentPrivateUsageStart;
  @JsonKey(name: 'nonAvailabilities', defaultValue: <NonAvailability>[])
  final List<NonAvailability>? nonAvailabilities;
  @JsonKey(name: 'vehicleId')
  final String? vehicleId;
  @JsonKey(name: 'vehicleName')
  final String? vehicleName;
  static const fromJsonFactory = _$NonAvailabilitiesPerVehicleFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is NonAvailabilitiesPerVehicle &&
            (identical(other.currentPrivateUsageOverdue,
                    currentPrivateUsageOverdue) ||
                const DeepCollectionEquality().equals(
                    other.currentPrivateUsageOverdue,
                    currentPrivateUsageOverdue)) &&
            (identical(
                    other.currentPrivateUsageStart, currentPrivateUsageStart) ||
                const DeepCollectionEquality().equals(
                    other.currentPrivateUsageStart,
                    currentPrivateUsageStart)) &&
            (identical(other.nonAvailabilities, nonAvailabilities) ||
                const DeepCollectionEquality()
                    .equals(other.nonAvailabilities, nonAvailabilities)) &&
            (identical(other.vehicleId, vehicleId) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleId, vehicleId)) &&
            (identical(other.vehicleName, vehicleName) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleName, vehicleName)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(currentPrivateUsageOverdue) ^
      const DeepCollectionEquality().hash(currentPrivateUsageStart) ^
      const DeepCollectionEquality().hash(nonAvailabilities) ^
      const DeepCollectionEquality().hash(vehicleId) ^
      const DeepCollectionEquality().hash(vehicleName) ^
      runtimeType.hashCode;
}

extension $NonAvailabilitiesPerVehicleExtension on NonAvailabilitiesPerVehicle {
  NonAvailabilitiesPerVehicle copyWith(
      {bool? currentPrivateUsageOverdue,
      DateTime? currentPrivateUsageStart,
      List<NonAvailability>? nonAvailabilities,
      String? vehicleId,
      String? vehicleName}) {
    return NonAvailabilitiesPerVehicle(
        currentPrivateUsageOverdue:
            currentPrivateUsageOverdue ?? this.currentPrivateUsageOverdue,
        currentPrivateUsageStart:
            currentPrivateUsageStart ?? this.currentPrivateUsageStart,
        nonAvailabilities: nonAvailabilities ?? this.nonAvailabilities,
        vehicleId: vehicleId ?? this.vehicleId,
        vehicleName: vehicleName ?? this.vehicleName);
  }

  NonAvailabilitiesPerVehicle copyWithWrapped(
      {Wrapped<bool?>? currentPrivateUsageOverdue,
      Wrapped<DateTime?>? currentPrivateUsageStart,
      Wrapped<List<NonAvailability>?>? nonAvailabilities,
      Wrapped<String?>? vehicleId,
      Wrapped<String?>? vehicleName}) {
    return NonAvailabilitiesPerVehicle(
        currentPrivateUsageOverdue: (currentPrivateUsageOverdue != null
            ? currentPrivateUsageOverdue.value
            : this.currentPrivateUsageOverdue),
        currentPrivateUsageStart: (currentPrivateUsageStart != null
            ? currentPrivateUsageStart.value
            : this.currentPrivateUsageStart),
        nonAvailabilities: (nonAvailabilities != null
            ? nonAvailabilities.value
            : this.nonAvailabilities),
        vehicleId: (vehicleId != null ? vehicleId.value : this.vehicleId),
        vehicleName:
            (vehicleName != null ? vehicleName.value : this.vehicleName));
  }
}

@JsonSerializable(explicitToJson: true)
class NonAvailabilitiesPerVehiclePage {
  const NonAvailabilitiesPerVehiclePage({
    this.availabilityEventsPerVehicle,
  });

  factory NonAvailabilitiesPerVehiclePage.fromJson(Map<String, dynamic> json) =>
      _$NonAvailabilitiesPerVehiclePageFromJson(json);

  static const toJsonFactory = _$NonAvailabilitiesPerVehiclePageToJson;
  Map<String, dynamic> toJson() =>
      _$NonAvailabilitiesPerVehiclePageToJson(this);

  @JsonKey(name: 'availabilityEventsPerVehicle')
  final Map<String, dynamic>? availabilityEventsPerVehicle;
  static const fromJsonFactory = _$NonAvailabilitiesPerVehiclePageFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is NonAvailabilitiesPerVehiclePage &&
            (identical(other.availabilityEventsPerVehicle,
                    availabilityEventsPerVehicle) ||
                const DeepCollectionEquality().equals(
                    other.availabilityEventsPerVehicle,
                    availabilityEventsPerVehicle)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(availabilityEventsPerVehicle) ^
      runtimeType.hashCode;
}

extension $NonAvailabilitiesPerVehiclePageExtension
    on NonAvailabilitiesPerVehiclePage {
  NonAvailabilitiesPerVehiclePage copyWith(
      {Map<String, dynamic>? availabilityEventsPerVehicle}) {
    return NonAvailabilitiesPerVehiclePage(
        availabilityEventsPerVehicle:
            availabilityEventsPerVehicle ?? this.availabilityEventsPerVehicle);
  }

  NonAvailabilitiesPerVehiclePage copyWithWrapped(
      {Wrapped<Map<String, dynamic>?>? availabilityEventsPerVehicle}) {
    return NonAvailabilitiesPerVehiclePage(
        availabilityEventsPerVehicle: (availabilityEventsPerVehicle != null
            ? availabilityEventsPerVehicle.value
            : this.availabilityEventsPerVehicle));
  }
}

@JsonSerializable(explicitToJson: true)
class NonAvailability {
  const NonAvailability({
    this.booking,
    this.fullPeriod,
    this.overdue,
    this.period,
    this.plannedPeriod,
    this.type,
    this.usagePeriod,
    this.vehicleId,
  });

  factory NonAvailability.fromJson(Map<String, dynamic> json) =>
      _$NonAvailabilityFromJson(json);

  static const toJsonFactory = _$NonAvailabilityToJson;
  Map<String, dynamic> toJson() => _$NonAvailabilityToJson(this);

  @JsonKey(name: 'booking')
  final Booking? booking;
  @JsonKey(name: 'fullPeriod')
  final Period? fullPeriod;
  @JsonKey(name: 'overdue')
  final bool? overdue;
  @JsonKey(name: 'period')
  final Period? period;
  @JsonKey(name: 'plannedPeriod')
  final Period? plannedPeriod;
  @JsonKey(
    name: 'type',
    toJson: nonAvailabilityTypeNullableToJson,
    fromJson: nonAvailabilityTypeNullableFromJson,
  )
  final enums.NonAvailabilityType? type;
  @JsonKey(name: 'usagePeriod')
  final Period? usagePeriod;
  @JsonKey(name: 'vehicleId')
  final String? vehicleId;
  static const fromJsonFactory = _$NonAvailabilityFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is NonAvailability &&
            (identical(other.booking, booking) ||
                const DeepCollectionEquality()
                    .equals(other.booking, booking)) &&
            (identical(other.fullPeriod, fullPeriod) ||
                const DeepCollectionEquality()
                    .equals(other.fullPeriod, fullPeriod)) &&
            (identical(other.overdue, overdue) ||
                const DeepCollectionEquality()
                    .equals(other.overdue, overdue)) &&
            (identical(other.period, period) ||
                const DeepCollectionEquality().equals(other.period, period)) &&
            (identical(other.plannedPeriod, plannedPeriod) ||
                const DeepCollectionEquality()
                    .equals(other.plannedPeriod, plannedPeriod)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.usagePeriod, usagePeriod) ||
                const DeepCollectionEquality()
                    .equals(other.usagePeriod, usagePeriod)) &&
            (identical(other.vehicleId, vehicleId) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleId, vehicleId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(booking) ^
      const DeepCollectionEquality().hash(fullPeriod) ^
      const DeepCollectionEquality().hash(overdue) ^
      const DeepCollectionEquality().hash(period) ^
      const DeepCollectionEquality().hash(plannedPeriod) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(usagePeriod) ^
      const DeepCollectionEquality().hash(vehicleId) ^
      runtimeType.hashCode;
}

extension $NonAvailabilityExtension on NonAvailability {
  NonAvailability copyWith(
      {Booking? booking,
      Period? fullPeriod,
      bool? overdue,
      Period? period,
      Period? plannedPeriod,
      enums.NonAvailabilityType? type,
      Period? usagePeriod,
      String? vehicleId}) {
    return NonAvailability(
        booking: booking ?? this.booking,
        fullPeriod: fullPeriod ?? this.fullPeriod,
        overdue: overdue ?? this.overdue,
        period: period ?? this.period,
        plannedPeriod: plannedPeriod ?? this.plannedPeriod,
        type: type ?? this.type,
        usagePeriod: usagePeriod ?? this.usagePeriod,
        vehicleId: vehicleId ?? this.vehicleId);
  }

  NonAvailability copyWithWrapped(
      {Wrapped<Booking?>? booking,
      Wrapped<Period?>? fullPeriod,
      Wrapped<bool?>? overdue,
      Wrapped<Period?>? period,
      Wrapped<Period?>? plannedPeriod,
      Wrapped<enums.NonAvailabilityType?>? type,
      Wrapped<Period?>? usagePeriod,
      Wrapped<String?>? vehicleId}) {
    return NonAvailability(
        booking: (booking != null ? booking.value : this.booking),
        fullPeriod: (fullPeriod != null ? fullPeriod.value : this.fullPeriod),
        overdue: (overdue != null ? overdue.value : this.overdue),
        period: (period != null ? period.value : this.period),
        plannedPeriod:
            (plannedPeriod != null ? plannedPeriod.value : this.plannedPeriod),
        type: (type != null ? type.value : this.type),
        usagePeriod:
            (usagePeriod != null ? usagePeriod.value : this.usagePeriod),
        vehicleId: (vehicleId != null ? vehicleId.value : this.vehicleId));
  }
}

@JsonSerializable(explicitToJson: true)
class NonAvailabilityResponse {
  const NonAvailabilityResponse({
    this.conflictsByPeriod,
    this.conflictsHash,
    this.nonAvailabilities,
  });

  factory NonAvailabilityResponse.fromJson(Map<String, dynamic> json) =>
      _$NonAvailabilityResponseFromJson(json);

  static const toJsonFactory = _$NonAvailabilityResponseToJson;
  Map<String, dynamic> toJson() => _$NonAvailabilityResponseToJson(this);

  @JsonKey(name: 'conflictsByPeriod')
  final Map<String, dynamic>? conflictsByPeriod;
  @JsonKey(name: 'conflictsHash')
  final String? conflictsHash;
  @JsonKey(name: 'nonAvailabilities', defaultValue: <NonAvailability>[])
  final List<NonAvailability>? nonAvailabilities;
  static const fromJsonFactory = _$NonAvailabilityResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is NonAvailabilityResponse &&
            (identical(other.conflictsByPeriod, conflictsByPeriod) ||
                const DeepCollectionEquality()
                    .equals(other.conflictsByPeriod, conflictsByPeriod)) &&
            (identical(other.conflictsHash, conflictsHash) ||
                const DeepCollectionEquality()
                    .equals(other.conflictsHash, conflictsHash)) &&
            (identical(other.nonAvailabilities, nonAvailabilities) ||
                const DeepCollectionEquality()
                    .equals(other.nonAvailabilities, nonAvailabilities)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(conflictsByPeriod) ^
      const DeepCollectionEquality().hash(conflictsHash) ^
      const DeepCollectionEquality().hash(nonAvailabilities) ^
      runtimeType.hashCode;
}

extension $NonAvailabilityResponseExtension on NonAvailabilityResponse {
  NonAvailabilityResponse copyWith(
      {Map<String, dynamic>? conflictsByPeriod,
      String? conflictsHash,
      List<NonAvailability>? nonAvailabilities}) {
    return NonAvailabilityResponse(
        conflictsByPeriod: conflictsByPeriod ?? this.conflictsByPeriod,
        conflictsHash: conflictsHash ?? this.conflictsHash,
        nonAvailabilities: nonAvailabilities ?? this.nonAvailabilities);
  }

  NonAvailabilityResponse copyWithWrapped(
      {Wrapped<Map<String, dynamic>?>? conflictsByPeriod,
      Wrapped<String?>? conflictsHash,
      Wrapped<List<NonAvailability>?>? nonAvailabilities}) {
    return NonAvailabilityResponse(
        conflictsByPeriod: (conflictsByPeriod != null
            ? conflictsByPeriod.value
            : this.conflictsByPeriod),
        conflictsHash:
            (conflictsHash != null ? conflictsHash.value : this.conflictsHash),
        nonAvailabilities: (nonAvailabilities != null
            ? nonAvailabilities.value
            : this.nonAvailabilities));
  }
}

@JsonSerializable(explicitToJson: true)
class Period {
  const Period({
    this.end,
    this.start,
  });

  factory Period.fromJson(Map<String, dynamic> json) => _$PeriodFromJson(json);

  static const toJsonFactory = _$PeriodToJson;
  Map<String, dynamic> toJson() => _$PeriodToJson(this);

  @JsonKey(name: 'end')
  final DateTime? end;
  @JsonKey(name: 'start')
  final DateTime? start;
  static const fromJsonFactory = _$PeriodFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Period &&
            (identical(other.end, end) ||
                const DeepCollectionEquality().equals(other.end, end)) &&
            (identical(other.start, start) ||
                const DeepCollectionEquality().equals(other.start, start)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(end) ^
      const DeepCollectionEquality().hash(start) ^
      runtimeType.hashCode;
}

extension $PeriodExtension on Period {
  Period copyWith({DateTime? end, DateTime? start}) {
    return Period(end: end ?? this.end, start: start ?? this.start);
  }

  Period copyWithWrapped({Wrapped<DateTime?>? end, Wrapped<DateTime?>? start}) {
    return Period(
        end: (end != null ? end.value : this.end),
        start: (start != null ? start.value : this.start));
  }
}

@JsonSerializable(explicitToJson: true)
class RecurringNonAvailability {
  const RecurringNonAvailability({
    this.id,
    this.schedule,
    this.vehicle,
  });

  factory RecurringNonAvailability.fromJson(Map<String, dynamic> json) =>
      _$RecurringNonAvailabilityFromJson(json);

  static const toJsonFactory = _$RecurringNonAvailabilityToJson;
  Map<String, dynamic> toJson() => _$RecurringNonAvailabilityToJson(this);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'schedule')
  final RecurringSchedule? schedule;
  @JsonKey(name: 'vehicle')
  final Vehicle? vehicle;
  static const fromJsonFactory = _$RecurringNonAvailabilityFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is RecurringNonAvailability &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.schedule, schedule) ||
                const DeepCollectionEquality()
                    .equals(other.schedule, schedule)) &&
            (identical(other.vehicle, vehicle) ||
                const DeepCollectionEquality().equals(other.vehicle, vehicle)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(schedule) ^
      const DeepCollectionEquality().hash(vehicle) ^
      runtimeType.hashCode;
}

extension $RecurringNonAvailabilityExtension on RecurringNonAvailability {
  RecurringNonAvailability copyWith(
      {String? id, RecurringSchedule? schedule, Vehicle? vehicle}) {
    return RecurringNonAvailability(
        id: id ?? this.id,
        schedule: schedule ?? this.schedule,
        vehicle: vehicle ?? this.vehicle);
  }

  RecurringNonAvailability copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<RecurringSchedule?>? schedule,
      Wrapped<Vehicle?>? vehicle}) {
    return RecurringNonAvailability(
        id: (id != null ? id.value : this.id),
        schedule: (schedule != null ? schedule.value : this.schedule),
        vehicle: (vehicle != null ? vehicle.value : this.vehicle));
  }
}

@JsonSerializable(explicitToJson: true)
class RecurringSchedule {
  const RecurringSchedule({
    this.daysOfWeek,
    required this.endDate,
    this.interval,
    required this.recurringType,
    this.timeZone,
  });

  factory RecurringSchedule.fromJson(Map<String, dynamic> json) =>
      _$RecurringScheduleFromJson(json);

  static const toJsonFactory = _$RecurringScheduleToJson;
  Map<String, dynamic> toJson() => _$RecurringScheduleToJson(this);

  @JsonKey(name: 'daysOfWeek', defaultValue: <int>[])
  final List<int>? daysOfWeek;
  @JsonKey(name: 'endDate')
  final DateTime endDate;
  @JsonKey(name: 'interval')
  final int? interval;
  @JsonKey(
    name: 'recurringType',
    toJson: recurringScheduleRecurringTypeToJson,
    fromJson: recurringScheduleRecurringTypeFromJson,
  )
  final enums.RecurringScheduleRecurringType recurringType;
  @JsonKey(
    name: 'timeZone',
    toJson: recurringScheduleTimeZoneNullableToJson,
    fromJson: recurringScheduleTimeZoneNullableFromJson,
  )
  final enums.RecurringScheduleTimeZone? timeZone;
  static const fromJsonFactory = _$RecurringScheduleFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is RecurringSchedule &&
            (identical(other.daysOfWeek, daysOfWeek) ||
                const DeepCollectionEquality()
                    .equals(other.daysOfWeek, daysOfWeek)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.interval, interval) ||
                const DeepCollectionEquality()
                    .equals(other.interval, interval)) &&
            (identical(other.recurringType, recurringType) ||
                const DeepCollectionEquality()
                    .equals(other.recurringType, recurringType)) &&
            (identical(other.timeZone, timeZone) ||
                const DeepCollectionEquality()
                    .equals(other.timeZone, timeZone)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(daysOfWeek) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(interval) ^
      const DeepCollectionEquality().hash(recurringType) ^
      const DeepCollectionEquality().hash(timeZone) ^
      runtimeType.hashCode;
}

extension $RecurringScheduleExtension on RecurringSchedule {
  RecurringSchedule copyWith(
      {List<int>? daysOfWeek,
      DateTime? endDate,
      int? interval,
      enums.RecurringScheduleRecurringType? recurringType,
      enums.RecurringScheduleTimeZone? timeZone}) {
    return RecurringSchedule(
        daysOfWeek: daysOfWeek ?? this.daysOfWeek,
        endDate: endDate ?? this.endDate,
        interval: interval ?? this.interval,
        recurringType: recurringType ?? this.recurringType,
        timeZone: timeZone ?? this.timeZone);
  }

  RecurringSchedule copyWithWrapped(
      {Wrapped<List<int>?>? daysOfWeek,
      Wrapped<DateTime>? endDate,
      Wrapped<int?>? interval,
      Wrapped<enums.RecurringScheduleRecurringType>? recurringType,
      Wrapped<enums.RecurringScheduleTimeZone?>? timeZone}) {
    return RecurringSchedule(
        daysOfWeek: (daysOfWeek != null ? daysOfWeek.value : this.daysOfWeek),
        endDate: (endDate != null ? endDate.value : this.endDate),
        interval: (interval != null ? interval.value : this.interval),
        recurringType:
            (recurringType != null ? recurringType.value : this.recurringType),
        timeZone: (timeZone != null ? timeZone.value : this.timeZone));
  }
}

@JsonSerializable(explicitToJson: true)
class RegisterDeviceRequest {
  const RegisterDeviceRequest({
    this.active,
    required this.token,
  });

  factory RegisterDeviceRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterDeviceRequestFromJson(json);

  static const toJsonFactory = _$RegisterDeviceRequestToJson;
  Map<String, dynamic> toJson() => _$RegisterDeviceRequestToJson(this);

  @JsonKey(name: 'active')
  final bool? active;
  @JsonKey(name: 'token')
  final String token;
  static const fromJsonFactory = _$RegisterDeviceRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is RegisterDeviceRequest &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(token) ^
      runtimeType.hashCode;
}

extension $RegisterDeviceRequestExtension on RegisterDeviceRequest {
  RegisterDeviceRequest copyWith({bool? active, String? token}) {
    return RegisterDeviceRequest(
        active: active ?? this.active, token: token ?? this.token);
  }

  RegisterDeviceRequest copyWithWrapped(
      {Wrapped<bool?>? active, Wrapped<String>? token}) {
    return RegisterDeviceRequest(
        active: (active != null ? active.value : this.active),
        token: (token != null ? token.value : this.token));
  }
}

@JsonSerializable(explicitToJson: true)
class ReplaceBookingRequest {
  const ReplaceBookingRequest({
    this.adminComments,
    this.authorizationComments,
    this.clientId,
    this.comments,
    this.filtersForBooking,
    this.invoiceComments,
    this.originalBookingId,
    this.period,
    this.userId,
    this.vehicleId,
  });

  factory ReplaceBookingRequest.fromJson(Map<String, dynamic> json) =>
      _$ReplaceBookingRequestFromJson(json);

  static const toJsonFactory = _$ReplaceBookingRequestToJson;
  Map<String, dynamic> toJson() => _$ReplaceBookingRequestToJson(this);

  @JsonKey(name: 'adminComments')
  final String? adminComments;
  @JsonKey(name: 'authorizationComments')
  final String? authorizationComments;
  @JsonKey(name: 'clientId')
  final String? clientId;
  @JsonKey(name: 'comments')
  final String? comments;
  @JsonKey(name: 'filtersForBooking')
  final FiltersForBooking? filtersForBooking;
  @JsonKey(name: 'invoiceComments')
  final String? invoiceComments;
  @JsonKey(name: 'originalBookingId')
  final String? originalBookingId;
  @JsonKey(name: 'period')
  final Period? period;
  @JsonKey(name: 'userId')
  final String? userId;
  @JsonKey(name: 'vehicleId')
  final String? vehicleId;
  static const fromJsonFactory = _$ReplaceBookingRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ReplaceBookingRequest &&
            (identical(other.adminComments, adminComments) ||
                const DeepCollectionEquality()
                    .equals(other.adminComments, adminComments)) &&
            (identical(other.authorizationComments, authorizationComments) ||
                const DeepCollectionEquality().equals(
                    other.authorizationComments, authorizationComments)) &&
            (identical(other.clientId, clientId) ||
                const DeepCollectionEquality()
                    .equals(other.clientId, clientId)) &&
            (identical(other.comments, comments) ||
                const DeepCollectionEquality()
                    .equals(other.comments, comments)) &&
            (identical(other.filtersForBooking, filtersForBooking) ||
                const DeepCollectionEquality()
                    .equals(other.filtersForBooking, filtersForBooking)) &&
            (identical(other.invoiceComments, invoiceComments) ||
                const DeepCollectionEquality()
                    .equals(other.invoiceComments, invoiceComments)) &&
            (identical(other.originalBookingId, originalBookingId) ||
                const DeepCollectionEquality()
                    .equals(other.originalBookingId, originalBookingId)) &&
            (identical(other.period, period) ||
                const DeepCollectionEquality().equals(other.period, period)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.vehicleId, vehicleId) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleId, vehicleId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(adminComments) ^
      const DeepCollectionEquality().hash(authorizationComments) ^
      const DeepCollectionEquality().hash(clientId) ^
      const DeepCollectionEquality().hash(comments) ^
      const DeepCollectionEquality().hash(filtersForBooking) ^
      const DeepCollectionEquality().hash(invoiceComments) ^
      const DeepCollectionEquality().hash(originalBookingId) ^
      const DeepCollectionEquality().hash(period) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(vehicleId) ^
      runtimeType.hashCode;
}

extension $ReplaceBookingRequestExtension on ReplaceBookingRequest {
  ReplaceBookingRequest copyWith(
      {String? adminComments,
      String? authorizationComments,
      String? clientId,
      String? comments,
      FiltersForBooking? filtersForBooking,
      String? invoiceComments,
      String? originalBookingId,
      Period? period,
      String? userId,
      String? vehicleId}) {
    return ReplaceBookingRequest(
        adminComments: adminComments ?? this.adminComments,
        authorizationComments:
            authorizationComments ?? this.authorizationComments,
        clientId: clientId ?? this.clientId,
        comments: comments ?? this.comments,
        filtersForBooking: filtersForBooking ?? this.filtersForBooking,
        invoiceComments: invoiceComments ?? this.invoiceComments,
        originalBookingId: originalBookingId ?? this.originalBookingId,
        period: period ?? this.period,
        userId: userId ?? this.userId,
        vehicleId: vehicleId ?? this.vehicleId);
  }

  ReplaceBookingRequest copyWithWrapped(
      {Wrapped<String?>? adminComments,
      Wrapped<String?>? authorizationComments,
      Wrapped<String?>? clientId,
      Wrapped<String?>? comments,
      Wrapped<FiltersForBooking?>? filtersForBooking,
      Wrapped<String?>? invoiceComments,
      Wrapped<String?>? originalBookingId,
      Wrapped<Period?>? period,
      Wrapped<String?>? userId,
      Wrapped<String?>? vehicleId}) {
    return ReplaceBookingRequest(
        adminComments:
            (adminComments != null ? adminComments.value : this.adminComments),
        authorizationComments: (authorizationComments != null
            ? authorizationComments.value
            : this.authorizationComments),
        clientId: (clientId != null ? clientId.value : this.clientId),
        comments: (comments != null ? comments.value : this.comments),
        filtersForBooking: (filtersForBooking != null
            ? filtersForBooking.value
            : this.filtersForBooking),
        invoiceComments: (invoiceComments != null
            ? invoiceComments.value
            : this.invoiceComments),
        originalBookingId: (originalBookingId != null
            ? originalBookingId.value
            : this.originalBookingId),
        period: (period != null ? period.value : this.period),
        userId: (userId != null ? userId.value : this.userId),
        vehicleId: (vehicleId != null ? vehicleId.value : this.vehicleId));
  }
}

@JsonSerializable(explicitToJson: true)
class SearchBookingsRequest {
  const SearchBookingsRequest({
    this.adminComments,
    this.clientId,
    this.comments,
    this.endPeriod,
    this.invoiceStatuses,
    this.licensePlate,
    this.startPeriod,
    this.statuses,
    this.userId,
    this.vehicleId,
  });

  factory SearchBookingsRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchBookingsRequestFromJson(json);

  static const toJsonFactory = _$SearchBookingsRequestToJson;
  Map<String, dynamic> toJson() => _$SearchBookingsRequestToJson(this);

  @JsonKey(name: 'adminComments')
  final String? adminComments;
  @JsonKey(name: 'clientId')
  final String? clientId;
  @JsonKey(name: 'comments')
  final String? comments;
  @JsonKey(name: 'endPeriod')
  final Period? endPeriod;
  @JsonKey(
    name: 'invoiceStatuses',
    toJson: searchBookingsRequestInvoiceStatusesListToJson,
    fromJson: searchBookingsRequestInvoiceStatusesListFromJson,
  )
  final List<enums.SearchBookingsRequestInvoiceStatuses>? invoiceStatuses;
  @JsonKey(name: 'licensePlate')
  final String? licensePlate;
  @JsonKey(name: 'startPeriod')
  final Period? startPeriod;
  @JsonKey(
    name: 'statuses',
    toJson: searchBookingsRequestStatusesListToJson,
    fromJson: searchBookingsRequestStatusesListFromJson,
  )
  final List<enums.SearchBookingsRequestStatuses>? statuses;
  @JsonKey(name: 'userId')
  final String? userId;
  @JsonKey(name: 'vehicleId')
  final String? vehicleId;
  static const fromJsonFactory = _$SearchBookingsRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SearchBookingsRequest &&
            (identical(other.adminComments, adminComments) ||
                const DeepCollectionEquality()
                    .equals(other.adminComments, adminComments)) &&
            (identical(other.clientId, clientId) ||
                const DeepCollectionEquality()
                    .equals(other.clientId, clientId)) &&
            (identical(other.comments, comments) ||
                const DeepCollectionEquality()
                    .equals(other.comments, comments)) &&
            (identical(other.endPeriod, endPeriod) ||
                const DeepCollectionEquality()
                    .equals(other.endPeriod, endPeriod)) &&
            (identical(other.invoiceStatuses, invoiceStatuses) ||
                const DeepCollectionEquality()
                    .equals(other.invoiceStatuses, invoiceStatuses)) &&
            (identical(other.licensePlate, licensePlate) ||
                const DeepCollectionEquality()
                    .equals(other.licensePlate, licensePlate)) &&
            (identical(other.startPeriod, startPeriod) ||
                const DeepCollectionEquality()
                    .equals(other.startPeriod, startPeriod)) &&
            (identical(other.statuses, statuses) ||
                const DeepCollectionEquality()
                    .equals(other.statuses, statuses)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.vehicleId, vehicleId) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleId, vehicleId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(adminComments) ^
      const DeepCollectionEquality().hash(clientId) ^
      const DeepCollectionEquality().hash(comments) ^
      const DeepCollectionEquality().hash(endPeriod) ^
      const DeepCollectionEquality().hash(invoiceStatuses) ^
      const DeepCollectionEquality().hash(licensePlate) ^
      const DeepCollectionEquality().hash(startPeriod) ^
      const DeepCollectionEquality().hash(statuses) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(vehicleId) ^
      runtimeType.hashCode;
}

extension $SearchBookingsRequestExtension on SearchBookingsRequest {
  SearchBookingsRequest copyWith(
      {String? adminComments,
      String? clientId,
      String? comments,
      Period? endPeriod,
      List<enums.SearchBookingsRequestInvoiceStatuses>? invoiceStatuses,
      String? licensePlate,
      Period? startPeriod,
      List<enums.SearchBookingsRequestStatuses>? statuses,
      String? userId,
      String? vehicleId}) {
    return SearchBookingsRequest(
        adminComments: adminComments ?? this.adminComments,
        clientId: clientId ?? this.clientId,
        comments: comments ?? this.comments,
        endPeriod: endPeriod ?? this.endPeriod,
        invoiceStatuses: invoiceStatuses ?? this.invoiceStatuses,
        licensePlate: licensePlate ?? this.licensePlate,
        startPeriod: startPeriod ?? this.startPeriod,
        statuses: statuses ?? this.statuses,
        userId: userId ?? this.userId,
        vehicleId: vehicleId ?? this.vehicleId);
  }

  SearchBookingsRequest copyWithWrapped(
      {Wrapped<String?>? adminComments,
      Wrapped<String?>? clientId,
      Wrapped<String?>? comments,
      Wrapped<Period?>? endPeriod,
      Wrapped<List<enums.SearchBookingsRequestInvoiceStatuses>?>?
          invoiceStatuses,
      Wrapped<String?>? licensePlate,
      Wrapped<Period?>? startPeriod,
      Wrapped<List<enums.SearchBookingsRequestStatuses>?>? statuses,
      Wrapped<String?>? userId,
      Wrapped<String?>? vehicleId}) {
    return SearchBookingsRequest(
        adminComments:
            (adminComments != null ? adminComments.value : this.adminComments),
        clientId: (clientId != null ? clientId.value : this.clientId),
        comments: (comments != null ? comments.value : this.comments),
        endPeriod: (endPeriod != null ? endPeriod.value : this.endPeriod),
        invoiceStatuses: (invoiceStatuses != null
            ? invoiceStatuses.value
            : this.invoiceStatuses),
        licensePlate:
            (licensePlate != null ? licensePlate.value : this.licensePlate),
        startPeriod:
            (startPeriod != null ? startPeriod.value : this.startPeriod),
        statuses: (statuses != null ? statuses.value : this.statuses),
        userId: (userId != null ? userId.value : this.userId),
        vehicleId: (vehicleId != null ? vehicleId.value : this.vehicleId));
  }
}

@JsonSerializable(explicitToJson: true)
class SearchNonAvailabilityEventsRequest {
  const SearchNonAvailabilityEventsRequest({
    this.period,
    this.vehicleIds,
  });

  factory SearchNonAvailabilityEventsRequest.fromJson(
          Map<String, dynamic> json) =>
      _$SearchNonAvailabilityEventsRequestFromJson(json);

  static const toJsonFactory = _$SearchNonAvailabilityEventsRequestToJson;
  Map<String, dynamic> toJson() =>
      _$SearchNonAvailabilityEventsRequestToJson(this);

  @JsonKey(name: 'period')
  final Period? period;
  @JsonKey(name: 'vehicleIds', defaultValue: <String>[])
  final List<String>? vehicleIds;
  static const fromJsonFactory = _$SearchNonAvailabilityEventsRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SearchNonAvailabilityEventsRequest &&
            (identical(other.period, period) ||
                const DeepCollectionEquality().equals(other.period, period)) &&
            (identical(other.vehicleIds, vehicleIds) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleIds, vehicleIds)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(period) ^
      const DeepCollectionEquality().hash(vehicleIds) ^
      runtimeType.hashCode;
}

extension $SearchNonAvailabilityEventsRequestExtension
    on SearchNonAvailabilityEventsRequest {
  SearchNonAvailabilityEventsRequest copyWith(
      {Period? period, List<String>? vehicleIds}) {
    return SearchNonAvailabilityEventsRequest(
        period: period ?? this.period,
        vehicleIds: vehicleIds ?? this.vehicleIds);
  }

  SearchNonAvailabilityEventsRequest copyWithWrapped(
      {Wrapped<Period?>? period, Wrapped<List<String>?>? vehicleIds}) {
    return SearchNonAvailabilityEventsRequest(
        period: (period != null ? period.value : this.period),
        vehicleIds: (vehicleIds != null ? vehicleIds.value : this.vehicleIds));
  }
}

@JsonSerializable(explicitToJson: true)
class SearchUsersRequest {
  const SearchUsersRequest({
    this.defaultMembershipId,
    this.displayName,
    this.favoriteLocation,
    this.favoritelocationDistance,
    this.homeLocation,
    this.homelocationDistance,
    this.remoteId,
    this.userName,
    this.workLocation,
    this.worklocationDistance,
  });

  factory SearchUsersRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchUsersRequestFromJson(json);

  static const toJsonFactory = _$SearchUsersRequestToJson;
  Map<String, dynamic> toJson() => _$SearchUsersRequestToJson(this);

  @JsonKey(name: 'defaultMembershipId')
  final String? defaultMembershipId;
  @JsonKey(name: 'displayName')
  final String? displayName;
  @JsonKey(name: 'favoriteLocation')
  final GpsLocation? favoriteLocation;
  @JsonKey(name: 'favoritelocationDistance')
  final int? favoritelocationDistance;
  @JsonKey(name: 'homeLocation')
  final GpsLocation? homeLocation;
  @JsonKey(name: 'homelocationDistance')
  final int? homelocationDistance;
  @JsonKey(name: 'remoteId')
  final String? remoteId;
  @JsonKey(name: 'userName')
  final String? userName;
  @JsonKey(name: 'workLocation')
  final GpsLocation? workLocation;
  @JsonKey(name: 'worklocationDistance')
  final int? worklocationDistance;
  static const fromJsonFactory = _$SearchUsersRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SearchUsersRequest &&
            (identical(other.defaultMembershipId, defaultMembershipId) ||
                const DeepCollectionEquality()
                    .equals(other.defaultMembershipId, defaultMembershipId)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.favoriteLocation, favoriteLocation) ||
                const DeepCollectionEquality()
                    .equals(other.favoriteLocation, favoriteLocation)) &&
            (identical(
                    other.favoritelocationDistance, favoritelocationDistance) ||
                const DeepCollectionEquality().equals(
                    other.favoritelocationDistance,
                    favoritelocationDistance)) &&
            (identical(other.homeLocation, homeLocation) ||
                const DeepCollectionEquality()
                    .equals(other.homeLocation, homeLocation)) &&
            (identical(other.homelocationDistance, homelocationDistance) ||
                const DeepCollectionEquality().equals(
                    other.homelocationDistance, homelocationDistance)) &&
            (identical(other.remoteId, remoteId) ||
                const DeepCollectionEquality()
                    .equals(other.remoteId, remoteId)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.workLocation, workLocation) ||
                const DeepCollectionEquality()
                    .equals(other.workLocation, workLocation)) &&
            (identical(other.worklocationDistance, worklocationDistance) ||
                const DeepCollectionEquality()
                    .equals(other.worklocationDistance, worklocationDistance)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(defaultMembershipId) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(favoriteLocation) ^
      const DeepCollectionEquality().hash(favoritelocationDistance) ^
      const DeepCollectionEquality().hash(homeLocation) ^
      const DeepCollectionEquality().hash(homelocationDistance) ^
      const DeepCollectionEquality().hash(remoteId) ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(workLocation) ^
      const DeepCollectionEquality().hash(worklocationDistance) ^
      runtimeType.hashCode;
}

extension $SearchUsersRequestExtension on SearchUsersRequest {
  SearchUsersRequest copyWith(
      {String? defaultMembershipId,
      String? displayName,
      GpsLocation? favoriteLocation,
      int? favoritelocationDistance,
      GpsLocation? homeLocation,
      int? homelocationDistance,
      String? remoteId,
      String? userName,
      GpsLocation? workLocation,
      int? worklocationDistance}) {
    return SearchUsersRequest(
        defaultMembershipId: defaultMembershipId ?? this.defaultMembershipId,
        displayName: displayName ?? this.displayName,
        favoriteLocation: favoriteLocation ?? this.favoriteLocation,
        favoritelocationDistance:
            favoritelocationDistance ?? this.favoritelocationDistance,
        homeLocation: homeLocation ?? this.homeLocation,
        homelocationDistance: homelocationDistance ?? this.homelocationDistance,
        remoteId: remoteId ?? this.remoteId,
        userName: userName ?? this.userName,
        workLocation: workLocation ?? this.workLocation,
        worklocationDistance:
            worklocationDistance ?? this.worklocationDistance);
  }

  SearchUsersRequest copyWithWrapped(
      {Wrapped<String?>? defaultMembershipId,
      Wrapped<String?>? displayName,
      Wrapped<GpsLocation?>? favoriteLocation,
      Wrapped<int?>? favoritelocationDistance,
      Wrapped<GpsLocation?>? homeLocation,
      Wrapped<int?>? homelocationDistance,
      Wrapped<String?>? remoteId,
      Wrapped<String?>? userName,
      Wrapped<GpsLocation?>? workLocation,
      Wrapped<int?>? worklocationDistance}) {
    return SearchUsersRequest(
        defaultMembershipId: (defaultMembershipId != null
            ? defaultMembershipId.value
            : this.defaultMembershipId),
        displayName:
            (displayName != null ? displayName.value : this.displayName),
        favoriteLocation: (favoriteLocation != null
            ? favoriteLocation.value
            : this.favoriteLocation),
        favoritelocationDistance: (favoritelocationDistance != null
            ? favoritelocationDistance.value
            : this.favoritelocationDistance),
        homeLocation:
            (homeLocation != null ? homeLocation.value : this.homeLocation),
        homelocationDistance: (homelocationDistance != null
            ? homelocationDistance.value
            : this.homelocationDistance),
        remoteId: (remoteId != null ? remoteId.value : this.remoteId),
        userName: (userName != null ? userName.value : this.userName),
        workLocation:
            (workLocation != null ? workLocation.value : this.workLocation),
        worklocationDistance: (worklocationDistance != null
            ? worklocationDistance.value
            : this.worklocationDistance));
  }
}

@JsonSerializable(explicitToJson: true)
class SearchVehiclesRequest {
  const SearchVehiclesRequest({
    this.location,
    this.maxDistance,
    required this.period,
    this.subscriptionId,
    this.vehicleFilterCriteria,
  });

  factory SearchVehiclesRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchVehiclesRequestFromJson(json);

  static const toJsonFactory = _$SearchVehiclesRequestToJson;
  Map<String, dynamic> toJson() => _$SearchVehiclesRequestToJson(this);

  @JsonKey(name: 'location')
  final GpsCoordinate? location;
  @JsonKey(name: 'maxDistance')
  final double? maxDistance;
  @JsonKey(name: 'period')
  final Period period;
  @JsonKey(name: 'subscriptionId')
  final String? subscriptionId;
  @JsonKey(name: 'vehicleFilterCriteria')
  final VehicleFilterCriteria? vehicleFilterCriteria;
  static const fromJsonFactory = _$SearchVehiclesRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SearchVehiclesRequest &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.maxDistance, maxDistance) ||
                const DeepCollectionEquality()
                    .equals(other.maxDistance, maxDistance)) &&
            (identical(other.period, period) ||
                const DeepCollectionEquality().equals(other.period, period)) &&
            (identical(other.subscriptionId, subscriptionId) ||
                const DeepCollectionEquality()
                    .equals(other.subscriptionId, subscriptionId)) &&
            (identical(other.vehicleFilterCriteria, vehicleFilterCriteria) ||
                const DeepCollectionEquality().equals(
                    other.vehicleFilterCriteria, vehicleFilterCriteria)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(maxDistance) ^
      const DeepCollectionEquality().hash(period) ^
      const DeepCollectionEquality().hash(subscriptionId) ^
      const DeepCollectionEquality().hash(vehicleFilterCriteria) ^
      runtimeType.hashCode;
}

extension $SearchVehiclesRequestExtension on SearchVehiclesRequest {
  SearchVehiclesRequest copyWith(
      {GpsCoordinate? location,
      double? maxDistance,
      Period? period,
      String? subscriptionId,
      VehicleFilterCriteria? vehicleFilterCriteria}) {
    return SearchVehiclesRequest(
        location: location ?? this.location,
        maxDistance: maxDistance ?? this.maxDistance,
        period: period ?? this.period,
        subscriptionId: subscriptionId ?? this.subscriptionId,
        vehicleFilterCriteria:
            vehicleFilterCriteria ?? this.vehicleFilterCriteria);
  }

  SearchVehiclesRequest copyWithWrapped(
      {Wrapped<GpsCoordinate?>? location,
      Wrapped<double?>? maxDistance,
      Wrapped<Period>? period,
      Wrapped<String?>? subscriptionId,
      Wrapped<VehicleFilterCriteria?>? vehicleFilterCriteria}) {
    return SearchVehiclesRequest(
        location: (location != null ? location.value : this.location),
        maxDistance:
            (maxDistance != null ? maxDistance.value : this.maxDistance),
        period: (period != null ? period.value : this.period),
        subscriptionId: (subscriptionId != null
            ? subscriptionId.value
            : this.subscriptionId),
        vehicleFilterCriteria: (vehicleFilterCriteria != null
            ? vehicleFilterCriteria.value
            : this.vehicleFilterCriteria));
  }
}

@JsonSerializable(explicitToJson: true)
class StartVehicleUsageRequest {
  const StartVehicleUsageRequest({
    this.bookingId,
    this.mileageValue,
    this.vehicleId,
  });

  factory StartVehicleUsageRequest.fromJson(Map<String, dynamic> json) =>
      _$StartVehicleUsageRequestFromJson(json);

  static const toJsonFactory = _$StartVehicleUsageRequestToJson;
  Map<String, dynamic> toJson() => _$StartVehicleUsageRequestToJson(this);

  @JsonKey(name: 'bookingId')
  final String? bookingId;
  @JsonKey(name: 'mileageValue')
  final double? mileageValue;
  @JsonKey(name: 'vehicleId')
  final String? vehicleId;
  static const fromJsonFactory = _$StartVehicleUsageRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is StartVehicleUsageRequest &&
            (identical(other.bookingId, bookingId) ||
                const DeepCollectionEquality()
                    .equals(other.bookingId, bookingId)) &&
            (identical(other.mileageValue, mileageValue) ||
                const DeepCollectionEquality()
                    .equals(other.mileageValue, mileageValue)) &&
            (identical(other.vehicleId, vehicleId) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleId, vehicleId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(bookingId) ^
      const DeepCollectionEquality().hash(mileageValue) ^
      const DeepCollectionEquality().hash(vehicleId) ^
      runtimeType.hashCode;
}

extension $StartVehicleUsageRequestExtension on StartVehicleUsageRequest {
  StartVehicleUsageRequest copyWith(
      {String? bookingId, double? mileageValue, String? vehicleId}) {
    return StartVehicleUsageRequest(
        bookingId: bookingId ?? this.bookingId,
        mileageValue: mileageValue ?? this.mileageValue,
        vehicleId: vehicleId ?? this.vehicleId);
  }

  StartVehicleUsageRequest copyWithWrapped(
      {Wrapped<String?>? bookingId,
      Wrapped<double?>? mileageValue,
      Wrapped<String?>? vehicleId}) {
    return StartVehicleUsageRequest(
        bookingId: (bookingId != null ? bookingId.value : this.bookingId),
        mileageValue:
            (mileageValue != null ? mileageValue.value : this.mileageValue),
        vehicleId: (vehicleId != null ? vehicleId.value : this.vehicleId));
  }
}

@JsonSerializable(explicitToJson: true)
class Subscription {
  const Subscription({
    this.clientId,
    this.clientName,
    this.clientRoles,
    this.commitment,
    this.endDate,
    this.id,
    this.startDate,
    this.subscriptionType,
    this.vehicleId,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);

  static const toJsonFactory = _$SubscriptionToJson;
  Map<String, dynamic> toJson() => _$SubscriptionToJson(this);

  @JsonKey(name: 'clientId')
  final int? clientId;
  @JsonKey(name: 'clientName')
  final String? clientName;
  @JsonKey(
    name: 'clientRoles',
    toJson: subscriptionClientRolesNullableToJson,
    fromJson: subscriptionClientRolesNullableFromJson,
  )
  final enums.SubscriptionClientRoles? clientRoles;
  @JsonKey(name: 'commitment')
  final int? commitment;
  @JsonKey(name: 'endDate')
  final DateTime? endDate;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'startDate')
  final DateTime? startDate;
  @JsonKey(name: 'subscriptionType')
  final String? subscriptionType;
  @JsonKey(name: 'vehicleId')
  final String? vehicleId;
  static const fromJsonFactory = _$SubscriptionFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Subscription &&
            (identical(other.clientId, clientId) ||
                const DeepCollectionEquality()
                    .equals(other.clientId, clientId)) &&
            (identical(other.clientName, clientName) ||
                const DeepCollectionEquality()
                    .equals(other.clientName, clientName)) &&
            (identical(other.clientRoles, clientRoles) ||
                const DeepCollectionEquality()
                    .equals(other.clientRoles, clientRoles)) &&
            (identical(other.commitment, commitment) ||
                const DeepCollectionEquality()
                    .equals(other.commitment, commitment)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.subscriptionType, subscriptionType) ||
                const DeepCollectionEquality()
                    .equals(other.subscriptionType, subscriptionType)) &&
            (identical(other.vehicleId, vehicleId) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleId, vehicleId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(clientId) ^
      const DeepCollectionEquality().hash(clientName) ^
      const DeepCollectionEquality().hash(clientRoles) ^
      const DeepCollectionEquality().hash(commitment) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(subscriptionType) ^
      const DeepCollectionEquality().hash(vehicleId) ^
      runtimeType.hashCode;
}

extension $SubscriptionExtension on Subscription {
  Subscription copyWith(
      {int? clientId,
      String? clientName,
      enums.SubscriptionClientRoles? clientRoles,
      int? commitment,
      DateTime? endDate,
      int? id,
      DateTime? startDate,
      String? subscriptionType,
      String? vehicleId}) {
    return Subscription(
        clientId: clientId ?? this.clientId,
        clientName: clientName ?? this.clientName,
        clientRoles: clientRoles ?? this.clientRoles,
        commitment: commitment ?? this.commitment,
        endDate: endDate ?? this.endDate,
        id: id ?? this.id,
        startDate: startDate ?? this.startDate,
        subscriptionType: subscriptionType ?? this.subscriptionType,
        vehicleId: vehicleId ?? this.vehicleId);
  }

  Subscription copyWithWrapped(
      {Wrapped<int?>? clientId,
      Wrapped<String?>? clientName,
      Wrapped<enums.SubscriptionClientRoles?>? clientRoles,
      Wrapped<int?>? commitment,
      Wrapped<DateTime?>? endDate,
      Wrapped<int?>? id,
      Wrapped<DateTime?>? startDate,
      Wrapped<String?>? subscriptionType,
      Wrapped<String?>? vehicleId}) {
    return Subscription(
        clientId: (clientId != null ? clientId.value : this.clientId),
        clientName: (clientName != null ? clientName.value : this.clientName),
        clientRoles:
            (clientRoles != null ? clientRoles.value : this.clientRoles),
        commitment: (commitment != null ? commitment.value : this.commitment),
        endDate: (endDate != null ? endDate.value : this.endDate),
        id: (id != null ? id.value : this.id),
        startDate: (startDate != null ? startDate.value : this.startDate),
        subscriptionType: (subscriptionType != null
            ? subscriptionType.value
            : this.subscriptionType),
        vehicleId: (vehicleId != null ? vehicleId.value : this.vehicleId));
  }
}

@JsonSerializable(explicitToJson: true)
class Trip {
  const Trip({
    this.endPosition,
    this.endTime,
    this.mileageDelta,
    this.mileageEnd,
    this.mileageStart,
    this.startPosition,
    this.startTime,
  });

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);

  static const toJsonFactory = _$TripToJson;
  Map<String, dynamic> toJson() => _$TripToJson(this);

  @JsonKey(name: 'endPosition')
  final GpsLocation? endPosition;
  @JsonKey(name: 'endTime')
  final DateTime? endTime;
  @JsonKey(name: 'mileageDelta')
  final double? mileageDelta;
  @JsonKey(name: 'mileageEnd')
  final double? mileageEnd;
  @JsonKey(name: 'mileageStart')
  final double? mileageStart;
  @JsonKey(name: 'startPosition')
  final GpsLocation? startPosition;
  @JsonKey(name: 'startTime')
  final DateTime? startTime;
  static const fromJsonFactory = _$TripFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Trip &&
            (identical(other.endPosition, endPosition) ||
                const DeepCollectionEquality()
                    .equals(other.endPosition, endPosition)) &&
            (identical(other.endTime, endTime) ||
                const DeepCollectionEquality()
                    .equals(other.endTime, endTime)) &&
            (identical(other.mileageDelta, mileageDelta) ||
                const DeepCollectionEquality()
                    .equals(other.mileageDelta, mileageDelta)) &&
            (identical(other.mileageEnd, mileageEnd) ||
                const DeepCollectionEquality()
                    .equals(other.mileageEnd, mileageEnd)) &&
            (identical(other.mileageStart, mileageStart) ||
                const DeepCollectionEquality()
                    .equals(other.mileageStart, mileageStart)) &&
            (identical(other.startPosition, startPosition) ||
                const DeepCollectionEquality()
                    .equals(other.startPosition, startPosition)) &&
            (identical(other.startTime, startTime) ||
                const DeepCollectionEquality()
                    .equals(other.startTime, startTime)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(endPosition) ^
      const DeepCollectionEquality().hash(endTime) ^
      const DeepCollectionEquality().hash(mileageDelta) ^
      const DeepCollectionEquality().hash(mileageEnd) ^
      const DeepCollectionEquality().hash(mileageStart) ^
      const DeepCollectionEquality().hash(startPosition) ^
      const DeepCollectionEquality().hash(startTime) ^
      runtimeType.hashCode;
}

extension $TripExtension on Trip {
  Trip copyWith(
      {GpsLocation? endPosition,
      DateTime? endTime,
      double? mileageDelta,
      double? mileageEnd,
      double? mileageStart,
      GpsLocation? startPosition,
      DateTime? startTime}) {
    return Trip(
        endPosition: endPosition ?? this.endPosition,
        endTime: endTime ?? this.endTime,
        mileageDelta: mileageDelta ?? this.mileageDelta,
        mileageEnd: mileageEnd ?? this.mileageEnd,
        mileageStart: mileageStart ?? this.mileageStart,
        startPosition: startPosition ?? this.startPosition,
        startTime: startTime ?? this.startTime);
  }

  Trip copyWithWrapped(
      {Wrapped<GpsLocation?>? endPosition,
      Wrapped<DateTime?>? endTime,
      Wrapped<double?>? mileageDelta,
      Wrapped<double?>? mileageEnd,
      Wrapped<double?>? mileageStart,
      Wrapped<GpsLocation?>? startPosition,
      Wrapped<DateTime?>? startTime}) {
    return Trip(
        endPosition:
            (endPosition != null ? endPosition.value : this.endPosition),
        endTime: (endTime != null ? endTime.value : this.endTime),
        mileageDelta:
            (mileageDelta != null ? mileageDelta.value : this.mileageDelta),
        mileageEnd: (mileageEnd != null ? mileageEnd.value : this.mileageEnd),
        mileageStart:
            (mileageStart != null ? mileageStart.value : this.mileageStart),
        startPosition:
            (startPosition != null ? startPosition.value : this.startPosition),
        startTime: (startTime != null ? startTime.value : this.startTime));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateBookingRequest {
  const UpdateBookingRequest({
    this.adminComments,
    this.authorizationComments,
    this.comments,
    this.doNotInvoice,
    this.invoiceComments,
    this.invoiced,
    this.needsCorrection,
    this.needsCorrectionComments,
    this.period,
  });

  factory UpdateBookingRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateBookingRequestFromJson(json);

  static const toJsonFactory = _$UpdateBookingRequestToJson;
  Map<String, dynamic> toJson() => _$UpdateBookingRequestToJson(this);

  @JsonKey(name: 'adminComments')
  final String? adminComments;
  @JsonKey(name: 'authorizationComments')
  final String? authorizationComments;
  @JsonKey(name: 'comments')
  final String? comments;
  @JsonKey(name: 'doNotInvoice')
  final bool? doNotInvoice;
  @JsonKey(name: 'invoiceComments')
  final String? invoiceComments;
  @JsonKey(name: 'invoiced')
  final bool? invoiced;
  @JsonKey(name: 'needsCorrection')
  final bool? needsCorrection;
  @JsonKey(name: 'needsCorrectionComments')
  final String? needsCorrectionComments;
  @JsonKey(name: 'period')
  final Period? period;
  static const fromJsonFactory = _$UpdateBookingRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UpdateBookingRequest &&
            (identical(other.adminComments, adminComments) ||
                const DeepCollectionEquality()
                    .equals(other.adminComments, adminComments)) &&
            (identical(other.authorizationComments, authorizationComments) ||
                const DeepCollectionEquality().equals(
                    other.authorizationComments, authorizationComments)) &&
            (identical(other.comments, comments) ||
                const DeepCollectionEquality()
                    .equals(other.comments, comments)) &&
            (identical(other.doNotInvoice, doNotInvoice) ||
                const DeepCollectionEquality()
                    .equals(other.doNotInvoice, doNotInvoice)) &&
            (identical(other.invoiceComments, invoiceComments) ||
                const DeepCollectionEquality()
                    .equals(other.invoiceComments, invoiceComments)) &&
            (identical(other.invoiced, invoiced) ||
                const DeepCollectionEquality()
                    .equals(other.invoiced, invoiced)) &&
            (identical(other.needsCorrection, needsCorrection) ||
                const DeepCollectionEquality()
                    .equals(other.needsCorrection, needsCorrection)) &&
            (identical(
                    other.needsCorrectionComments, needsCorrectionComments) ||
                const DeepCollectionEquality().equals(
                    other.needsCorrectionComments, needsCorrectionComments)) &&
            (identical(other.period, period) ||
                const DeepCollectionEquality().equals(other.period, period)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(adminComments) ^
      const DeepCollectionEquality().hash(authorizationComments) ^
      const DeepCollectionEquality().hash(comments) ^
      const DeepCollectionEquality().hash(doNotInvoice) ^
      const DeepCollectionEquality().hash(invoiceComments) ^
      const DeepCollectionEquality().hash(invoiced) ^
      const DeepCollectionEquality().hash(needsCorrection) ^
      const DeepCollectionEquality().hash(needsCorrectionComments) ^
      const DeepCollectionEquality().hash(period) ^
      runtimeType.hashCode;
}

extension $UpdateBookingRequestExtension on UpdateBookingRequest {
  UpdateBookingRequest copyWith(
      {String? adminComments,
      String? authorizationComments,
      String? comments,
      bool? doNotInvoice,
      String? invoiceComments,
      bool? invoiced,
      bool? needsCorrection,
      String? needsCorrectionComments,
      Period? period}) {
    return UpdateBookingRequest(
        adminComments: adminComments ?? this.adminComments,
        authorizationComments:
            authorizationComments ?? this.authorizationComments,
        comments: comments ?? this.comments,
        doNotInvoice: doNotInvoice ?? this.doNotInvoice,
        invoiceComments: invoiceComments ?? this.invoiceComments,
        invoiced: invoiced ?? this.invoiced,
        needsCorrection: needsCorrection ?? this.needsCorrection,
        needsCorrectionComments:
            needsCorrectionComments ?? this.needsCorrectionComments,
        period: period ?? this.period);
  }

  UpdateBookingRequest copyWithWrapped(
      {Wrapped<String?>? adminComments,
      Wrapped<String?>? authorizationComments,
      Wrapped<String?>? comments,
      Wrapped<bool?>? doNotInvoice,
      Wrapped<String?>? invoiceComments,
      Wrapped<bool?>? invoiced,
      Wrapped<bool?>? needsCorrection,
      Wrapped<String?>? needsCorrectionComments,
      Wrapped<Period?>? period}) {
    return UpdateBookingRequest(
        adminComments:
            (adminComments != null ? adminComments.value : this.adminComments),
        authorizationComments: (authorizationComments != null
            ? authorizationComments.value
            : this.authorizationComments),
        comments: (comments != null ? comments.value : this.comments),
        doNotInvoice:
            (doNotInvoice != null ? doNotInvoice.value : this.doNotInvoice),
        invoiceComments: (invoiceComments != null
            ? invoiceComments.value
            : this.invoiceComments),
        invoiced: (invoiced != null ? invoiced.value : this.invoiced),
        needsCorrection: (needsCorrection != null
            ? needsCorrection.value
            : this.needsCorrection),
        needsCorrectionComments: (needsCorrectionComments != null
            ? needsCorrectionComments.value
            : this.needsCorrectionComments),
        period: (period != null ? period.value : this.period));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateNonAvailabilityRequest {
  const UpdateNonAvailabilityRequest({
    this.availabilityId,
    this.conflictResolution,
    required this.period,
    this.recurringSchedule,
    this.removeRecurringSchedule,
  });

  factory UpdateNonAvailabilityRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateNonAvailabilityRequestFromJson(json);

  static const toJsonFactory = _$UpdateNonAvailabilityRequestToJson;
  Map<String, dynamic> toJson() => _$UpdateNonAvailabilityRequestToJson(this);

  @JsonKey(name: 'availabilityId')
  final String? availabilityId;
  @JsonKey(name: 'conflictResolution')
  final ConflictResolution? conflictResolution;
  @JsonKey(name: 'period')
  final Period period;
  @JsonKey(name: 'recurringSchedule')
  final RecurringSchedule? recurringSchedule;
  @JsonKey(name: 'removeRecurringSchedule')
  final bool? removeRecurringSchedule;
  static const fromJsonFactory = _$UpdateNonAvailabilityRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UpdateNonAvailabilityRequest &&
            (identical(other.availabilityId, availabilityId) ||
                const DeepCollectionEquality()
                    .equals(other.availabilityId, availabilityId)) &&
            (identical(other.conflictResolution, conflictResolution) ||
                const DeepCollectionEquality()
                    .equals(other.conflictResolution, conflictResolution)) &&
            (identical(other.period, period) ||
                const DeepCollectionEquality().equals(other.period, period)) &&
            (identical(other.recurringSchedule, recurringSchedule) ||
                const DeepCollectionEquality()
                    .equals(other.recurringSchedule, recurringSchedule)) &&
            (identical(
                    other.removeRecurringSchedule, removeRecurringSchedule) ||
                const DeepCollectionEquality().equals(
                    other.removeRecurringSchedule, removeRecurringSchedule)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(availabilityId) ^
      const DeepCollectionEquality().hash(conflictResolution) ^
      const DeepCollectionEquality().hash(period) ^
      const DeepCollectionEquality().hash(recurringSchedule) ^
      const DeepCollectionEquality().hash(removeRecurringSchedule) ^
      runtimeType.hashCode;
}

extension $UpdateNonAvailabilityRequestExtension
    on UpdateNonAvailabilityRequest {
  UpdateNonAvailabilityRequest copyWith(
      {String? availabilityId,
      ConflictResolution? conflictResolution,
      Period? period,
      RecurringSchedule? recurringSchedule,
      bool? removeRecurringSchedule}) {
    return UpdateNonAvailabilityRequest(
        availabilityId: availabilityId ?? this.availabilityId,
        conflictResolution: conflictResolution ?? this.conflictResolution,
        period: period ?? this.period,
        recurringSchedule: recurringSchedule ?? this.recurringSchedule,
        removeRecurringSchedule:
            removeRecurringSchedule ?? this.removeRecurringSchedule);
  }

  UpdateNonAvailabilityRequest copyWithWrapped(
      {Wrapped<String?>? availabilityId,
      Wrapped<ConflictResolution?>? conflictResolution,
      Wrapped<Period>? period,
      Wrapped<RecurringSchedule?>? recurringSchedule,
      Wrapped<bool?>? removeRecurringSchedule}) {
    return UpdateNonAvailabilityRequest(
        availabilityId: (availabilityId != null
            ? availabilityId.value
            : this.availabilityId),
        conflictResolution: (conflictResolution != null
            ? conflictResolution.value
            : this.conflictResolution),
        period: (period != null ? period.value : this.period),
        recurringSchedule: (recurringSchedule != null
            ? recurringSchedule.value
            : this.recurringSchedule),
        removeRecurringSchedule: (removeRecurringSchedule != null
            ? removeRecurringSchedule.value
            : this.removeRecurringSchedule));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateUserRequest {
  const UpdateUserRequest({
    this.biography,
    this.defaultMembershipId,
    this.displayName,
    this.favoriteLocation,
    this.homeLocation,
    this.joinedSince,
    this.pushNotificationsEnabled,
    this.role,
    this.tripRegistrationEnabled,
    this.userName,
    this.workLocation,
  });

  factory UpdateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserRequestFromJson(json);

  static const toJsonFactory = _$UpdateUserRequestToJson;
  Map<String, dynamic> toJson() => _$UpdateUserRequestToJson(this);

  @JsonKey(name: 'biography')
  final String? biography;
  @JsonKey(name: 'defaultMembershipId')
  final String? defaultMembershipId;
  @JsonKey(name: 'displayName')
  final String? displayName;
  @JsonKey(name: 'favoriteLocation')
  final GpsLocation? favoriteLocation;
  @JsonKey(name: 'homeLocation')
  final GpsLocation? homeLocation;
  @JsonKey(name: 'joinedSince')
  final DateTime? joinedSince;
  @JsonKey(name: 'pushNotificationsEnabled')
  final bool? pushNotificationsEnabled;
  @JsonKey(
    name: 'role',
    toJson: updateUserRequestRoleNullableToJson,
    fromJson: updateUserRequestRoleNullableFromJson,
  )
  final enums.UpdateUserRequestRole? role;
  @JsonKey(name: 'tripRegistrationEnabled')
  final bool? tripRegistrationEnabled;
  @JsonKey(name: 'userName')
  final String? userName;
  @JsonKey(name: 'workLocation')
  final GpsLocation? workLocation;
  static const fromJsonFactory = _$UpdateUserRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UpdateUserRequest &&
            (identical(other.biography, biography) ||
                const DeepCollectionEquality()
                    .equals(other.biography, biography)) &&
            (identical(other.defaultMembershipId, defaultMembershipId) ||
                const DeepCollectionEquality()
                    .equals(other.defaultMembershipId, defaultMembershipId)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.favoriteLocation, favoriteLocation) ||
                const DeepCollectionEquality()
                    .equals(other.favoriteLocation, favoriteLocation)) &&
            (identical(other.homeLocation, homeLocation) ||
                const DeepCollectionEquality()
                    .equals(other.homeLocation, homeLocation)) &&
            (identical(other.joinedSince, joinedSince) ||
                const DeepCollectionEquality()
                    .equals(other.joinedSince, joinedSince)) &&
            (identical(
                    other.pushNotificationsEnabled, pushNotificationsEnabled) ||
                const DeepCollectionEquality().equals(
                    other.pushNotificationsEnabled,
                    pushNotificationsEnabled)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(
                    other.tripRegistrationEnabled, tripRegistrationEnabled) ||
                const DeepCollectionEquality().equals(
                    other.tripRegistrationEnabled, tripRegistrationEnabled)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.workLocation, workLocation) ||
                const DeepCollectionEquality()
                    .equals(other.workLocation, workLocation)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(biography) ^
      const DeepCollectionEquality().hash(defaultMembershipId) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(favoriteLocation) ^
      const DeepCollectionEquality().hash(homeLocation) ^
      const DeepCollectionEquality().hash(joinedSince) ^
      const DeepCollectionEquality().hash(pushNotificationsEnabled) ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(tripRegistrationEnabled) ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(workLocation) ^
      runtimeType.hashCode;
}

extension $UpdateUserRequestExtension on UpdateUserRequest {
  UpdateUserRequest copyWith(
      {String? biography,
      String? defaultMembershipId,
      String? displayName,
      GpsLocation? favoriteLocation,
      GpsLocation? homeLocation,
      DateTime? joinedSince,
      bool? pushNotificationsEnabled,
      enums.UpdateUserRequestRole? role,
      bool? tripRegistrationEnabled,
      String? userName,
      GpsLocation? workLocation}) {
    return UpdateUserRequest(
        biography: biography ?? this.biography,
        defaultMembershipId: defaultMembershipId ?? this.defaultMembershipId,
        displayName: displayName ?? this.displayName,
        favoriteLocation: favoriteLocation ?? this.favoriteLocation,
        homeLocation: homeLocation ?? this.homeLocation,
        joinedSince: joinedSince ?? this.joinedSince,
        pushNotificationsEnabled:
            pushNotificationsEnabled ?? this.pushNotificationsEnabled,
        role: role ?? this.role,
        tripRegistrationEnabled:
            tripRegistrationEnabled ?? this.tripRegistrationEnabled,
        userName: userName ?? this.userName,
        workLocation: workLocation ?? this.workLocation);
  }

  UpdateUserRequest copyWithWrapped(
      {Wrapped<String?>? biography,
      Wrapped<String?>? defaultMembershipId,
      Wrapped<String?>? displayName,
      Wrapped<GpsLocation?>? favoriteLocation,
      Wrapped<GpsLocation?>? homeLocation,
      Wrapped<DateTime?>? joinedSince,
      Wrapped<bool?>? pushNotificationsEnabled,
      Wrapped<enums.UpdateUserRequestRole?>? role,
      Wrapped<bool?>? tripRegistrationEnabled,
      Wrapped<String?>? userName,
      Wrapped<GpsLocation?>? workLocation}) {
    return UpdateUserRequest(
        biography: (biography != null ? biography.value : this.biography),
        defaultMembershipId: (defaultMembershipId != null
            ? defaultMembershipId.value
            : this.defaultMembershipId),
        displayName:
            (displayName != null ? displayName.value : this.displayName),
        favoriteLocation: (favoriteLocation != null
            ? favoriteLocation.value
            : this.favoriteLocation),
        homeLocation:
            (homeLocation != null ? homeLocation.value : this.homeLocation),
        joinedSince:
            (joinedSince != null ? joinedSince.value : this.joinedSince),
        pushNotificationsEnabled: (pushNotificationsEnabled != null
            ? pushNotificationsEnabled.value
            : this.pushNotificationsEnabled),
        role: (role != null ? role.value : this.role),
        tripRegistrationEnabled: (tripRegistrationEnabled != null
            ? tripRegistrationEnabled.value
            : this.tripRegistrationEnabled),
        userName: (userName != null ? userName.value : this.userName),
        workLocation:
            (workLocation != null ? workLocation.value : this.workLocation));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateVehicleRequest {
  const UpdateVehicleRequest({
    this.addVehicleLocationRequest,
    this.approvalType,
    this.clientId,
    this.description,
    this.electricRange,
    this.equipmentIds,
    this.expectedInFleetDate,
    this.expectedOutOfFleetDate,
    this.imageUrl,
    this.intentIds,
    this.lastPosition,
    this.lastPositionTimestamp,
    this.licensePlate,
    this.name,
    this.seats,
    this.typeId,
    this.vehicleId,
    this.vehicleInfo,
    this.vehicleInfoPreBooking,
    this.vehicleTypeId,
  });

  factory UpdateVehicleRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateVehicleRequestFromJson(json);

  static const toJsonFactory = _$UpdateVehicleRequestToJson;
  Map<String, dynamic> toJson() => _$UpdateVehicleRequestToJson(this);

  @JsonKey(name: 'addVehicleLocationRequest')
  final AddVehicleLocationRequest? addVehicleLocationRequest;
  @JsonKey(
    name: 'approvalType',
    toJson: updateVehicleRequestApprovalTypeNullableToJson,
    fromJson: updateVehicleRequestApprovalTypeNullableFromJson,
  )
  final enums.UpdateVehicleRequestApprovalType? approvalType;
  @JsonKey(name: 'clientId')
  final String? clientId;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'electricRange')
  final int? electricRange;
  @JsonKey(name: 'equipmentIds', defaultValue: <String>[])
  final List<String>? equipmentIds;
  @JsonKey(name: 'expectedInFleetDate')
  final DateTime? expectedInFleetDate;
  @JsonKey(name: 'expectedOutOfFleetDate')
  final DateTime? expectedOutOfFleetDate;
  @JsonKey(name: 'imageUrl')
  final String? imageUrl;
  @JsonKey(name: 'intentIds', defaultValue: <String>[])
  final List<String>? intentIds;
  @JsonKey(name: 'lastPosition')
  final GpsLocation? lastPosition;
  @JsonKey(name: 'lastPositionTimestamp')
  final DateTime? lastPositionTimestamp;
  @JsonKey(name: 'licensePlate')
  final String? licensePlate;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'seats')
  final int? seats;
  @JsonKey(name: 'typeId')
  final String? typeId;
  @JsonKey(name: 'vehicleId')
  final String? vehicleId;
  @JsonKey(name: 'vehicleInfo')
  final String? vehicleInfo;
  @JsonKey(name: 'vehicleInfoPreBooking')
  final String? vehicleInfoPreBooking;
  @JsonKey(name: 'vehicleTypeId')
  final String? vehicleTypeId;
  static const fromJsonFactory = _$UpdateVehicleRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UpdateVehicleRequest &&
            (identical(other.addVehicleLocationRequest, addVehicleLocationRequest) ||
                const DeepCollectionEquality().equals(
                    other.addVehicleLocationRequest,
                    addVehicleLocationRequest)) &&
            (identical(other.approvalType, approvalType) ||
                const DeepCollectionEquality()
                    .equals(other.approvalType, approvalType)) &&
            (identical(other.clientId, clientId) ||
                const DeepCollectionEquality()
                    .equals(other.clientId, clientId)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.electricRange, electricRange) ||
                const DeepCollectionEquality()
                    .equals(other.electricRange, electricRange)) &&
            (identical(other.equipmentIds, equipmentIds) ||
                const DeepCollectionEquality()
                    .equals(other.equipmentIds, equipmentIds)) &&
            (identical(other.expectedInFleetDate, expectedInFleetDate) ||
                const DeepCollectionEquality()
                    .equals(other.expectedInFleetDate, expectedInFleetDate)) &&
            (identical(other.expectedOutOfFleetDate, expectedOutOfFleetDate) ||
                const DeepCollectionEquality().equals(
                    other.expectedOutOfFleetDate, expectedOutOfFleetDate)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.intentIds, intentIds) ||
                const DeepCollectionEquality()
                    .equals(other.intentIds, intentIds)) &&
            (identical(other.lastPosition, lastPosition) ||
                const DeepCollectionEquality()
                    .equals(other.lastPosition, lastPosition)) &&
            (identical(other.lastPositionTimestamp, lastPositionTimestamp) ||
                const DeepCollectionEquality().equals(
                    other.lastPositionTimestamp, lastPositionTimestamp)) &&
            (identical(other.licensePlate, licensePlate) ||
                const DeepCollectionEquality()
                    .equals(other.licensePlate, licensePlate)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.seats, seats) ||
                const DeepCollectionEquality().equals(other.seats, seats)) &&
            (identical(other.typeId, typeId) ||
                const DeepCollectionEquality().equals(other.typeId, typeId)) &&
            (identical(other.vehicleId, vehicleId) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleId, vehicleId)) &&
            (identical(other.vehicleInfo, vehicleInfo) ||
                const DeepCollectionEquality().equals(other.vehicleInfo, vehicleInfo)) &&
            (identical(other.vehicleInfoPreBooking, vehicleInfoPreBooking) || const DeepCollectionEquality().equals(other.vehicleInfoPreBooking, vehicleInfoPreBooking)) &&
            (identical(other.vehicleTypeId, vehicleTypeId) || const DeepCollectionEquality().equals(other.vehicleTypeId, vehicleTypeId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(addVehicleLocationRequest) ^
      const DeepCollectionEquality().hash(approvalType) ^
      const DeepCollectionEquality().hash(clientId) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(electricRange) ^
      const DeepCollectionEquality().hash(equipmentIds) ^
      const DeepCollectionEquality().hash(expectedInFleetDate) ^
      const DeepCollectionEquality().hash(expectedOutOfFleetDate) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(intentIds) ^
      const DeepCollectionEquality().hash(lastPosition) ^
      const DeepCollectionEquality().hash(lastPositionTimestamp) ^
      const DeepCollectionEquality().hash(licensePlate) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(seats) ^
      const DeepCollectionEquality().hash(typeId) ^
      const DeepCollectionEquality().hash(vehicleId) ^
      const DeepCollectionEquality().hash(vehicleInfo) ^
      const DeepCollectionEquality().hash(vehicleInfoPreBooking) ^
      const DeepCollectionEquality().hash(vehicleTypeId) ^
      runtimeType.hashCode;
}

extension $UpdateVehicleRequestExtension on UpdateVehicleRequest {
  UpdateVehicleRequest copyWith(
      {AddVehicleLocationRequest? addVehicleLocationRequest,
      enums.UpdateVehicleRequestApprovalType? approvalType,
      String? clientId,
      String? description,
      int? electricRange,
      List<String>? equipmentIds,
      DateTime? expectedInFleetDate,
      DateTime? expectedOutOfFleetDate,
      String? imageUrl,
      List<String>? intentIds,
      GpsLocation? lastPosition,
      DateTime? lastPositionTimestamp,
      String? licensePlate,
      String? name,
      int? seats,
      String? typeId,
      String? vehicleId,
      String? vehicleInfo,
      String? vehicleInfoPreBooking,
      String? vehicleTypeId}) {
    return UpdateVehicleRequest(
        addVehicleLocationRequest:
            addVehicleLocationRequest ?? this.addVehicleLocationRequest,
        approvalType: approvalType ?? this.approvalType,
        clientId: clientId ?? this.clientId,
        description: description ?? this.description,
        electricRange: electricRange ?? this.electricRange,
        equipmentIds: equipmentIds ?? this.equipmentIds,
        expectedInFleetDate: expectedInFleetDate ?? this.expectedInFleetDate,
        expectedOutOfFleetDate:
            expectedOutOfFleetDate ?? this.expectedOutOfFleetDate,
        imageUrl: imageUrl ?? this.imageUrl,
        intentIds: intentIds ?? this.intentIds,
        lastPosition: lastPosition ?? this.lastPosition,
        lastPositionTimestamp:
            lastPositionTimestamp ?? this.lastPositionTimestamp,
        licensePlate: licensePlate ?? this.licensePlate,
        name: name ?? this.name,
        seats: seats ?? this.seats,
        typeId: typeId ?? this.typeId,
        vehicleId: vehicleId ?? this.vehicleId,
        vehicleInfo: vehicleInfo ?? this.vehicleInfo,
        vehicleInfoPreBooking:
            vehicleInfoPreBooking ?? this.vehicleInfoPreBooking,
        vehicleTypeId: vehicleTypeId ?? this.vehicleTypeId);
  }

  UpdateVehicleRequest copyWithWrapped(
      {Wrapped<AddVehicleLocationRequest?>? addVehicleLocationRequest,
      Wrapped<enums.UpdateVehicleRequestApprovalType?>? approvalType,
      Wrapped<String?>? clientId,
      Wrapped<String?>? description,
      Wrapped<int?>? electricRange,
      Wrapped<List<String>?>? equipmentIds,
      Wrapped<DateTime?>? expectedInFleetDate,
      Wrapped<DateTime?>? expectedOutOfFleetDate,
      Wrapped<String?>? imageUrl,
      Wrapped<List<String>?>? intentIds,
      Wrapped<GpsLocation?>? lastPosition,
      Wrapped<DateTime?>? lastPositionTimestamp,
      Wrapped<String?>? licensePlate,
      Wrapped<String?>? name,
      Wrapped<int?>? seats,
      Wrapped<String?>? typeId,
      Wrapped<String?>? vehicleId,
      Wrapped<String?>? vehicleInfo,
      Wrapped<String?>? vehicleInfoPreBooking,
      Wrapped<String?>? vehicleTypeId}) {
    return UpdateVehicleRequest(
        addVehicleLocationRequest: (addVehicleLocationRequest != null
            ? addVehicleLocationRequest.value
            : this.addVehicleLocationRequest),
        approvalType:
            (approvalType != null ? approvalType.value : this.approvalType),
        clientId: (clientId != null ? clientId.value : this.clientId),
        description:
            (description != null ? description.value : this.description),
        electricRange:
            (electricRange != null ? electricRange.value : this.electricRange),
        equipmentIds:
            (equipmentIds != null ? equipmentIds.value : this.equipmentIds),
        expectedInFleetDate: (expectedInFleetDate != null
            ? expectedInFleetDate.value
            : this.expectedInFleetDate),
        expectedOutOfFleetDate: (expectedOutOfFleetDate != null
            ? expectedOutOfFleetDate.value
            : this.expectedOutOfFleetDate),
        imageUrl: (imageUrl != null ? imageUrl.value : this.imageUrl),
        intentIds: (intentIds != null ? intentIds.value : this.intentIds),
        lastPosition:
            (lastPosition != null ? lastPosition.value : this.lastPosition),
        lastPositionTimestamp: (lastPositionTimestamp != null
            ? lastPositionTimestamp.value
            : this.lastPositionTimestamp),
        licensePlate:
            (licensePlate != null ? licensePlate.value : this.licensePlate),
        name: (name != null ? name.value : this.name),
        seats: (seats != null ? seats.value : this.seats),
        typeId: (typeId != null ? typeId.value : this.typeId),
        vehicleId: (vehicleId != null ? vehicleId.value : this.vehicleId),
        vehicleInfo:
            (vehicleInfo != null ? vehicleInfo.value : this.vehicleInfo),
        vehicleInfoPreBooking: (vehicleInfoPreBooking != null
            ? vehicleInfoPreBooking.value
            : this.vehicleInfoPreBooking),
        vehicleTypeId:
            (vehicleTypeId != null ? vehicleTypeId.value : this.vehicleTypeId));
  }
}

@JsonSerializable(explicitToJson: true)
class User {
  const User({
    this.boxNumber,
    this.city,
    this.dateCurrentLicense,
    this.dateLicenseUntil,
    this.dateOfBirth,
    this.documentLinks,
    this.email,
    this.firstName,
    this.houseNumber,
    this.id,
    this.lastName,
    this.licenseNum,
    this.licenseType,
    this.nationality,
    this.nrOfAccidents,
    this.phoneNumber,
    this.postalCode,
    this.sofBattRemoteId,
    this.streetname,
    this.subscriptions,
    this.verifiedCellPhoneNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static const toJsonFactory = _$UserToJson;
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @JsonKey(name: 'boxNumber')
  final String? boxNumber;
  @JsonKey(name: 'city')
  final String? city;
  @JsonKey(name: 'dateCurrentLicense')
  final String? dateCurrentLicense;
  @JsonKey(name: 'dateLicenseUntil')
  final String? dateLicenseUntil;
  @JsonKey(name: 'dateOfBirth')
  final String? dateOfBirth;
  @JsonKey(name: 'documentLinks', defaultValue: <String>[])
  final List<String>? documentLinks;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'firstName')
  final String? firstName;
  @JsonKey(name: 'houseNumber')
  final String? houseNumber;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'lastName')
  final String? lastName;
  @JsonKey(name: 'licenseNum')
  final String? licenseNum;
  @JsonKey(name: 'licenseType')
  final int? licenseType;
  @JsonKey(name: 'nationality')
  final String? nationality;
  @JsonKey(name: 'nrOfAccidents')
  final int? nrOfAccidents;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'postalCode')
  final String? postalCode;
  @JsonKey(name: 'sofBattRemoteId')
  final String? sofBattRemoteId;
  @JsonKey(name: 'streetname')
  final String? streetname;
  @JsonKey(name: 'subscriptions', defaultValue: <Subscription>[])
  final List<Subscription>? subscriptions;
  @JsonKey(name: 'verifiedCellPhoneNumber')
  final bool? verifiedCellPhoneNumber;
  static const fromJsonFactory = _$UserFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is User &&
            (identical(other.boxNumber, boxNumber) ||
                const DeepCollectionEquality()
                    .equals(other.boxNumber, boxNumber)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.dateCurrentLicense, dateCurrentLicense) ||
                const DeepCollectionEquality()
                    .equals(other.dateCurrentLicense, dateCurrentLicense)) &&
            (identical(other.dateLicenseUntil, dateLicenseUntil) ||
                const DeepCollectionEquality()
                    .equals(other.dateLicenseUntil, dateLicenseUntil)) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                const DeepCollectionEquality()
                    .equals(other.dateOfBirth, dateOfBirth)) &&
            (identical(other.documentLinks, documentLinks) ||
                const DeepCollectionEquality()
                    .equals(other.documentLinks, documentLinks)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.houseNumber, houseNumber) ||
                const DeepCollectionEquality()
                    .equals(other.houseNumber, houseNumber)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.licenseNum, licenseNum) ||
                const DeepCollectionEquality()
                    .equals(other.licenseNum, licenseNum)) &&
            (identical(other.licenseType, licenseType) ||
                const DeepCollectionEquality()
                    .equals(other.licenseType, licenseType)) &&
            (identical(other.nationality, nationality) ||
                const DeepCollectionEquality()
                    .equals(other.nationality, nationality)) &&
            (identical(other.nrOfAccidents, nrOfAccidents) ||
                const DeepCollectionEquality()
                    .equals(other.nrOfAccidents, nrOfAccidents)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.postalCode, postalCode) ||
                const DeepCollectionEquality()
                    .equals(other.postalCode, postalCode)) &&
            (identical(other.sofBattRemoteId, sofBattRemoteId) ||
                const DeepCollectionEquality()
                    .equals(other.sofBattRemoteId, sofBattRemoteId)) &&
            (identical(other.streetname, streetname) ||
                const DeepCollectionEquality()
                    .equals(other.streetname, streetname)) &&
            (identical(other.subscriptions, subscriptions) ||
                const DeepCollectionEquality()
                    .equals(other.subscriptions, subscriptions)) &&
            (identical(
                    other.verifiedCellPhoneNumber, verifiedCellPhoneNumber) ||
                const DeepCollectionEquality().equals(
                    other.verifiedCellPhoneNumber, verifiedCellPhoneNumber)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(boxNumber) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(dateCurrentLicense) ^
      const DeepCollectionEquality().hash(dateLicenseUntil) ^
      const DeepCollectionEquality().hash(dateOfBirth) ^
      const DeepCollectionEquality().hash(documentLinks) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(houseNumber) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(licenseNum) ^
      const DeepCollectionEquality().hash(licenseType) ^
      const DeepCollectionEquality().hash(nationality) ^
      const DeepCollectionEquality().hash(nrOfAccidents) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(postalCode) ^
      const DeepCollectionEquality().hash(sofBattRemoteId) ^
      const DeepCollectionEquality().hash(streetname) ^
      const DeepCollectionEquality().hash(subscriptions) ^
      const DeepCollectionEquality().hash(verifiedCellPhoneNumber) ^
      runtimeType.hashCode;
}

extension $UserExtension on User {
  User copyWith(
      {String? boxNumber,
      String? city,
      String? dateCurrentLicense,
      String? dateLicenseUntil,
      String? dateOfBirth,
      List<String>? documentLinks,
      String? email,
      String? firstName,
      String? houseNumber,
      int? id,
      String? lastName,
      String? licenseNum,
      int? licenseType,
      String? nationality,
      int? nrOfAccidents,
      String? phoneNumber,
      String? postalCode,
      String? sofBattRemoteId,
      String? streetname,
      List<Subscription>? subscriptions,
      bool? verifiedCellPhoneNumber}) {
    return User(
        boxNumber: boxNumber ?? this.boxNumber,
        city: city ?? this.city,
        dateCurrentLicense: dateCurrentLicense ?? this.dateCurrentLicense,
        dateLicenseUntil: dateLicenseUntil ?? this.dateLicenseUntil,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        documentLinks: documentLinks ?? this.documentLinks,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        houseNumber: houseNumber ?? this.houseNumber,
        id: id ?? this.id,
        lastName: lastName ?? this.lastName,
        licenseNum: licenseNum ?? this.licenseNum,
        licenseType: licenseType ?? this.licenseType,
        nationality: nationality ?? this.nationality,
        nrOfAccidents: nrOfAccidents ?? this.nrOfAccidents,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        postalCode: postalCode ?? this.postalCode,
        sofBattRemoteId: sofBattRemoteId ?? this.sofBattRemoteId,
        streetname: streetname ?? this.streetname,
        subscriptions: subscriptions ?? this.subscriptions,
        verifiedCellPhoneNumber:
            verifiedCellPhoneNumber ?? this.verifiedCellPhoneNumber);
  }

  User copyWithWrapped(
      {Wrapped<String?>? boxNumber,
      Wrapped<String?>? city,
      Wrapped<String?>? dateCurrentLicense,
      Wrapped<String?>? dateLicenseUntil,
      Wrapped<String?>? dateOfBirth,
      Wrapped<List<String>?>? documentLinks,
      Wrapped<String?>? email,
      Wrapped<String?>? firstName,
      Wrapped<String?>? houseNumber,
      Wrapped<int?>? id,
      Wrapped<String?>? lastName,
      Wrapped<String?>? licenseNum,
      Wrapped<int?>? licenseType,
      Wrapped<String?>? nationality,
      Wrapped<int?>? nrOfAccidents,
      Wrapped<String?>? phoneNumber,
      Wrapped<String?>? postalCode,
      Wrapped<String?>? sofBattRemoteId,
      Wrapped<String?>? streetname,
      Wrapped<List<Subscription>?>? subscriptions,
      Wrapped<bool?>? verifiedCellPhoneNumber}) {
    return User(
        boxNumber: (boxNumber != null ? boxNumber.value : this.boxNumber),
        city: (city != null ? city.value : this.city),
        dateCurrentLicense: (dateCurrentLicense != null
            ? dateCurrentLicense.value
            : this.dateCurrentLicense),
        dateLicenseUntil: (dateLicenseUntil != null
            ? dateLicenseUntil.value
            : this.dateLicenseUntil),
        dateOfBirth:
            (dateOfBirth != null ? dateOfBirth.value : this.dateOfBirth),
        documentLinks:
            (documentLinks != null ? documentLinks.value : this.documentLinks),
        email: (email != null ? email.value : this.email),
        firstName: (firstName != null ? firstName.value : this.firstName),
        houseNumber:
            (houseNumber != null ? houseNumber.value : this.houseNumber),
        id: (id != null ? id.value : this.id),
        lastName: (lastName != null ? lastName.value : this.lastName),
        licenseNum: (licenseNum != null ? licenseNum.value : this.licenseNum),
        licenseType:
            (licenseType != null ? licenseType.value : this.licenseType),
        nationality:
            (nationality != null ? nationality.value : this.nationality),
        nrOfAccidents:
            (nrOfAccidents != null ? nrOfAccidents.value : this.nrOfAccidents),
        phoneNumber:
            (phoneNumber != null ? phoneNumber.value : this.phoneNumber),
        postalCode: (postalCode != null ? postalCode.value : this.postalCode),
        sofBattRemoteId: (sofBattRemoteId != null
            ? sofBattRemoteId.value
            : this.sofBattRemoteId),
        streetname: (streetname != null ? streetname.value : this.streetname),
        subscriptions:
            (subscriptions != null ? subscriptions.value : this.subscriptions),
        verifiedCellPhoneNumber: (verifiedCellPhoneNumber != null
            ? verifiedCellPhoneNumber.value
            : this.verifiedCellPhoneNumber));
  }
}

@JsonSerializable(explicitToJson: true)
class UserPage {
  const UserPage({
    this.users,
  });

  factory UserPage.fromJson(Map<String, dynamic> json) =>
      _$UserPageFromJson(json);

  static const toJsonFactory = _$UserPageToJson;
  Map<String, dynamic> toJson() => _$UserPageToJson(this);

  @JsonKey(name: 'users', defaultValue: <User>[])
  final List<User>? users;
  static const fromJsonFactory = _$UserPageFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UserPage &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(users) ^ runtimeType.hashCode;
}

extension $UserPageExtension on UserPage {
  UserPage copyWith({List<User>? users}) {
    return UserPage(users: users ?? this.users);
  }

  UserPage copyWithWrapped({Wrapped<List<User>?>? users}) {
    return UserPage(users: (users != null ? users.value : this.users));
  }
}

@JsonSerializable(explicitToJson: true)
class Vehicle {
  const Vehicle({
    this.distance,
    this.electricRange,
    this.fanPrice,
    this.favorite,
    this.funPrice,
    this.homePosition,
    this.id,
    this.imageUrl,
    this.lastPosition,
    this.lastPositionTimestamp,
    this.licensePlate,
    this.name,
    this.operationalStatus,
    this.vehicleBodyStyle,
    this.vehicleBrand,
    this.vehicleModel,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);

  static const toJsonFactory = _$VehicleToJson;
  Map<String, dynamic> toJson() => _$VehicleToJson(this);

  @JsonKey(name: 'distance')
  final double? distance;
  @JsonKey(name: 'electricRange')
  final int? electricRange;
  @JsonKey(name: 'fanPrice')
  final BookingPrice? fanPrice;
  @JsonKey(name: 'favorite')
  final bool? favorite;
  @JsonKey(name: 'funPrice')
  final BookingPrice? funPrice;
  @JsonKey(name: 'homePosition')
  final GpsLocation? homePosition;
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'imageUrl')
  final String? imageUrl;
  @JsonKey(name: 'lastPosition')
  final GpsLocation? lastPosition;
  @JsonKey(name: 'lastPositionTimestamp')
  final DateTime? lastPositionTimestamp;
  @JsonKey(name: 'licensePlate')
  final String? licensePlate;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(
    name: 'operationalStatus',
    toJson: vehicleOperationalStatusNullableToJson,
    fromJson: vehicleOperationalStatusNullableFromJson,
  )
  final enums.VehicleOperationalStatus? operationalStatus;
  @JsonKey(name: 'vehicleBodyStyle')
  final BodyStyle? vehicleBodyStyle;
  @JsonKey(name: 'vehicleBrand')
  final VehicleBrand? vehicleBrand;
  @JsonKey(name: 'vehicleModel')
  final VehicleModel? vehicleModel;
  static const fromJsonFactory = _$VehicleFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Vehicle &&
            (identical(other.distance, distance) ||
                const DeepCollectionEquality()
                    .equals(other.distance, distance)) &&
            (identical(other.electricRange, electricRange) ||
                const DeepCollectionEquality()
                    .equals(other.electricRange, electricRange)) &&
            (identical(other.fanPrice, fanPrice) ||
                const DeepCollectionEquality()
                    .equals(other.fanPrice, fanPrice)) &&
            (identical(other.favorite, favorite) ||
                const DeepCollectionEquality()
                    .equals(other.favorite, favorite)) &&
            (identical(other.funPrice, funPrice) ||
                const DeepCollectionEquality()
                    .equals(other.funPrice, funPrice)) &&
            (identical(other.homePosition, homePosition) ||
                const DeepCollectionEquality()
                    .equals(other.homePosition, homePosition)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.lastPosition, lastPosition) ||
                const DeepCollectionEquality()
                    .equals(other.lastPosition, lastPosition)) &&
            (identical(other.lastPositionTimestamp, lastPositionTimestamp) ||
                const DeepCollectionEquality().equals(
                    other.lastPositionTimestamp, lastPositionTimestamp)) &&
            (identical(other.licensePlate, licensePlate) ||
                const DeepCollectionEquality()
                    .equals(other.licensePlate, licensePlate)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.operationalStatus, operationalStatus) ||
                const DeepCollectionEquality()
                    .equals(other.operationalStatus, operationalStatus)) &&
            (identical(other.vehicleBodyStyle, vehicleBodyStyle) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleBodyStyle, vehicleBodyStyle)) &&
            (identical(other.vehicleBrand, vehicleBrand) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleBrand, vehicleBrand)) &&
            (identical(other.vehicleModel, vehicleModel) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleModel, vehicleModel)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(distance) ^
      const DeepCollectionEquality().hash(electricRange) ^
      const DeepCollectionEquality().hash(fanPrice) ^
      const DeepCollectionEquality().hash(favorite) ^
      const DeepCollectionEquality().hash(funPrice) ^
      const DeepCollectionEquality().hash(homePosition) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(lastPosition) ^
      const DeepCollectionEquality().hash(lastPositionTimestamp) ^
      const DeepCollectionEquality().hash(licensePlate) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(operationalStatus) ^
      const DeepCollectionEquality().hash(vehicleBodyStyle) ^
      const DeepCollectionEquality().hash(vehicleBrand) ^
      const DeepCollectionEquality().hash(vehicleModel) ^
      runtimeType.hashCode;
}

extension $VehicleExtension on Vehicle {
  Vehicle copyWith(
      {double? distance,
      int? electricRange,
      BookingPrice? fanPrice,
      bool? favorite,
      BookingPrice? funPrice,
      GpsLocation? homePosition,
      String? id,
      String? imageUrl,
      GpsLocation? lastPosition,
      DateTime? lastPositionTimestamp,
      String? licensePlate,
      String? name,
      enums.VehicleOperationalStatus? operationalStatus,
      BodyStyle? vehicleBodyStyle,
      VehicleBrand? vehicleBrand,
      VehicleModel? vehicleModel}) {
    return Vehicle(
        distance: distance ?? this.distance,
        electricRange: electricRange ?? this.electricRange,
        fanPrice: fanPrice ?? this.fanPrice,
        favorite: favorite ?? this.favorite,
        funPrice: funPrice ?? this.funPrice,
        homePosition: homePosition ?? this.homePosition,
        id: id ?? this.id,
        imageUrl: imageUrl ?? this.imageUrl,
        lastPosition: lastPosition ?? this.lastPosition,
        lastPositionTimestamp:
            lastPositionTimestamp ?? this.lastPositionTimestamp,
        licensePlate: licensePlate ?? this.licensePlate,
        name: name ?? this.name,
        operationalStatus: operationalStatus ?? this.operationalStatus,
        vehicleBodyStyle: vehicleBodyStyle ?? this.vehicleBodyStyle,
        vehicleBrand: vehicleBrand ?? this.vehicleBrand,
        vehicleModel: vehicleModel ?? this.vehicleModel);
  }

  Vehicle copyWithWrapped(
      {Wrapped<double?>? distance,
      Wrapped<int?>? electricRange,
      Wrapped<BookingPrice?>? fanPrice,
      Wrapped<bool?>? favorite,
      Wrapped<BookingPrice?>? funPrice,
      Wrapped<GpsLocation?>? homePosition,
      Wrapped<String?>? id,
      Wrapped<String?>? imageUrl,
      Wrapped<GpsLocation?>? lastPosition,
      Wrapped<DateTime?>? lastPositionTimestamp,
      Wrapped<String?>? licensePlate,
      Wrapped<String?>? name,
      Wrapped<enums.VehicleOperationalStatus?>? operationalStatus,
      Wrapped<BodyStyle?>? vehicleBodyStyle,
      Wrapped<VehicleBrand?>? vehicleBrand,
      Wrapped<VehicleModel?>? vehicleModel}) {
    return Vehicle(
        distance: (distance != null ? distance.value : this.distance),
        electricRange:
            (electricRange != null ? electricRange.value : this.electricRange),
        fanPrice: (fanPrice != null ? fanPrice.value : this.fanPrice),
        favorite: (favorite != null ? favorite.value : this.favorite),
        funPrice: (funPrice != null ? funPrice.value : this.funPrice),
        homePosition:
            (homePosition != null ? homePosition.value : this.homePosition),
        id: (id != null ? id.value : this.id),
        imageUrl: (imageUrl != null ? imageUrl.value : this.imageUrl),
        lastPosition:
            (lastPosition != null ? lastPosition.value : this.lastPosition),
        lastPositionTimestamp: (lastPositionTimestamp != null
            ? lastPositionTimestamp.value
            : this.lastPositionTimestamp),
        licensePlate:
            (licensePlate != null ? licensePlate.value : this.licensePlate),
        name: (name != null ? name.value : this.name),
        operationalStatus: (operationalStatus != null
            ? operationalStatus.value
            : this.operationalStatus),
        vehicleBodyStyle: (vehicleBodyStyle != null
            ? vehicleBodyStyle.value
            : this.vehicleBodyStyle),
        vehicleBrand:
            (vehicleBrand != null ? vehicleBrand.value : this.vehicleBrand),
        vehicleModel:
            (vehicleModel != null ? vehicleModel.value : this.vehicleModel));
  }
}

@JsonSerializable(explicitToJson: true)
class VehicleBaseLocation {
  const VehicleBaseLocation({
    this.adType,
    this.borough,
    this.homePosition,
    this.id,
    this.memo,
    this.name,
    this.status,
  });

  factory VehicleBaseLocation.fromJson(Map<String, dynamic> json) =>
      _$VehicleBaseLocationFromJson(json);

  static const toJsonFactory = _$VehicleBaseLocationToJson;
  Map<String, dynamic> toJson() => _$VehicleBaseLocationToJson(this);

  @JsonKey(name: 'adType')
  final String? adType;
  @JsonKey(name: 'borough')
  final String? borough;
  @JsonKey(name: 'homePosition')
  final GpsLocation? homePosition;
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'memo')
  final String? memo;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'status')
  final String? status;
  static const fromJsonFactory = _$VehicleBaseLocationFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is VehicleBaseLocation &&
            (identical(other.adType, adType) ||
                const DeepCollectionEquality().equals(other.adType, adType)) &&
            (identical(other.borough, borough) ||
                const DeepCollectionEquality()
                    .equals(other.borough, borough)) &&
            (identical(other.homePosition, homePosition) ||
                const DeepCollectionEquality()
                    .equals(other.homePosition, homePosition)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.memo, memo) ||
                const DeepCollectionEquality().equals(other.memo, memo)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(adType) ^
      const DeepCollectionEquality().hash(borough) ^
      const DeepCollectionEquality().hash(homePosition) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(memo) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(status) ^
      runtimeType.hashCode;
}

extension $VehicleBaseLocationExtension on VehicleBaseLocation {
  VehicleBaseLocation copyWith(
      {String? adType,
      String? borough,
      GpsLocation? homePosition,
      String? id,
      String? memo,
      String? name,
      String? status}) {
    return VehicleBaseLocation(
        adType: adType ?? this.adType,
        borough: borough ?? this.borough,
        homePosition: homePosition ?? this.homePosition,
        id: id ?? this.id,
        memo: memo ?? this.memo,
        name: name ?? this.name,
        status: status ?? this.status);
  }

  VehicleBaseLocation copyWithWrapped(
      {Wrapped<String?>? adType,
      Wrapped<String?>? borough,
      Wrapped<GpsLocation?>? homePosition,
      Wrapped<String?>? id,
      Wrapped<String?>? memo,
      Wrapped<String?>? name,
      Wrapped<String?>? status}) {
    return VehicleBaseLocation(
        adType: (adType != null ? adType.value : this.adType),
        borough: (borough != null ? borough.value : this.borough),
        homePosition:
            (homePosition != null ? homePosition.value : this.homePosition),
        id: (id != null ? id.value : this.id),
        memo: (memo != null ? memo.value : this.memo),
        name: (name != null ? name.value : this.name),
        status: (status != null ? status.value : this.status));
  }
}

@JsonSerializable(explicitToJson: true)
class VehicleBaseLocationPage {
  const VehicleBaseLocationPage({
    this.vehicleBaseLocations,
  });

  factory VehicleBaseLocationPage.fromJson(Map<String, dynamic> json) =>
      _$VehicleBaseLocationPageFromJson(json);

  static const toJsonFactory = _$VehicleBaseLocationPageToJson;
  Map<String, dynamic> toJson() => _$VehicleBaseLocationPageToJson(this);

  @JsonKey(name: 'vehicleBaseLocations', defaultValue: <VehicleBaseLocation>[])
  final List<VehicleBaseLocation>? vehicleBaseLocations;
  static const fromJsonFactory = _$VehicleBaseLocationPageFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is VehicleBaseLocationPage &&
            (identical(other.vehicleBaseLocations, vehicleBaseLocations) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleBaseLocations, vehicleBaseLocations)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(vehicleBaseLocations) ^
      runtimeType.hashCode;
}

extension $VehicleBaseLocationPageExtension on VehicleBaseLocationPage {
  VehicleBaseLocationPage copyWith(
      {List<VehicleBaseLocation>? vehicleBaseLocations}) {
    return VehicleBaseLocationPage(
        vehicleBaseLocations:
            vehicleBaseLocations ?? this.vehicleBaseLocations);
  }

  VehicleBaseLocationPage copyWithWrapped(
      {Wrapped<List<VehicleBaseLocation>?>? vehicleBaseLocations}) {
    return VehicleBaseLocationPage(
        vehicleBaseLocations: (vehicleBaseLocations != null
            ? vehicleBaseLocations.value
            : this.vehicleBaseLocations));
  }
}

@JsonSerializable(explicitToJson: true)
class VehicleBrand {
  const VehicleBrand({
    this.id,
    this.name,
  });

  factory VehicleBrand.fromJson(Map<String, dynamic> json) =>
      _$VehicleBrandFromJson(json);

  static const toJsonFactory = _$VehicleBrandToJson;
  Map<String, dynamic> toJson() => _$VehicleBrandToJson(this);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$VehicleBrandFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is VehicleBrand &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $VehicleBrandExtension on VehicleBrand {
  VehicleBrand copyWith({String? id, String? name}) {
    return VehicleBrand(id: id ?? this.id, name: name ?? this.name);
  }

  VehicleBrand copyWithWrapped({Wrapped<String?>? id, Wrapped<String?>? name}) {
    return VehicleBrand(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class VehicleBrandPage {
  const VehicleBrandPage({
    this.vehicleBrands,
  });

  factory VehicleBrandPage.fromJson(Map<String, dynamic> json) =>
      _$VehicleBrandPageFromJson(json);

  static const toJsonFactory = _$VehicleBrandPageToJson;
  Map<String, dynamic> toJson() => _$VehicleBrandPageToJson(this);

  @JsonKey(name: 'vehicleBrands', defaultValue: <VehicleBrand>[])
  final List<VehicleBrand>? vehicleBrands;
  static const fromJsonFactory = _$VehicleBrandPageFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is VehicleBrandPage &&
            (identical(other.vehicleBrands, vehicleBrands) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleBrands, vehicleBrands)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(vehicleBrands) ^ runtimeType.hashCode;
}

extension $VehicleBrandPageExtension on VehicleBrandPage {
  VehicleBrandPage copyWith({List<VehicleBrand>? vehicleBrands}) {
    return VehicleBrandPage(vehicleBrands: vehicleBrands ?? this.vehicleBrands);
  }

  VehicleBrandPage copyWithWrapped(
      {Wrapped<List<VehicleBrand>?>? vehicleBrands}) {
    return VehicleBrandPage(
        vehicleBrands:
            (vehicleBrands != null ? vehicleBrands.value : this.vehicleBrands));
  }
}

@JsonSerializable(explicitToJson: true)
class VehicleFilterCriteria {
  const VehicleFilterCriteria({
    this.bodyStyleIds,
    this.brandIds,
    this.licensePlate,
    this.minRange,
    this.modelIds,
    this.name,
  });

  factory VehicleFilterCriteria.fromJson(Map<String, dynamic> json) =>
      _$VehicleFilterCriteriaFromJson(json);

  static const toJsonFactory = _$VehicleFilterCriteriaToJson;
  Map<String, dynamic> toJson() => _$VehicleFilterCriteriaToJson(this);

  @JsonKey(name: 'bodyStyleIds', defaultValue: <String>[])
  final List<String>? bodyStyleIds;
  @JsonKey(name: 'brandIds', defaultValue: <String>[])
  final List<String>? brandIds;
  @JsonKey(name: 'licensePlate')
  final String? licensePlate;
  @JsonKey(name: 'minRange')
  final int? minRange;
  @JsonKey(name: 'modelIds', defaultValue: <String>[])
  final List<String>? modelIds;
  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$VehicleFilterCriteriaFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is VehicleFilterCriteria &&
            (identical(other.bodyStyleIds, bodyStyleIds) ||
                const DeepCollectionEquality()
                    .equals(other.bodyStyleIds, bodyStyleIds)) &&
            (identical(other.brandIds, brandIds) ||
                const DeepCollectionEquality()
                    .equals(other.brandIds, brandIds)) &&
            (identical(other.licensePlate, licensePlate) ||
                const DeepCollectionEquality()
                    .equals(other.licensePlate, licensePlate)) &&
            (identical(other.minRange, minRange) ||
                const DeepCollectionEquality()
                    .equals(other.minRange, minRange)) &&
            (identical(other.modelIds, modelIds) ||
                const DeepCollectionEquality()
                    .equals(other.modelIds, modelIds)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(bodyStyleIds) ^
      const DeepCollectionEquality().hash(brandIds) ^
      const DeepCollectionEquality().hash(licensePlate) ^
      const DeepCollectionEquality().hash(minRange) ^
      const DeepCollectionEquality().hash(modelIds) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $VehicleFilterCriteriaExtension on VehicleFilterCriteria {
  VehicleFilterCriteria copyWith(
      {List<String>? bodyStyleIds,
      List<String>? brandIds,
      String? licensePlate,
      int? minRange,
      List<String>? modelIds,
      String? name}) {
    return VehicleFilterCriteria(
        bodyStyleIds: bodyStyleIds ?? this.bodyStyleIds,
        brandIds: brandIds ?? this.brandIds,
        licensePlate: licensePlate ?? this.licensePlate,
        minRange: minRange ?? this.minRange,
        modelIds: modelIds ?? this.modelIds,
        name: name ?? this.name);
  }

  VehicleFilterCriteria copyWithWrapped(
      {Wrapped<List<String>?>? bodyStyleIds,
      Wrapped<List<String>?>? brandIds,
      Wrapped<String?>? licensePlate,
      Wrapped<int?>? minRange,
      Wrapped<List<String>?>? modelIds,
      Wrapped<String?>? name}) {
    return VehicleFilterCriteria(
        bodyStyleIds:
            (bodyStyleIds != null ? bodyStyleIds.value : this.bodyStyleIds),
        brandIds: (brandIds != null ? brandIds.value : this.brandIds),
        licensePlate:
            (licensePlate != null ? licensePlate.value : this.licensePlate),
        minRange: (minRange != null ? minRange.value : this.minRange),
        modelIds: (modelIds != null ? modelIds.value : this.modelIds),
        name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class VehicleFilterEnums {
  const VehicleFilterEnums({
    this.bodyStyles,
    this.brands,
    this.models,
  });

  factory VehicleFilterEnums.fromJson(Map<String, dynamic> json) =>
      _$VehicleFilterEnumsFromJson(json);

  static const toJsonFactory = _$VehicleFilterEnumsToJson;
  Map<String, dynamic> toJson() => _$VehicleFilterEnumsToJson(this);

  @JsonKey(name: 'bodyStyles', defaultValue: <BodyStyle>[])
  final List<BodyStyle>? bodyStyles;
  @JsonKey(name: 'brands', defaultValue: <VehicleBrand>[])
  final List<VehicleBrand>? brands;
  @JsonKey(name: 'models', defaultValue: <VehicleModel>[])
  final List<VehicleModel>? models;
  static const fromJsonFactory = _$VehicleFilterEnumsFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is VehicleFilterEnums &&
            (identical(other.bodyStyles, bodyStyles) ||
                const DeepCollectionEquality()
                    .equals(other.bodyStyles, bodyStyles)) &&
            (identical(other.brands, brands) ||
                const DeepCollectionEquality().equals(other.brands, brands)) &&
            (identical(other.models, models) ||
                const DeepCollectionEquality().equals(other.models, models)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(bodyStyles) ^
      const DeepCollectionEquality().hash(brands) ^
      const DeepCollectionEquality().hash(models) ^
      runtimeType.hashCode;
}

extension $VehicleFilterEnumsExtension on VehicleFilterEnums {
  VehicleFilterEnums copyWith(
      {List<BodyStyle>? bodyStyles,
      List<VehicleBrand>? brands,
      List<VehicleModel>? models}) {
    return VehicleFilterEnums(
        bodyStyles: bodyStyles ?? this.bodyStyles,
        brands: brands ?? this.brands,
        models: models ?? this.models);
  }

  VehicleFilterEnums copyWithWrapped(
      {Wrapped<List<BodyStyle>?>? bodyStyles,
      Wrapped<List<VehicleBrand>?>? brands,
      Wrapped<List<VehicleModel>?>? models}) {
    return VehicleFilterEnums(
        bodyStyles: (bodyStyles != null ? bodyStyles.value : this.bodyStyles),
        brands: (brands != null ? brands.value : this.brands),
        models: (models != null ? models.value : this.models));
  }
}

@JsonSerializable(explicitToJson: true)
class VehicleGroup {
  const VehicleGroup({
    this.id,
    this.name,
    this.vehicles,
  });

  factory VehicleGroup.fromJson(Map<String, dynamic> json) =>
      _$VehicleGroupFromJson(json);

  static const toJsonFactory = _$VehicleGroupToJson;
  Map<String, dynamic> toJson() => _$VehicleGroupToJson(this);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'vehicles', defaultValue: <Vehicle>[])
  final List<Vehicle>? vehicles;
  static const fromJsonFactory = _$VehicleGroupFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is VehicleGroup &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.vehicles, vehicles) ||
                const DeepCollectionEquality()
                    .equals(other.vehicles, vehicles)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(vehicles) ^
      runtimeType.hashCode;
}

extension $VehicleGroupExtension on VehicleGroup {
  VehicleGroup copyWith({String? id, String? name, List<Vehicle>? vehicles}) {
    return VehicleGroup(
        id: id ?? this.id,
        name: name ?? this.name,
        vehicles: vehicles ?? this.vehicles);
  }

  VehicleGroup copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? name,
      Wrapped<List<Vehicle>?>? vehicles}) {
    return VehicleGroup(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        vehicles: (vehicles != null ? vehicles.value : this.vehicles));
  }
}

@JsonSerializable(explicitToJson: true)
class VehicleGroupPage {
  const VehicleGroupPage({
    this.vehicleGroups,
  });

  factory VehicleGroupPage.fromJson(Map<String, dynamic> json) =>
      _$VehicleGroupPageFromJson(json);

  static const toJsonFactory = _$VehicleGroupPageToJson;
  Map<String, dynamic> toJson() => _$VehicleGroupPageToJson(this);

  @JsonKey(name: 'vehicleGroups', defaultValue: <VehicleGroup>[])
  final List<VehicleGroup>? vehicleGroups;
  static const fromJsonFactory = _$VehicleGroupPageFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is VehicleGroupPage &&
            (identical(other.vehicleGroups, vehicleGroups) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleGroups, vehicleGroups)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(vehicleGroups) ^ runtimeType.hashCode;
}

extension $VehicleGroupPageExtension on VehicleGroupPage {
  VehicleGroupPage copyWith({List<VehicleGroup>? vehicleGroups}) {
    return VehicleGroupPage(vehicleGroups: vehicleGroups ?? this.vehicleGroups);
  }

  VehicleGroupPage copyWithWrapped(
      {Wrapped<List<VehicleGroup>?>? vehicleGroups}) {
    return VehicleGroupPage(
        vehicleGroups:
            (vehicleGroups != null ? vehicleGroups.value : this.vehicleGroups));
  }
}

@JsonSerializable(explicitToJson: true)
class VehicleModel {
  const VehicleModel({
    this.bodyStyle,
    this.brandId,
    this.id,
    this.name,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelFromJson(json);

  static const toJsonFactory = _$VehicleModelToJson;
  Map<String, dynamic> toJson() => _$VehicleModelToJson(this);

  @JsonKey(name: 'bodyStyle')
  final BodyStyle? bodyStyle;
  @JsonKey(name: 'brandId')
  final String? brandId;
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$VehicleModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is VehicleModel &&
            (identical(other.bodyStyle, bodyStyle) ||
                const DeepCollectionEquality()
                    .equals(other.bodyStyle, bodyStyle)) &&
            (identical(other.brandId, brandId) ||
                const DeepCollectionEquality()
                    .equals(other.brandId, brandId)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(bodyStyle) ^
      const DeepCollectionEquality().hash(brandId) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $VehicleModelExtension on VehicleModel {
  VehicleModel copyWith(
      {BodyStyle? bodyStyle, String? brandId, String? id, String? name}) {
    return VehicleModel(
        bodyStyle: bodyStyle ?? this.bodyStyle,
        brandId: brandId ?? this.brandId,
        id: id ?? this.id,
        name: name ?? this.name);
  }

  VehicleModel copyWithWrapped(
      {Wrapped<BodyStyle?>? bodyStyle,
      Wrapped<String?>? brandId,
      Wrapped<String?>? id,
      Wrapped<String?>? name}) {
    return VehicleModel(
        bodyStyle: (bodyStyle != null ? bodyStyle.value : this.bodyStyle),
        brandId: (brandId != null ? brandId.value : this.brandId),
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class VehicleModelPage {
  const VehicleModelPage({
    this.vehicleModels,
  });

  factory VehicleModelPage.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelPageFromJson(json);

  static const toJsonFactory = _$VehicleModelPageToJson;
  Map<String, dynamic> toJson() => _$VehicleModelPageToJson(this);

  @JsonKey(name: 'vehicleModels', defaultValue: <VehicleModel>[])
  final List<VehicleModel>? vehicleModels;
  static const fromJsonFactory = _$VehicleModelPageFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is VehicleModelPage &&
            (identical(other.vehicleModels, vehicleModels) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleModels, vehicleModels)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(vehicleModels) ^ runtimeType.hashCode;
}

extension $VehicleModelPageExtension on VehicleModelPage {
  VehicleModelPage copyWith({List<VehicleModel>? vehicleModels}) {
    return VehicleModelPage(vehicleModels: vehicleModels ?? this.vehicleModels);
  }

  VehicleModelPage copyWithWrapped(
      {Wrapped<List<VehicleModel>?>? vehicleModels}) {
    return VehicleModelPage(
        vehicleModels:
            (vehicleModels != null ? vehicleModels.value : this.vehicleModels));
  }
}

@JsonSerializable(explicitToJson: true)
class VehicleUsage {
  const VehicleUsage({
    this.id,
    this.mileageDelta,
    this.mileageEndValue,
    this.mileageStartValue,
    this.period,
    this.status,
    this.statusMessage,
    this.trips,
  });

  factory VehicleUsage.fromJson(Map<String, dynamic> json) =>
      _$VehicleUsageFromJson(json);

  static const toJsonFactory = _$VehicleUsageToJson;
  Map<String, dynamic> toJson() => _$VehicleUsageToJson(this);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'mileageDelta')
  final double? mileageDelta;
  @JsonKey(name: 'mileageEndValue')
  final double? mileageEndValue;
  @JsonKey(name: 'mileageStartValue')
  final double? mileageStartValue;
  @JsonKey(name: 'period')
  final Period? period;
  @JsonKey(
    name: 'status',
    toJson: vehicleUsageStatusNullableToJson,
    fromJson: vehicleUsageStatusNullableFromJson,
  )
  final enums.VehicleUsageStatus? status;
  @JsonKey(name: 'statusMessage')
  final String? statusMessage;
  @JsonKey(name: 'trips', defaultValue: <Trip>[])
  final List<Trip>? trips;
  static const fromJsonFactory = _$VehicleUsageFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is VehicleUsage &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.mileageDelta, mileageDelta) ||
                const DeepCollectionEquality()
                    .equals(other.mileageDelta, mileageDelta)) &&
            (identical(other.mileageEndValue, mileageEndValue) ||
                const DeepCollectionEquality()
                    .equals(other.mileageEndValue, mileageEndValue)) &&
            (identical(other.mileageStartValue, mileageStartValue) ||
                const DeepCollectionEquality()
                    .equals(other.mileageStartValue, mileageStartValue)) &&
            (identical(other.period, period) ||
                const DeepCollectionEquality().equals(other.period, period)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.statusMessage, statusMessage) ||
                const DeepCollectionEquality()
                    .equals(other.statusMessage, statusMessage)) &&
            (identical(other.trips, trips) ||
                const DeepCollectionEquality().equals(other.trips, trips)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(mileageDelta) ^
      const DeepCollectionEquality().hash(mileageEndValue) ^
      const DeepCollectionEquality().hash(mileageStartValue) ^
      const DeepCollectionEquality().hash(period) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(statusMessage) ^
      const DeepCollectionEquality().hash(trips) ^
      runtimeType.hashCode;
}

extension $VehicleUsageExtension on VehicleUsage {
  VehicleUsage copyWith(
      {String? id,
      double? mileageDelta,
      double? mileageEndValue,
      double? mileageStartValue,
      Period? period,
      enums.VehicleUsageStatus? status,
      String? statusMessage,
      List<Trip>? trips}) {
    return VehicleUsage(
        id: id ?? this.id,
        mileageDelta: mileageDelta ?? this.mileageDelta,
        mileageEndValue: mileageEndValue ?? this.mileageEndValue,
        mileageStartValue: mileageStartValue ?? this.mileageStartValue,
        period: period ?? this.period,
        status: status ?? this.status,
        statusMessage: statusMessage ?? this.statusMessage,
        trips: trips ?? this.trips);
  }

  VehicleUsage copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<double?>? mileageDelta,
      Wrapped<double?>? mileageEndValue,
      Wrapped<double?>? mileageStartValue,
      Wrapped<Period?>? period,
      Wrapped<enums.VehicleUsageStatus?>? status,
      Wrapped<String?>? statusMessage,
      Wrapped<List<Trip>?>? trips}) {
    return VehicleUsage(
        id: (id != null ? id.value : this.id),
        mileageDelta:
            (mileageDelta != null ? mileageDelta.value : this.mileageDelta),
        mileageEndValue: (mileageEndValue != null
            ? mileageEndValue.value
            : this.mileageEndValue),
        mileageStartValue: (mileageStartValue != null
            ? mileageStartValue.value
            : this.mileageStartValue),
        period: (period != null ? period.value : this.period),
        status: (status != null ? status.value : this.status),
        statusMessage:
            (statusMessage != null ? statusMessage.value : this.statusMessage),
        trips: (trips != null ? trips.value : this.trips));
  }
}

@JsonSerializable(explicitToJson: true)
class VehicleUsagePage {
  const VehicleUsagePage({
    this.vehicleUsages,
  });

  factory VehicleUsagePage.fromJson(Map<String, dynamic> json) =>
      _$VehicleUsagePageFromJson(json);

  static const toJsonFactory = _$VehicleUsagePageToJson;
  Map<String, dynamic> toJson() => _$VehicleUsagePageToJson(this);

  @JsonKey(name: 'vehicleUsages', defaultValue: <VehicleUsage>[])
  final List<VehicleUsage>? vehicleUsages;
  static const fromJsonFactory = _$VehicleUsagePageFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is VehicleUsagePage &&
            (identical(other.vehicleUsages, vehicleUsages) ||
                const DeepCollectionEquality()
                    .equals(other.vehicleUsages, vehicleUsages)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(vehicleUsages) ^ runtimeType.hashCode;
}

extension $VehicleUsagePageExtension on VehicleUsagePage {
  VehicleUsagePage copyWith({List<VehicleUsage>? vehicleUsages}) {
    return VehicleUsagePage(vehicleUsages: vehicleUsages ?? this.vehicleUsages);
  }

  VehicleUsagePage copyWithWrapped(
      {Wrapped<List<VehicleUsage>?>? vehicleUsages}) {
    return VehicleUsagePage(
        vehicleUsages:
            (vehicleUsages != null ? vehicleUsages.value : this.vehicleUsages));
  }
}

@JsonSerializable(explicitToJson: true)
class VehicleUsageReference {
  const VehicleUsageReference({
    this.id,
    this.period,
    this.status,
    this.statusMessage,
  });

  factory VehicleUsageReference.fromJson(Map<String, dynamic> json) =>
      _$VehicleUsageReferenceFromJson(json);

  static const toJsonFactory = _$VehicleUsageReferenceToJson;
  Map<String, dynamic> toJson() => _$VehicleUsageReferenceToJson(this);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'period')
  final Period? period;
  @JsonKey(
    name: 'status',
    toJson: vehicleUsageReferenceStatusNullableToJson,
    fromJson: vehicleUsageReferenceStatusNullableFromJson,
  )
  final enums.VehicleUsageReferenceStatus? status;
  @JsonKey(name: 'statusMessage')
  final String? statusMessage;
  static const fromJsonFactory = _$VehicleUsageReferenceFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is VehicleUsageReference &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.period, period) ||
                const DeepCollectionEquality().equals(other.period, period)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.statusMessage, statusMessage) ||
                const DeepCollectionEquality()
                    .equals(other.statusMessage, statusMessage)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(period) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(statusMessage) ^
      runtimeType.hashCode;
}

extension $VehicleUsageReferenceExtension on VehicleUsageReference {
  VehicleUsageReference copyWith(
      {String? id,
      Period? period,
      enums.VehicleUsageReferenceStatus? status,
      String? statusMessage}) {
    return VehicleUsageReference(
        id: id ?? this.id,
        period: period ?? this.period,
        status: status ?? this.status,
        statusMessage: statusMessage ?? this.statusMessage);
  }

  VehicleUsageReference copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<Period?>? period,
      Wrapped<enums.VehicleUsageReferenceStatus?>? status,
      Wrapped<String?>? statusMessage}) {
    return VehicleUsageReference(
        id: (id != null ? id.value : this.id),
        period: (period != null ? period.value : this.period),
        status: (status != null ? status.value : this.status),
        statusMessage:
            (statusMessage != null ? statusMessage.value : this.statusMessage));
  }
}

@JsonSerializable(explicitToJson: true)
class VehicleUsageUpdateStatusRequest {
  const VehicleUsageUpdateStatusRequest({
    this.mileage,
    required this.status,
    this.statusMessage,
  });

  factory VehicleUsageUpdateStatusRequest.fromJson(Map<String, dynamic> json) =>
      _$VehicleUsageUpdateStatusRequestFromJson(json);

  static const toJsonFactory = _$VehicleUsageUpdateStatusRequestToJson;
  Map<String, dynamic> toJson() =>
      _$VehicleUsageUpdateStatusRequestToJson(this);

  @JsonKey(name: 'mileage')
  final double? mileage;
  @JsonKey(
    name: 'status',
    toJson: vehicleUsageUpdateStatusRequestStatusToJson,
    fromJson: vehicleUsageUpdateStatusRequestStatusFromJson,
  )
  final enums.VehicleUsageUpdateStatusRequestStatus status;
  @JsonKey(name: 'statusMessage')
  final String? statusMessage;
  static const fromJsonFactory = _$VehicleUsageUpdateStatusRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is VehicleUsageUpdateStatusRequest &&
            (identical(other.mileage, mileage) ||
                const DeepCollectionEquality()
                    .equals(other.mileage, mileage)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.statusMessage, statusMessage) ||
                const DeepCollectionEquality()
                    .equals(other.statusMessage, statusMessage)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(mileage) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(statusMessage) ^
      runtimeType.hashCode;
}

extension $VehicleUsageUpdateStatusRequestExtension
    on VehicleUsageUpdateStatusRequest {
  VehicleUsageUpdateStatusRequest copyWith(
      {double? mileage,
      enums.VehicleUsageUpdateStatusRequestStatus? status,
      String? statusMessage}) {
    return VehicleUsageUpdateStatusRequest(
        mileage: mileage ?? this.mileage,
        status: status ?? this.status,
        statusMessage: statusMessage ?? this.statusMessage);
  }

  VehicleUsageUpdateStatusRequest copyWithWrapped(
      {Wrapped<double?>? mileage,
      Wrapped<enums.VehicleUsageUpdateStatusRequestStatus>? status,
      Wrapped<String?>? statusMessage}) {
    return VehicleUsageUpdateStatusRequest(
        mileage: (mileage != null ? mileage.value : this.mileage),
        status: (status != null ? status.value : this.status),
        statusMessage:
            (statusMessage != null ? statusMessage.value : this.statusMessage));
  }
}

@JsonSerializable(explicitToJson: true)
class VehiclesPage {
  const VehiclesPage({
    this.vehicles,
  });

  factory VehiclesPage.fromJson(Map<String, dynamic> json) =>
      _$VehiclesPageFromJson(json);

  static const toJsonFactory = _$VehiclesPageToJson;
  Map<String, dynamic> toJson() => _$VehiclesPageToJson(this);

  @JsonKey(name: 'vehicles', defaultValue: <Vehicle>[])
  final List<Vehicle>? vehicles;
  static const fromJsonFactory = _$VehiclesPageFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is VehiclesPage &&
            (identical(other.vehicles, vehicles) ||
                const DeepCollectionEquality()
                    .equals(other.vehicles, vehicles)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(vehicles) ^ runtimeType.hashCode;
}

extension $VehiclesPageExtension on VehiclesPage {
  VehiclesPage copyWith({List<Vehicle>? vehicles}) {
    return VehiclesPage(vehicles: vehicles ?? this.vehicles);
  }

  VehiclesPage copyWithWrapped({Wrapped<List<Vehicle>?>? vehicles}) {
    return VehiclesPage(
        vehicles: (vehicles != null ? vehicles.value : this.vehicles));
  }
}

@JsonSerializable(explicitToJson: true)
class ContractsConvictions {
  const ContractsConvictions({
    this.convictionBloodTestRefusal,
    this.convictionDrunk,
    this.convictionHitAndRun,
    this.convictionIntoxicated,
    this.convictionLicenseRevocation,
  });

  factory ContractsConvictions.fromJson(Map<String, dynamic> json) =>
      _$ContractsConvictionsFromJson(json);

  static const toJsonFactory = _$ContractsConvictionsToJson;
  Map<String, dynamic> toJson() => _$ContractsConvictionsToJson(this);

  @JsonKey(name: 'convictionBloodTestRefusal')
  final bool? convictionBloodTestRefusal;
  @JsonKey(name: 'convictionDrunk')
  final bool? convictionDrunk;
  @JsonKey(name: 'convictionHitAndRun')
  final bool? convictionHitAndRun;
  @JsonKey(name: 'convictionIntoxicated')
  final bool? convictionIntoxicated;
  @JsonKey(name: 'convictionLicenseRevocation')
  final bool? convictionLicenseRevocation;
  static const fromJsonFactory = _$ContractsConvictionsFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ContractsConvictions &&
            (identical(other.convictionBloodTestRefusal,
                    convictionBloodTestRefusal) ||
                const DeepCollectionEquality().equals(
                    other.convictionBloodTestRefusal,
                    convictionBloodTestRefusal)) &&
            (identical(other.convictionDrunk, convictionDrunk) ||
                const DeepCollectionEquality()
                    .equals(other.convictionDrunk, convictionDrunk)) &&
            (identical(other.convictionHitAndRun, convictionHitAndRun) ||
                const DeepCollectionEquality()
                    .equals(other.convictionHitAndRun, convictionHitAndRun)) &&
            (identical(other.convictionIntoxicated, convictionIntoxicated) ||
                const DeepCollectionEquality().equals(
                    other.convictionIntoxicated, convictionIntoxicated)) &&
            (identical(other.convictionLicenseRevocation,
                    convictionLicenseRevocation) ||
                const DeepCollectionEquality().equals(
                    other.convictionLicenseRevocation,
                    convictionLicenseRevocation)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(convictionBloodTestRefusal) ^
      const DeepCollectionEquality().hash(convictionDrunk) ^
      const DeepCollectionEquality().hash(convictionHitAndRun) ^
      const DeepCollectionEquality().hash(convictionIntoxicated) ^
      const DeepCollectionEquality().hash(convictionLicenseRevocation) ^
      runtimeType.hashCode;
}

extension $ContractsConvictionsExtension on ContractsConvictions {
  ContractsConvictions copyWith(
      {bool? convictionBloodTestRefusal,
      bool? convictionDrunk,
      bool? convictionHitAndRun,
      bool? convictionIntoxicated,
      bool? convictionLicenseRevocation}) {
    return ContractsConvictions(
        convictionBloodTestRefusal:
            convictionBloodTestRefusal ?? this.convictionBloodTestRefusal,
        convictionDrunk: convictionDrunk ?? this.convictionDrunk,
        convictionHitAndRun: convictionHitAndRun ?? this.convictionHitAndRun,
        convictionIntoxicated:
            convictionIntoxicated ?? this.convictionIntoxicated,
        convictionLicenseRevocation:
            convictionLicenseRevocation ?? this.convictionLicenseRevocation);
  }

  ContractsConvictions copyWithWrapped(
      {Wrapped<bool?>? convictionBloodTestRefusal,
      Wrapped<bool?>? convictionDrunk,
      Wrapped<bool?>? convictionHitAndRun,
      Wrapped<bool?>? convictionIntoxicated,
      Wrapped<bool?>? convictionLicenseRevocation}) {
    return ContractsConvictions(
        convictionBloodTestRefusal: (convictionBloodTestRefusal != null
            ? convictionBloodTestRefusal.value
            : this.convictionBloodTestRefusal),
        convictionDrunk: (convictionDrunk != null
            ? convictionDrunk.value
            : this.convictionDrunk),
        convictionHitAndRun: (convictionHitAndRun != null
            ? convictionHitAndRun.value
            : this.convictionHitAndRun),
        convictionIntoxicated: (convictionIntoxicated != null
            ? convictionIntoxicated.value
            : this.convictionIntoxicated),
        convictionLicenseRevocation: (convictionLicenseRevocation != null
            ? convictionLicenseRevocation.value
            : this.convictionLicenseRevocation));
  }
}

@JsonSerializable(explicitToJson: true)
class ContractsCreateClient {
  const ContractsCreateClient({
    required this.city,
    required this.country,
    required this.email,
    required this.houseNumber,
    required this.name,
    required this.postalCode,
    required this.street,
    this.vat,
  });

  factory ContractsCreateClient.fromJson(Map<String, dynamic> json) =>
      _$ContractsCreateClientFromJson(json);

  static const toJsonFactory = _$ContractsCreateClientToJson;
  Map<String, dynamic> toJson() => _$ContractsCreateClientToJson(this);

  @JsonKey(name: 'city')
  final String city;
  @JsonKey(name: 'country')
  final String country;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'houseNumber')
  final String houseNumber;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'postalCode')
  final String postalCode;
  @JsonKey(name: 'street')
  final String street;
  @JsonKey(name: 'vat')
  final String? vat;
  static const fromJsonFactory = _$ContractsCreateClientFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ContractsCreateClient &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.houseNumber, houseNumber) ||
                const DeepCollectionEquality()
                    .equals(other.houseNumber, houseNumber)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.postalCode, postalCode) ||
                const DeepCollectionEquality()
                    .equals(other.postalCode, postalCode)) &&
            (identical(other.street, street) ||
                const DeepCollectionEquality().equals(other.street, street)) &&
            (identical(other.vat, vat) ||
                const DeepCollectionEquality().equals(other.vat, vat)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(houseNumber) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(postalCode) ^
      const DeepCollectionEquality().hash(street) ^
      const DeepCollectionEquality().hash(vat) ^
      runtimeType.hashCode;
}

extension $ContractsCreateClientExtension on ContractsCreateClient {
  ContractsCreateClient copyWith(
      {String? city,
      String? country,
      String? email,
      String? houseNumber,
      String? name,
      String? postalCode,
      String? street,
      String? vat}) {
    return ContractsCreateClient(
        city: city ?? this.city,
        country: country ?? this.country,
        email: email ?? this.email,
        houseNumber: houseNumber ?? this.houseNumber,
        name: name ?? this.name,
        postalCode: postalCode ?? this.postalCode,
        street: street ?? this.street,
        vat: vat ?? this.vat);
  }

  ContractsCreateClient copyWithWrapped(
      {Wrapped<String>? city,
      Wrapped<String>? country,
      Wrapped<String>? email,
      Wrapped<String>? houseNumber,
      Wrapped<String>? name,
      Wrapped<String>? postalCode,
      Wrapped<String>? street,
      Wrapped<String?>? vat}) {
    return ContractsCreateClient(
        city: (city != null ? city.value : this.city),
        country: (country != null ? country.value : this.country),
        email: (email != null ? email.value : this.email),
        houseNumber:
            (houseNumber != null ? houseNumber.value : this.houseNumber),
        name: (name != null ? name.value : this.name),
        postalCode: (postalCode != null ? postalCode.value : this.postalCode),
        street: (street != null ? street.value : this.street),
        vat: (vat != null ? vat.value : this.vat));
  }
}

@JsonSerializable(explicitToJson: true)
class ContractsOnboarding {
  const ContractsOnboarding({
    this.legal,
    this.personal,
    this.phone,
    this.status,
  });

  factory ContractsOnboarding.fromJson(Map<String, dynamic> json) =>
      _$ContractsOnboardingFromJson(json);

  static const toJsonFactory = _$ContractsOnboardingToJson;
  Map<String, dynamic> toJson() => _$ContractsOnboardingToJson(this);

  @JsonKey(name: 'legal')
  final ContractsOnboardingLegal? legal;
  @JsonKey(name: 'personal')
  final ContractsOnboardingPersonal? personal;
  @JsonKey(name: 'phone')
  final ContractsOnboardingPhone? phone;
  @JsonKey(
    name: 'status',
    toJson: contractsOnboardingStatusNullableToJson,
    fromJson: contractsOnboardingStatusNullableFromJson,
  )
  final enums.ContractsOnboardingStatus? status;
  static const fromJsonFactory = _$ContractsOnboardingFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ContractsOnboarding &&
            (identical(other.legal, legal) ||
                const DeepCollectionEquality().equals(other.legal, legal)) &&
            (identical(other.personal, personal) ||
                const DeepCollectionEquality()
                    .equals(other.personal, personal)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(legal) ^
      const DeepCollectionEquality().hash(personal) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(status) ^
      runtimeType.hashCode;
}

extension $ContractsOnboardingExtension on ContractsOnboarding {
  ContractsOnboarding copyWith(
      {ContractsOnboardingLegal? legal,
      ContractsOnboardingPersonal? personal,
      ContractsOnboardingPhone? phone,
      enums.ContractsOnboardingStatus? status}) {
    return ContractsOnboarding(
        legal: legal ?? this.legal,
        personal: personal ?? this.personal,
        phone: phone ?? this.phone,
        status: status ?? this.status);
  }

  ContractsOnboarding copyWithWrapped(
      {Wrapped<ContractsOnboardingLegal?>? legal,
      Wrapped<ContractsOnboardingPersonal?>? personal,
      Wrapped<ContractsOnboardingPhone?>? phone,
      Wrapped<enums.ContractsOnboardingStatus?>? status}) {
    return ContractsOnboarding(
        legal: (legal != null ? legal.value : this.legal),
        personal: (personal != null ? personal.value : this.personal),
        phone: (phone != null ? phone.value : this.phone),
        status: (status != null ? status.value : this.status));
  }
}

@JsonSerializable(explicitToJson: true)
class ContractsOnboardingLegal {
  const ContractsOnboardingLegal({
    required this.convictions,
    required this.nrOfAccidents,
  });

  factory ContractsOnboardingLegal.fromJson(Map<String, dynamic> json) =>
      _$ContractsOnboardingLegalFromJson(json);

  static const toJsonFactory = _$ContractsOnboardingLegalToJson;
  Map<String, dynamic> toJson() => _$ContractsOnboardingLegalToJson(this);

  @JsonKey(name: 'convictions')
  final ContractsConvictions convictions;
  @JsonKey(name: 'nrOfAccidents')
  final int nrOfAccidents;
  static const fromJsonFactory = _$ContractsOnboardingLegalFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ContractsOnboardingLegal &&
            (identical(other.convictions, convictions) ||
                const DeepCollectionEquality()
                    .equals(other.convictions, convictions)) &&
            (identical(other.nrOfAccidents, nrOfAccidents) ||
                const DeepCollectionEquality()
                    .equals(other.nrOfAccidents, nrOfAccidents)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(convictions) ^
      const DeepCollectionEquality().hash(nrOfAccidents) ^
      runtimeType.hashCode;
}

extension $ContractsOnboardingLegalExtension on ContractsOnboardingLegal {
  ContractsOnboardingLegal copyWith(
      {ContractsConvictions? convictions, int? nrOfAccidents}) {
    return ContractsOnboardingLegal(
        convictions: convictions ?? this.convictions,
        nrOfAccidents: nrOfAccidents ?? this.nrOfAccidents);
  }

  ContractsOnboardingLegal copyWithWrapped(
      {Wrapped<ContractsConvictions>? convictions,
      Wrapped<int>? nrOfAccidents}) {
    return ContractsOnboardingLegal(
        convictions:
            (convictions != null ? convictions.value : this.convictions),
        nrOfAccidents:
            (nrOfAccidents != null ? nrOfAccidents.value : this.nrOfAccidents));
  }
}

@JsonSerializable(explicitToJson: true)
class ContractsOnboardingPersonal {
  const ContractsOnboardingPersonal({
    required this.box,
    required this.city,
    required this.dateCurrentLicense,
    required this.dateLicenseUntil,
    required this.dateOfBirth,
    required this.firstName,
    required this.houseNumber,
    required this.lastName,
    required this.licenseNumber,
    required this.licenseType,
    required this.nationality,
    required this.postalCode,
    required this.socialSecurityNumber,
    required this.street,
  });

  factory ContractsOnboardingPersonal.fromJson(Map<String, dynamic> json) =>
      _$ContractsOnboardingPersonalFromJson(json);

  static const toJsonFactory = _$ContractsOnboardingPersonalToJson;
  Map<String, dynamic> toJson() => _$ContractsOnboardingPersonalToJson(this);

  @JsonKey(name: 'box')
  final String box;
  @JsonKey(name: 'city')
  final String city;
  @JsonKey(name: 'dateCurrentLicense')
  final String dateCurrentLicense;
  @JsonKey(name: 'dateLicenseUntil')
  final String dateLicenseUntil;
  @JsonKey(name: 'dateOfBirth')
  final String dateOfBirth;
  @JsonKey(name: 'firstName')
  final String firstName;
  @JsonKey(name: 'houseNumber')
  final String houseNumber;
  @JsonKey(name: 'lastName')
  final String lastName;
  @JsonKey(name: 'licenseNumber')
  final String licenseNumber;
  @JsonKey(
    name: 'licenseType',
    toJson: contractsOnboardingPersonalLicenseTypeToJson,
    fromJson: contractsOnboardingPersonalLicenseTypeFromJson,
  )
  final enums.ContractsOnboardingPersonalLicenseType licenseType;
  @JsonKey(name: 'nationality')
  final String nationality;
  @JsonKey(name: 'postalCode')
  final String postalCode;
  @JsonKey(name: 'socialSecurityNumber')
  final String socialSecurityNumber;
  @JsonKey(name: 'street')
  final String street;
  static const fromJsonFactory = _$ContractsOnboardingPersonalFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ContractsOnboardingPersonal &&
            (identical(other.box, box) ||
                const DeepCollectionEquality().equals(other.box, box)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.dateCurrentLicense, dateCurrentLicense) ||
                const DeepCollectionEquality()
                    .equals(other.dateCurrentLicense, dateCurrentLicense)) &&
            (identical(other.dateLicenseUntil, dateLicenseUntil) ||
                const DeepCollectionEquality()
                    .equals(other.dateLicenseUntil, dateLicenseUntil)) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                const DeepCollectionEquality()
                    .equals(other.dateOfBirth, dateOfBirth)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.houseNumber, houseNumber) ||
                const DeepCollectionEquality()
                    .equals(other.houseNumber, houseNumber)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.licenseNumber, licenseNumber) ||
                const DeepCollectionEquality()
                    .equals(other.licenseNumber, licenseNumber)) &&
            (identical(other.licenseType, licenseType) ||
                const DeepCollectionEquality()
                    .equals(other.licenseType, licenseType)) &&
            (identical(other.nationality, nationality) ||
                const DeepCollectionEquality()
                    .equals(other.nationality, nationality)) &&
            (identical(other.postalCode, postalCode) ||
                const DeepCollectionEquality()
                    .equals(other.postalCode, postalCode)) &&
            (identical(other.socialSecurityNumber, socialSecurityNumber) ||
                const DeepCollectionEquality().equals(
                    other.socialSecurityNumber, socialSecurityNumber)) &&
            (identical(other.street, street) ||
                const DeepCollectionEquality().equals(other.street, street)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(box) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(dateCurrentLicense) ^
      const DeepCollectionEquality().hash(dateLicenseUntil) ^
      const DeepCollectionEquality().hash(dateOfBirth) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(houseNumber) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(licenseNumber) ^
      const DeepCollectionEquality().hash(licenseType) ^
      const DeepCollectionEquality().hash(nationality) ^
      const DeepCollectionEquality().hash(postalCode) ^
      const DeepCollectionEquality().hash(socialSecurityNumber) ^
      const DeepCollectionEquality().hash(street) ^
      runtimeType.hashCode;
}

extension $ContractsOnboardingPersonalExtension on ContractsOnboardingPersonal {
  ContractsOnboardingPersonal copyWith(
      {String? box,
      String? city,
      String? dateCurrentLicense,
      String? dateLicenseUntil,
      String? dateOfBirth,
      String? firstName,
      String? houseNumber,
      String? lastName,
      String? licenseNumber,
      enums.ContractsOnboardingPersonalLicenseType? licenseType,
      String? nationality,
      String? postalCode,
      String? socialSecurityNumber,
      String? street}) {
    return ContractsOnboardingPersonal(
        box: box ?? this.box,
        city: city ?? this.city,
        dateCurrentLicense: dateCurrentLicense ?? this.dateCurrentLicense,
        dateLicenseUntil: dateLicenseUntil ?? this.dateLicenseUntil,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        firstName: firstName ?? this.firstName,
        houseNumber: houseNumber ?? this.houseNumber,
        lastName: lastName ?? this.lastName,
        licenseNumber: licenseNumber ?? this.licenseNumber,
        licenseType: licenseType ?? this.licenseType,
        nationality: nationality ?? this.nationality,
        postalCode: postalCode ?? this.postalCode,
        socialSecurityNumber: socialSecurityNumber ?? this.socialSecurityNumber,
        street: street ?? this.street);
  }

  ContractsOnboardingPersonal copyWithWrapped(
      {Wrapped<String>? box,
      Wrapped<String>? city,
      Wrapped<String>? dateCurrentLicense,
      Wrapped<String>? dateLicenseUntil,
      Wrapped<String>? dateOfBirth,
      Wrapped<String>? firstName,
      Wrapped<String>? houseNumber,
      Wrapped<String>? lastName,
      Wrapped<String>? licenseNumber,
      Wrapped<enums.ContractsOnboardingPersonalLicenseType>? licenseType,
      Wrapped<String>? nationality,
      Wrapped<String>? postalCode,
      Wrapped<String>? socialSecurityNumber,
      Wrapped<String>? street}) {
    return ContractsOnboardingPersonal(
        box: (box != null ? box.value : this.box),
        city: (city != null ? city.value : this.city),
        dateCurrentLicense: (dateCurrentLicense != null
            ? dateCurrentLicense.value
            : this.dateCurrentLicense),
        dateLicenseUntil: (dateLicenseUntil != null
            ? dateLicenseUntil.value
            : this.dateLicenseUntil),
        dateOfBirth:
            (dateOfBirth != null ? dateOfBirth.value : this.dateOfBirth),
        firstName: (firstName != null ? firstName.value : this.firstName),
        houseNumber:
            (houseNumber != null ? houseNumber.value : this.houseNumber),
        lastName: (lastName != null ? lastName.value : this.lastName),
        licenseNumber:
            (licenseNumber != null ? licenseNumber.value : this.licenseNumber),
        licenseType:
            (licenseType != null ? licenseType.value : this.licenseType),
        nationality:
            (nationality != null ? nationality.value : this.nationality),
        postalCode: (postalCode != null ? postalCode.value : this.postalCode),
        socialSecurityNumber: (socialSecurityNumber != null
            ? socialSecurityNumber.value
            : this.socialSecurityNumber),
        street: (street != null ? street.value : this.street));
  }
}

@JsonSerializable(explicitToJson: true)
class ContractsOnboardingPhone {
  const ContractsOnboardingPhone({
    required this.phoneNumber,
    this.phoneNumberValidationCode,
  });

  factory ContractsOnboardingPhone.fromJson(Map<String, dynamic> json) =>
      _$ContractsOnboardingPhoneFromJson(json);

  static const toJsonFactory = _$ContractsOnboardingPhoneToJson;
  Map<String, dynamic> toJson() => _$ContractsOnboardingPhoneToJson(this);

  @JsonKey(name: 'phoneNumber')
  final String phoneNumber;
  @JsonKey(name: 'phoneNumberValidationCode')
  final String? phoneNumberValidationCode;
  static const fromJsonFactory = _$ContractsOnboardingPhoneFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ContractsOnboardingPhone &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.phoneNumberValidationCode,
                    phoneNumberValidationCode) ||
                const DeepCollectionEquality().equals(
                    other.phoneNumberValidationCode,
                    phoneNumberValidationCode)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(phoneNumberValidationCode) ^
      runtimeType.hashCode;
}

extension $ContractsOnboardingPhoneExtension on ContractsOnboardingPhone {
  ContractsOnboardingPhone copyWith(
      {String? phoneNumber, String? phoneNumberValidationCode}) {
    return ContractsOnboardingPhone(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        phoneNumberValidationCode:
            phoneNumberValidationCode ?? this.phoneNumberValidationCode);
  }

  ContractsOnboardingPhone copyWithWrapped(
      {Wrapped<String>? phoneNumber,
      Wrapped<String?>? phoneNumberValidationCode}) {
    return ContractsOnboardingPhone(
        phoneNumber:
            (phoneNumber != null ? phoneNumber.value : this.phoneNumber),
        phoneNumberValidationCode: (phoneNumberValidationCode != null
            ? phoneNumberValidationCode.value
            : this.phoneNumberValidationCode));
  }
}

@JsonSerializable(explicitToJson: true)
class UserV1ImageUserIdPost$RequestBody {
  const UserV1ImageUserIdPost$RequestBody({
    required this.file,
  });

  factory UserV1ImageUserIdPost$RequestBody.fromJson(
          Map<String, dynamic> json) =>
      _$UserV1ImageUserIdPost$RequestBodyFromJson(json);

  static const toJsonFactory = _$UserV1ImageUserIdPost$RequestBodyToJson;
  Map<String, dynamic> toJson() =>
      _$UserV1ImageUserIdPost$RequestBodyToJson(this);

  @JsonKey(name: 'file')
  final String file;
  static const fromJsonFactory = _$UserV1ImageUserIdPost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UserV1ImageUserIdPost$RequestBody &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(file) ^ runtimeType.hashCode;
}

extension $UserV1ImageUserIdPost$RequestBodyExtension
    on UserV1ImageUserIdPost$RequestBody {
  UserV1ImageUserIdPost$RequestBody copyWith({String? file}) {
    return UserV1ImageUserIdPost$RequestBody(file: file ?? this.file);
  }

  UserV1ImageUserIdPost$RequestBody copyWithWrapped({Wrapped<String>? file}) {
    return UserV1ImageUserIdPost$RequestBody(
        file: (file != null ? file.value : this.file));
  }
}

@JsonSerializable(explicitToJson: true)
class UserV1UsersOnboardingDocumentsPut$RequestBody {
  const UserV1UsersOnboardingDocumentsPut$RequestBody({
    this.backDriverLicense,
    this.backId,
    this.damageStatistic,
    this.frontDriverLicense,
    this.frontId,
    this.selfie,
  });

  factory UserV1UsersOnboardingDocumentsPut$RequestBody.fromJson(
          Map<String, dynamic> json) =>
      _$UserV1UsersOnboardingDocumentsPut$RequestBodyFromJson(json);

  static const toJsonFactory =
      _$UserV1UsersOnboardingDocumentsPut$RequestBodyToJson;
  Map<String, dynamic> toJson() =>
      _$UserV1UsersOnboardingDocumentsPut$RequestBodyToJson(this);

  @JsonKey(name: 'backDriverLicense')
  final String? backDriverLicense;
  @JsonKey(name: 'backId')
  final String? backId;
  @JsonKey(name: 'damageStatistic')
  final String? damageStatistic;
  @JsonKey(name: 'frontDriverLicense')
  final String? frontDriverLicense;
  @JsonKey(name: 'frontId')
  final String? frontId;
  @JsonKey(name: 'selfie')
  final String? selfie;
  static const fromJsonFactory =
      _$UserV1UsersOnboardingDocumentsPut$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UserV1UsersOnboardingDocumentsPut$RequestBody &&
            (identical(other.backDriverLicense, backDriverLicense) ||
                const DeepCollectionEquality()
                    .equals(other.backDriverLicense, backDriverLicense)) &&
            (identical(other.backId, backId) ||
                const DeepCollectionEquality().equals(other.backId, backId)) &&
            (identical(other.damageStatistic, damageStatistic) ||
                const DeepCollectionEquality()
                    .equals(other.damageStatistic, damageStatistic)) &&
            (identical(other.frontDriverLicense, frontDriverLicense) ||
                const DeepCollectionEquality()
                    .equals(other.frontDriverLicense, frontDriverLicense)) &&
            (identical(other.frontId, frontId) ||
                const DeepCollectionEquality()
                    .equals(other.frontId, frontId)) &&
            (identical(other.selfie, selfie) ||
                const DeepCollectionEquality().equals(other.selfie, selfie)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(backDriverLicense) ^
      const DeepCollectionEquality().hash(backId) ^
      const DeepCollectionEquality().hash(damageStatistic) ^
      const DeepCollectionEquality().hash(frontDriverLicense) ^
      const DeepCollectionEquality().hash(frontId) ^
      const DeepCollectionEquality().hash(selfie) ^
      runtimeType.hashCode;
}

extension $UserV1UsersOnboardingDocumentsPut$RequestBodyExtension
    on UserV1UsersOnboardingDocumentsPut$RequestBody {
  UserV1UsersOnboardingDocumentsPut$RequestBody copyWith(
      {String? backDriverLicense,
      String? backId,
      String? damageStatistic,
      String? frontDriverLicense,
      String? frontId,
      String? selfie}) {
    return UserV1UsersOnboardingDocumentsPut$RequestBody(
        backDriverLicense: backDriverLicense ?? this.backDriverLicense,
        backId: backId ?? this.backId,
        damageStatistic: damageStatistic ?? this.damageStatistic,
        frontDriverLicense: frontDriverLicense ?? this.frontDriverLicense,
        frontId: frontId ?? this.frontId,
        selfie: selfie ?? this.selfie);
  }

  UserV1UsersOnboardingDocumentsPut$RequestBody copyWithWrapped(
      {Wrapped<String?>? backDriverLicense,
      Wrapped<String?>? backId,
      Wrapped<String?>? damageStatistic,
      Wrapped<String?>? frontDriverLicense,
      Wrapped<String?>? frontId,
      Wrapped<String?>? selfie}) {
    return UserV1UsersOnboardingDocumentsPut$RequestBody(
        backDriverLicense: (backDriverLicense != null
            ? backDriverLicense.value
            : this.backDriverLicense),
        backId: (backId != null ? backId.value : this.backId),
        damageStatistic: (damageStatistic != null
            ? damageStatistic.value
            : this.damageStatistic),
        frontDriverLicense: (frontDriverLicense != null
            ? frontDriverLicense.value
            : this.frontDriverLicense),
        frontId: (frontId != null ? frontId.value : this.frontId),
        selfie: (selfie != null ? selfie.value : this.selfie));
  }
}

@JsonSerializable(explicitToJson: true)
class VehicleV1VehicleImageVehicleIdPost$RequestBody {
  const VehicleV1VehicleImageVehicleIdPost$RequestBody({
    required this.file,
  });

  factory VehicleV1VehicleImageVehicleIdPost$RequestBody.fromJson(
          Map<String, dynamic> json) =>
      _$VehicleV1VehicleImageVehicleIdPost$RequestBodyFromJson(json);

  static const toJsonFactory =
      _$VehicleV1VehicleImageVehicleIdPost$RequestBodyToJson;
  Map<String, dynamic> toJson() =>
      _$VehicleV1VehicleImageVehicleIdPost$RequestBodyToJson(this);

  @JsonKey(name: 'file')
  final String file;
  static const fromJsonFactory =
      _$VehicleV1VehicleImageVehicleIdPost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is VehicleV1VehicleImageVehicleIdPost$RequestBody &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(file) ^ runtimeType.hashCode;
}

extension $VehicleV1VehicleImageVehicleIdPost$RequestBodyExtension
    on VehicleV1VehicleImageVehicleIdPost$RequestBody {
  VehicleV1VehicleImageVehicleIdPost$RequestBody copyWith({String? file}) {
    return VehicleV1VehicleImageVehicleIdPost$RequestBody(
        file: file ?? this.file);
  }

  VehicleV1VehicleImageVehicleIdPost$RequestBody copyWithWrapped(
      {Wrapped<String>? file}) {
    return VehicleV1VehicleImageVehicleIdPost$RequestBody(
        file: (file != null ? file.value : this.file));
  }
}

String? adjacentNonAvailabilityTypeNullableToJson(
    enums.AdjacentNonAvailabilityType? adjacentNonAvailabilityType) {
  return adjacentNonAvailabilityType?.value;
}

String? adjacentNonAvailabilityTypeToJson(
    enums.AdjacentNonAvailabilityType adjacentNonAvailabilityType) {
  return adjacentNonAvailabilityType.value;
}

enums.AdjacentNonAvailabilityType adjacentNonAvailabilityTypeFromJson(
  Object? adjacentNonAvailabilityType, [
  enums.AdjacentNonAvailabilityType? defaultValue,
]) {
  return enums.AdjacentNonAvailabilityType.values
          .firstWhereOrNull((e) => e.value == adjacentNonAvailabilityType) ??
      defaultValue ??
      enums.AdjacentNonAvailabilityType.swaggerGeneratedUnknown;
}

enums.AdjacentNonAvailabilityType? adjacentNonAvailabilityTypeNullableFromJson(
  Object? adjacentNonAvailabilityType, [
  enums.AdjacentNonAvailabilityType? defaultValue,
]) {
  if (adjacentNonAvailabilityType == null) {
    return null;
  }
  return enums.AdjacentNonAvailabilityType.values
          .firstWhereOrNull((e) => e.value == adjacentNonAvailabilityType) ??
      defaultValue;
}

String adjacentNonAvailabilityTypeExplodedListToJson(
    List<enums.AdjacentNonAvailabilityType>? adjacentNonAvailabilityType) {
  return adjacentNonAvailabilityType?.map((e) => e.value!).join(',') ?? '';
}

List<String> adjacentNonAvailabilityTypeListToJson(
    List<enums.AdjacentNonAvailabilityType>? adjacentNonAvailabilityType) {
  if (adjacentNonAvailabilityType == null) {
    return [];
  }

  return adjacentNonAvailabilityType.map((e) => e.value!).toList();
}

List<enums.AdjacentNonAvailabilityType> adjacentNonAvailabilityTypeListFromJson(
  List? adjacentNonAvailabilityType, [
  List<enums.AdjacentNonAvailabilityType>? defaultValue,
]) {
  if (adjacentNonAvailabilityType == null) {
    return defaultValue ?? [];
  }

  return adjacentNonAvailabilityType
      .map((e) => adjacentNonAvailabilityTypeFromJson(e.toString()))
      .toList();
}

List<enums.AdjacentNonAvailabilityType>?
    adjacentNonAvailabilityTypeNullableListFromJson(
  List? adjacentNonAvailabilityType, [
  List<enums.AdjacentNonAvailabilityType>? defaultValue,
]) {
  if (adjacentNonAvailabilityType == null) {
    return defaultValue;
  }

  return adjacentNonAvailabilityType
      .map((e) => adjacentNonAvailabilityTypeFromJson(e.toString()))
      .toList();
}

String? billingPriceUnitNullableToJson(
    enums.BillingPriceUnit? billingPriceUnit) {
  return billingPriceUnit?.value;
}

String? billingPriceUnitToJson(enums.BillingPriceUnit billingPriceUnit) {
  return billingPriceUnit.value;
}

enums.BillingPriceUnit billingPriceUnitFromJson(
  Object? billingPriceUnit, [
  enums.BillingPriceUnit? defaultValue,
]) {
  return enums.BillingPriceUnit.values
          .firstWhereOrNull((e) => e.value == billingPriceUnit) ??
      defaultValue ??
      enums.BillingPriceUnit.swaggerGeneratedUnknown;
}

enums.BillingPriceUnit? billingPriceUnitNullableFromJson(
  Object? billingPriceUnit, [
  enums.BillingPriceUnit? defaultValue,
]) {
  if (billingPriceUnit == null) {
    return null;
  }
  return enums.BillingPriceUnit.values
          .firstWhereOrNull((e) => e.value == billingPriceUnit) ??
      defaultValue;
}

String billingPriceUnitExplodedListToJson(
    List<enums.BillingPriceUnit>? billingPriceUnit) {
  return billingPriceUnit?.map((e) => e.value!).join(',') ?? '';
}

List<String> billingPriceUnitListToJson(
    List<enums.BillingPriceUnit>? billingPriceUnit) {
  if (billingPriceUnit == null) {
    return [];
  }

  return billingPriceUnit.map((e) => e.value!).toList();
}

List<enums.BillingPriceUnit> billingPriceUnitListFromJson(
  List? billingPriceUnit, [
  List<enums.BillingPriceUnit>? defaultValue,
]) {
  if (billingPriceUnit == null) {
    return defaultValue ?? [];
  }

  return billingPriceUnit
      .map((e) => billingPriceUnitFromJson(e.toString()))
      .toList();
}

List<enums.BillingPriceUnit>? billingPriceUnitNullableListFromJson(
  List? billingPriceUnit, [
  List<enums.BillingPriceUnit>? defaultValue,
]) {
  if (billingPriceUnit == null) {
    return defaultValue;
  }

  return billingPriceUnit
      .map((e) => billingPriceUnitFromJson(e.toString()))
      .toList();
}

String? bookingInvoiceStatusNullableToJson(
    enums.BookingInvoiceStatus? bookingInvoiceStatus) {
  return bookingInvoiceStatus?.value;
}

String? bookingInvoiceStatusToJson(
    enums.BookingInvoiceStatus bookingInvoiceStatus) {
  return bookingInvoiceStatus.value;
}

enums.BookingInvoiceStatus bookingInvoiceStatusFromJson(
  Object? bookingInvoiceStatus, [
  enums.BookingInvoiceStatus? defaultValue,
]) {
  return enums.BookingInvoiceStatus.values
          .firstWhereOrNull((e) => e.value == bookingInvoiceStatus) ??
      defaultValue ??
      enums.BookingInvoiceStatus.swaggerGeneratedUnknown;
}

enums.BookingInvoiceStatus? bookingInvoiceStatusNullableFromJson(
  Object? bookingInvoiceStatus, [
  enums.BookingInvoiceStatus? defaultValue,
]) {
  if (bookingInvoiceStatus == null) {
    return null;
  }
  return enums.BookingInvoiceStatus.values
          .firstWhereOrNull((e) => e.value == bookingInvoiceStatus) ??
      defaultValue;
}

String bookingInvoiceStatusExplodedListToJson(
    List<enums.BookingInvoiceStatus>? bookingInvoiceStatus) {
  return bookingInvoiceStatus?.map((e) => e.value!).join(',') ?? '';
}

List<String> bookingInvoiceStatusListToJson(
    List<enums.BookingInvoiceStatus>? bookingInvoiceStatus) {
  if (bookingInvoiceStatus == null) {
    return [];
  }

  return bookingInvoiceStatus.map((e) => e.value!).toList();
}

List<enums.BookingInvoiceStatus> bookingInvoiceStatusListFromJson(
  List? bookingInvoiceStatus, [
  List<enums.BookingInvoiceStatus>? defaultValue,
]) {
  if (bookingInvoiceStatus == null) {
    return defaultValue ?? [];
  }

  return bookingInvoiceStatus
      .map((e) => bookingInvoiceStatusFromJson(e.toString()))
      .toList();
}

List<enums.BookingInvoiceStatus>? bookingInvoiceStatusNullableListFromJson(
  List? bookingInvoiceStatus, [
  List<enums.BookingInvoiceStatus>? defaultValue,
]) {
  if (bookingInvoiceStatus == null) {
    return defaultValue;
  }

  return bookingInvoiceStatus
      .map((e) => bookingInvoiceStatusFromJson(e.toString()))
      .toList();
}

String? bookingNextPossibleStatusesNullableToJson(
    enums.BookingNextPossibleStatuses? bookingNextPossibleStatuses) {
  return bookingNextPossibleStatuses?.value;
}

String? bookingNextPossibleStatusesToJson(
    enums.BookingNextPossibleStatuses bookingNextPossibleStatuses) {
  return bookingNextPossibleStatuses.value;
}

enums.BookingNextPossibleStatuses bookingNextPossibleStatusesFromJson(
  Object? bookingNextPossibleStatuses, [
  enums.BookingNextPossibleStatuses? defaultValue,
]) {
  return enums.BookingNextPossibleStatuses.values
          .firstWhereOrNull((e) => e.value == bookingNextPossibleStatuses) ??
      defaultValue ??
      enums.BookingNextPossibleStatuses.swaggerGeneratedUnknown;
}

enums.BookingNextPossibleStatuses? bookingNextPossibleStatusesNullableFromJson(
  Object? bookingNextPossibleStatuses, [
  enums.BookingNextPossibleStatuses? defaultValue,
]) {
  if (bookingNextPossibleStatuses == null) {
    return null;
  }
  return enums.BookingNextPossibleStatuses.values
          .firstWhereOrNull((e) => e.value == bookingNextPossibleStatuses) ??
      defaultValue;
}

String bookingNextPossibleStatusesExplodedListToJson(
    List<enums.BookingNextPossibleStatuses>? bookingNextPossibleStatuses) {
  return bookingNextPossibleStatuses?.map((e) => e.value!).join(',') ?? '';
}

List<String> bookingNextPossibleStatusesListToJson(
    List<enums.BookingNextPossibleStatuses>? bookingNextPossibleStatuses) {
  if (bookingNextPossibleStatuses == null) {
    return [];
  }

  return bookingNextPossibleStatuses.map((e) => e.value!).toList();
}

List<enums.BookingNextPossibleStatuses> bookingNextPossibleStatusesListFromJson(
  List? bookingNextPossibleStatuses, [
  List<enums.BookingNextPossibleStatuses>? defaultValue,
]) {
  if (bookingNextPossibleStatuses == null) {
    return defaultValue ?? [];
  }

  return bookingNextPossibleStatuses
      .map((e) => bookingNextPossibleStatusesFromJson(e.toString()))
      .toList();
}

List<enums.BookingNextPossibleStatuses>?
    bookingNextPossibleStatusesNullableListFromJson(
  List? bookingNextPossibleStatuses, [
  List<enums.BookingNextPossibleStatuses>? defaultValue,
]) {
  if (bookingNextPossibleStatuses == null) {
    return defaultValue;
  }

  return bookingNextPossibleStatuses
      .map((e) => bookingNextPossibleStatusesFromJson(e.toString()))
      .toList();
}

String? bookingStatusNullableToJson(enums.BookingStatus? bookingStatus) {
  return bookingStatus?.value;
}

String? bookingStatusToJson(enums.BookingStatus bookingStatus) {
  return bookingStatus.value;
}

enums.BookingStatus bookingStatusFromJson(
  Object? bookingStatus, [
  enums.BookingStatus? defaultValue,
]) {
  return enums.BookingStatus.values
          .firstWhereOrNull((e) => e.value == bookingStatus) ??
      defaultValue ??
      enums.BookingStatus.swaggerGeneratedUnknown;
}

enums.BookingStatus? bookingStatusNullableFromJson(
  Object? bookingStatus, [
  enums.BookingStatus? defaultValue,
]) {
  if (bookingStatus == null) {
    return null;
  }
  return enums.BookingStatus.values
          .firstWhereOrNull((e) => e.value == bookingStatus) ??
      defaultValue;
}

String bookingStatusExplodedListToJson(
    List<enums.BookingStatus>? bookingStatus) {
  return bookingStatus?.map((e) => e.value!).join(',') ?? '';
}

List<String> bookingStatusListToJson(List<enums.BookingStatus>? bookingStatus) {
  if (bookingStatus == null) {
    return [];
  }

  return bookingStatus.map((e) => e.value!).toList();
}

List<enums.BookingStatus> bookingStatusListFromJson(
  List? bookingStatus, [
  List<enums.BookingStatus>? defaultValue,
]) {
  if (bookingStatus == null) {
    return defaultValue ?? [];
  }

  return bookingStatus.map((e) => bookingStatusFromJson(e.toString())).toList();
}

List<enums.BookingStatus>? bookingStatusNullableListFromJson(
  List? bookingStatus, [
  List<enums.BookingStatus>? defaultValue,
]) {
  if (bookingStatus == null) {
    return defaultValue;
  }

  return bookingStatus.map((e) => bookingStatusFromJson(e.toString())).toList();
}

String? conflictResolutionModeNullableToJson(
    enums.ConflictResolutionMode? conflictResolutionMode) {
  return conflictResolutionMode?.value;
}

String? conflictResolutionModeToJson(
    enums.ConflictResolutionMode conflictResolutionMode) {
  return conflictResolutionMode.value;
}

enums.ConflictResolutionMode conflictResolutionModeFromJson(
  Object? conflictResolutionMode, [
  enums.ConflictResolutionMode? defaultValue,
]) {
  return enums.ConflictResolutionMode.values
          .firstWhereOrNull((e) => e.value == conflictResolutionMode) ??
      defaultValue ??
      enums.ConflictResolutionMode.swaggerGeneratedUnknown;
}

enums.ConflictResolutionMode? conflictResolutionModeNullableFromJson(
  Object? conflictResolutionMode, [
  enums.ConflictResolutionMode? defaultValue,
]) {
  if (conflictResolutionMode == null) {
    return null;
  }
  return enums.ConflictResolutionMode.values
          .firstWhereOrNull((e) => e.value == conflictResolutionMode) ??
      defaultValue;
}

String conflictResolutionModeExplodedListToJson(
    List<enums.ConflictResolutionMode>? conflictResolutionMode) {
  return conflictResolutionMode?.map((e) => e.value!).join(',') ?? '';
}

List<String> conflictResolutionModeListToJson(
    List<enums.ConflictResolutionMode>? conflictResolutionMode) {
  if (conflictResolutionMode == null) {
    return [];
  }

  return conflictResolutionMode.map((e) => e.value!).toList();
}

List<enums.ConflictResolutionMode> conflictResolutionModeListFromJson(
  List? conflictResolutionMode, [
  List<enums.ConflictResolutionMode>? defaultValue,
]) {
  if (conflictResolutionMode == null) {
    return defaultValue ?? [];
  }

  return conflictResolutionMode
      .map((e) => conflictResolutionModeFromJson(e.toString()))
      .toList();
}

List<enums.ConflictResolutionMode>? conflictResolutionModeNullableListFromJson(
  List? conflictResolutionMode, [
  List<enums.ConflictResolutionMode>? defaultValue,
]) {
  if (conflictResolutionMode == null) {
    return defaultValue;
  }

  return conflictResolutionMode
      .map((e) => conflictResolutionModeFromJson(e.toString()))
      .toList();
}

String? homeFeedCardTypeNullableToJson(
    enums.HomeFeedCardType? homeFeedCardType) {
  return homeFeedCardType?.value;
}

String? homeFeedCardTypeToJson(enums.HomeFeedCardType homeFeedCardType) {
  return homeFeedCardType.value;
}

enums.HomeFeedCardType homeFeedCardTypeFromJson(
  Object? homeFeedCardType, [
  enums.HomeFeedCardType? defaultValue,
]) {
  return enums.HomeFeedCardType.values
          .firstWhereOrNull((e) => e.value == homeFeedCardType) ??
      defaultValue ??
      enums.HomeFeedCardType.swaggerGeneratedUnknown;
}

enums.HomeFeedCardType? homeFeedCardTypeNullableFromJson(
  Object? homeFeedCardType, [
  enums.HomeFeedCardType? defaultValue,
]) {
  if (homeFeedCardType == null) {
    return null;
  }
  return enums.HomeFeedCardType.values
          .firstWhereOrNull((e) => e.value == homeFeedCardType) ??
      defaultValue;
}

String homeFeedCardTypeExplodedListToJson(
    List<enums.HomeFeedCardType>? homeFeedCardType) {
  return homeFeedCardType?.map((e) => e.value!).join(',') ?? '';
}

List<String> homeFeedCardTypeListToJson(
    List<enums.HomeFeedCardType>? homeFeedCardType) {
  if (homeFeedCardType == null) {
    return [];
  }

  return homeFeedCardType.map((e) => e.value!).toList();
}

List<enums.HomeFeedCardType> homeFeedCardTypeListFromJson(
  List? homeFeedCardType, [
  List<enums.HomeFeedCardType>? defaultValue,
]) {
  if (homeFeedCardType == null) {
    return defaultValue ?? [];
  }

  return homeFeedCardType
      .map((e) => homeFeedCardTypeFromJson(e.toString()))
      .toList();
}

List<enums.HomeFeedCardType>? homeFeedCardTypeNullableListFromJson(
  List? homeFeedCardType, [
  List<enums.HomeFeedCardType>? defaultValue,
]) {
  if (homeFeedCardType == null) {
    return defaultValue;
  }

  return homeFeedCardType
      .map((e) => homeFeedCardTypeFromJson(e.toString()))
      .toList();
}

String? myAvailableVehicleTypeNullableToJson(
    enums.MyAvailableVehicleType? myAvailableVehicleType) {
  return myAvailableVehicleType?.value;
}

String? myAvailableVehicleTypeToJson(
    enums.MyAvailableVehicleType myAvailableVehicleType) {
  return myAvailableVehicleType.value;
}

enums.MyAvailableVehicleType myAvailableVehicleTypeFromJson(
  Object? myAvailableVehicleType, [
  enums.MyAvailableVehicleType? defaultValue,
]) {
  return enums.MyAvailableVehicleType.values
          .firstWhereOrNull((e) => e.value == myAvailableVehicleType) ??
      defaultValue ??
      enums.MyAvailableVehicleType.swaggerGeneratedUnknown;
}

enums.MyAvailableVehicleType? myAvailableVehicleTypeNullableFromJson(
  Object? myAvailableVehicleType, [
  enums.MyAvailableVehicleType? defaultValue,
]) {
  if (myAvailableVehicleType == null) {
    return null;
  }
  return enums.MyAvailableVehicleType.values
          .firstWhereOrNull((e) => e.value == myAvailableVehicleType) ??
      defaultValue;
}

String myAvailableVehicleTypeExplodedListToJson(
    List<enums.MyAvailableVehicleType>? myAvailableVehicleType) {
  return myAvailableVehicleType?.map((e) => e.value!).join(',') ?? '';
}

List<String> myAvailableVehicleTypeListToJson(
    List<enums.MyAvailableVehicleType>? myAvailableVehicleType) {
  if (myAvailableVehicleType == null) {
    return [];
  }

  return myAvailableVehicleType.map((e) => e.value!).toList();
}

List<enums.MyAvailableVehicleType> myAvailableVehicleTypeListFromJson(
  List? myAvailableVehicleType, [
  List<enums.MyAvailableVehicleType>? defaultValue,
]) {
  if (myAvailableVehicleType == null) {
    return defaultValue ?? [];
  }

  return myAvailableVehicleType
      .map((e) => myAvailableVehicleTypeFromJson(e.toString()))
      .toList();
}

List<enums.MyAvailableVehicleType>? myAvailableVehicleTypeNullableListFromJson(
  List? myAvailableVehicleType, [
  List<enums.MyAvailableVehicleType>? defaultValue,
]) {
  if (myAvailableVehicleType == null) {
    return defaultValue;
  }

  return myAvailableVehicleType
      .map((e) => myAvailableVehicleTypeFromJson(e.toString()))
      .toList();
}

String? nonAvailabilityTypeNullableToJson(
    enums.NonAvailabilityType? nonAvailabilityType) {
  return nonAvailabilityType?.value;
}

String? nonAvailabilityTypeToJson(
    enums.NonAvailabilityType nonAvailabilityType) {
  return nonAvailabilityType.value;
}

enums.NonAvailabilityType nonAvailabilityTypeFromJson(
  Object? nonAvailabilityType, [
  enums.NonAvailabilityType? defaultValue,
]) {
  return enums.NonAvailabilityType.values
          .firstWhereOrNull((e) => e.value == nonAvailabilityType) ??
      defaultValue ??
      enums.NonAvailabilityType.swaggerGeneratedUnknown;
}

enums.NonAvailabilityType? nonAvailabilityTypeNullableFromJson(
  Object? nonAvailabilityType, [
  enums.NonAvailabilityType? defaultValue,
]) {
  if (nonAvailabilityType == null) {
    return null;
  }
  return enums.NonAvailabilityType.values
          .firstWhereOrNull((e) => e.value == nonAvailabilityType) ??
      defaultValue;
}

String nonAvailabilityTypeExplodedListToJson(
    List<enums.NonAvailabilityType>? nonAvailabilityType) {
  return nonAvailabilityType?.map((e) => e.value!).join(',') ?? '';
}

List<String> nonAvailabilityTypeListToJson(
    List<enums.NonAvailabilityType>? nonAvailabilityType) {
  if (nonAvailabilityType == null) {
    return [];
  }

  return nonAvailabilityType.map((e) => e.value!).toList();
}

List<enums.NonAvailabilityType> nonAvailabilityTypeListFromJson(
  List? nonAvailabilityType, [
  List<enums.NonAvailabilityType>? defaultValue,
]) {
  if (nonAvailabilityType == null) {
    return defaultValue ?? [];
  }

  return nonAvailabilityType
      .map((e) => nonAvailabilityTypeFromJson(e.toString()))
      .toList();
}

List<enums.NonAvailabilityType>? nonAvailabilityTypeNullableListFromJson(
  List? nonAvailabilityType, [
  List<enums.NonAvailabilityType>? defaultValue,
]) {
  if (nonAvailabilityType == null) {
    return defaultValue;
  }

  return nonAvailabilityType
      .map((e) => nonAvailabilityTypeFromJson(e.toString()))
      .toList();
}

String? recurringScheduleRecurringTypeNullableToJson(
    enums.RecurringScheduleRecurringType? recurringScheduleRecurringType) {
  return recurringScheduleRecurringType?.value;
}

String? recurringScheduleRecurringTypeToJson(
    enums.RecurringScheduleRecurringType recurringScheduleRecurringType) {
  return recurringScheduleRecurringType.value;
}

enums.RecurringScheduleRecurringType recurringScheduleRecurringTypeFromJson(
  Object? recurringScheduleRecurringType, [
  enums.RecurringScheduleRecurringType? defaultValue,
]) {
  return enums.RecurringScheduleRecurringType.values
          .firstWhereOrNull((e) => e.value == recurringScheduleRecurringType) ??
      defaultValue ??
      enums.RecurringScheduleRecurringType.swaggerGeneratedUnknown;
}

enums.RecurringScheduleRecurringType?
    recurringScheduleRecurringTypeNullableFromJson(
  Object? recurringScheduleRecurringType, [
  enums.RecurringScheduleRecurringType? defaultValue,
]) {
  if (recurringScheduleRecurringType == null) {
    return null;
  }
  return enums.RecurringScheduleRecurringType.values
          .firstWhereOrNull((e) => e.value == recurringScheduleRecurringType) ??
      defaultValue;
}

String recurringScheduleRecurringTypeExplodedListToJson(
    List<enums.RecurringScheduleRecurringType>?
        recurringScheduleRecurringType) {
  return recurringScheduleRecurringType?.map((e) => e.value!).join(',') ?? '';
}

List<String> recurringScheduleRecurringTypeListToJson(
    List<enums.RecurringScheduleRecurringType>?
        recurringScheduleRecurringType) {
  if (recurringScheduleRecurringType == null) {
    return [];
  }

  return recurringScheduleRecurringType.map((e) => e.value!).toList();
}

List<enums.RecurringScheduleRecurringType>
    recurringScheduleRecurringTypeListFromJson(
  List? recurringScheduleRecurringType, [
  List<enums.RecurringScheduleRecurringType>? defaultValue,
]) {
  if (recurringScheduleRecurringType == null) {
    return defaultValue ?? [];
  }

  return recurringScheduleRecurringType
      .map((e) => recurringScheduleRecurringTypeFromJson(e.toString()))
      .toList();
}

List<enums.RecurringScheduleRecurringType>?
    recurringScheduleRecurringTypeNullableListFromJson(
  List? recurringScheduleRecurringType, [
  List<enums.RecurringScheduleRecurringType>? defaultValue,
]) {
  if (recurringScheduleRecurringType == null) {
    return defaultValue;
  }

  return recurringScheduleRecurringType
      .map((e) => recurringScheduleRecurringTypeFromJson(e.toString()))
      .toList();
}

String? recurringScheduleTimeZoneNullableToJson(
    enums.RecurringScheduleTimeZone? recurringScheduleTimeZone) {
  return recurringScheduleTimeZone?.value;
}

String? recurringScheduleTimeZoneToJson(
    enums.RecurringScheduleTimeZone recurringScheduleTimeZone) {
  return recurringScheduleTimeZone.value;
}

enums.RecurringScheduleTimeZone recurringScheduleTimeZoneFromJson(
  Object? recurringScheduleTimeZone, [
  enums.RecurringScheduleTimeZone? defaultValue,
]) {
  return enums.RecurringScheduleTimeZone.values
          .firstWhereOrNull((e) => e.value == recurringScheduleTimeZone) ??
      defaultValue ??
      enums.RecurringScheduleTimeZone.swaggerGeneratedUnknown;
}

enums.RecurringScheduleTimeZone? recurringScheduleTimeZoneNullableFromJson(
  Object? recurringScheduleTimeZone, [
  enums.RecurringScheduleTimeZone? defaultValue,
]) {
  if (recurringScheduleTimeZone == null) {
    return null;
  }
  return enums.RecurringScheduleTimeZone.values
          .firstWhereOrNull((e) => e.value == recurringScheduleTimeZone) ??
      defaultValue;
}

String recurringScheduleTimeZoneExplodedListToJson(
    List<enums.RecurringScheduleTimeZone>? recurringScheduleTimeZone) {
  return recurringScheduleTimeZone?.map((e) => e.value!).join(',') ?? '';
}

List<String> recurringScheduleTimeZoneListToJson(
    List<enums.RecurringScheduleTimeZone>? recurringScheduleTimeZone) {
  if (recurringScheduleTimeZone == null) {
    return [];
  }

  return recurringScheduleTimeZone.map((e) => e.value!).toList();
}

List<enums.RecurringScheduleTimeZone> recurringScheduleTimeZoneListFromJson(
  List? recurringScheduleTimeZone, [
  List<enums.RecurringScheduleTimeZone>? defaultValue,
]) {
  if (recurringScheduleTimeZone == null) {
    return defaultValue ?? [];
  }

  return recurringScheduleTimeZone
      .map((e) => recurringScheduleTimeZoneFromJson(e.toString()))
      .toList();
}

List<enums.RecurringScheduleTimeZone>?
    recurringScheduleTimeZoneNullableListFromJson(
  List? recurringScheduleTimeZone, [
  List<enums.RecurringScheduleTimeZone>? defaultValue,
]) {
  if (recurringScheduleTimeZone == null) {
    return defaultValue;
  }

  return recurringScheduleTimeZone
      .map((e) => recurringScheduleTimeZoneFromJson(e.toString()))
      .toList();
}

String? searchBookingsRequestInvoiceStatusesNullableToJson(
    enums.SearchBookingsRequestInvoiceStatuses?
        searchBookingsRequestInvoiceStatuses) {
  return searchBookingsRequestInvoiceStatuses?.value;
}

String? searchBookingsRequestInvoiceStatusesToJson(
    enums.SearchBookingsRequestInvoiceStatuses
        searchBookingsRequestInvoiceStatuses) {
  return searchBookingsRequestInvoiceStatuses.value;
}

enums.SearchBookingsRequestInvoiceStatuses
    searchBookingsRequestInvoiceStatusesFromJson(
  Object? searchBookingsRequestInvoiceStatuses, [
  enums.SearchBookingsRequestInvoiceStatuses? defaultValue,
]) {
  return enums.SearchBookingsRequestInvoiceStatuses.values.firstWhereOrNull(
          (e) => e.value == searchBookingsRequestInvoiceStatuses) ??
      defaultValue ??
      enums.SearchBookingsRequestInvoiceStatuses.swaggerGeneratedUnknown;
}

enums.SearchBookingsRequestInvoiceStatuses?
    searchBookingsRequestInvoiceStatusesNullableFromJson(
  Object? searchBookingsRequestInvoiceStatuses, [
  enums.SearchBookingsRequestInvoiceStatuses? defaultValue,
]) {
  if (searchBookingsRequestInvoiceStatuses == null) {
    return null;
  }
  return enums.SearchBookingsRequestInvoiceStatuses.values.firstWhereOrNull(
          (e) => e.value == searchBookingsRequestInvoiceStatuses) ??
      defaultValue;
}

String searchBookingsRequestInvoiceStatusesExplodedListToJson(
    List<enums.SearchBookingsRequestInvoiceStatuses>?
        searchBookingsRequestInvoiceStatuses) {
  return searchBookingsRequestInvoiceStatuses?.map((e) => e.value!).join(',') ??
      '';
}

List<String> searchBookingsRequestInvoiceStatusesListToJson(
    List<enums.SearchBookingsRequestInvoiceStatuses>?
        searchBookingsRequestInvoiceStatuses) {
  if (searchBookingsRequestInvoiceStatuses == null) {
    return [];
  }

  return searchBookingsRequestInvoiceStatuses.map((e) => e.value!).toList();
}

List<enums.SearchBookingsRequestInvoiceStatuses>
    searchBookingsRequestInvoiceStatusesListFromJson(
  List? searchBookingsRequestInvoiceStatuses, [
  List<enums.SearchBookingsRequestInvoiceStatuses>? defaultValue,
]) {
  if (searchBookingsRequestInvoiceStatuses == null) {
    return defaultValue ?? [];
  }

  return searchBookingsRequestInvoiceStatuses
      .map((e) => searchBookingsRequestInvoiceStatusesFromJson(e.toString()))
      .toList();
}

List<enums.SearchBookingsRequestInvoiceStatuses>?
    searchBookingsRequestInvoiceStatusesNullableListFromJson(
  List? searchBookingsRequestInvoiceStatuses, [
  List<enums.SearchBookingsRequestInvoiceStatuses>? defaultValue,
]) {
  if (searchBookingsRequestInvoiceStatuses == null) {
    return defaultValue;
  }

  return searchBookingsRequestInvoiceStatuses
      .map((e) => searchBookingsRequestInvoiceStatusesFromJson(e.toString()))
      .toList();
}

String? searchBookingsRequestStatusesNullableToJson(
    enums.SearchBookingsRequestStatuses? searchBookingsRequestStatuses) {
  return searchBookingsRequestStatuses?.value;
}

String? searchBookingsRequestStatusesToJson(
    enums.SearchBookingsRequestStatuses searchBookingsRequestStatuses) {
  return searchBookingsRequestStatuses.value;
}

enums.SearchBookingsRequestStatuses searchBookingsRequestStatusesFromJson(
  Object? searchBookingsRequestStatuses, [
  enums.SearchBookingsRequestStatuses? defaultValue,
]) {
  return enums.SearchBookingsRequestStatuses.values
          .firstWhereOrNull((e) => e.value == searchBookingsRequestStatuses) ??
      defaultValue ??
      enums.SearchBookingsRequestStatuses.swaggerGeneratedUnknown;
}

enums.SearchBookingsRequestStatuses?
    searchBookingsRequestStatusesNullableFromJson(
  Object? searchBookingsRequestStatuses, [
  enums.SearchBookingsRequestStatuses? defaultValue,
]) {
  if (searchBookingsRequestStatuses == null) {
    return null;
  }
  return enums.SearchBookingsRequestStatuses.values
          .firstWhereOrNull((e) => e.value == searchBookingsRequestStatuses) ??
      defaultValue;
}

String searchBookingsRequestStatusesExplodedListToJson(
    List<enums.SearchBookingsRequestStatuses>? searchBookingsRequestStatuses) {
  return searchBookingsRequestStatuses?.map((e) => e.value!).join(',') ?? '';
}

List<String> searchBookingsRequestStatusesListToJson(
    List<enums.SearchBookingsRequestStatuses>? searchBookingsRequestStatuses) {
  if (searchBookingsRequestStatuses == null) {
    return [];
  }

  return searchBookingsRequestStatuses.map((e) => e.value!).toList();
}

List<enums.SearchBookingsRequestStatuses>
    searchBookingsRequestStatusesListFromJson(
  List? searchBookingsRequestStatuses, [
  List<enums.SearchBookingsRequestStatuses>? defaultValue,
]) {
  if (searchBookingsRequestStatuses == null) {
    return defaultValue ?? [];
  }

  return searchBookingsRequestStatuses
      .map((e) => searchBookingsRequestStatusesFromJson(e.toString()))
      .toList();
}

List<enums.SearchBookingsRequestStatuses>?
    searchBookingsRequestStatusesNullableListFromJson(
  List? searchBookingsRequestStatuses, [
  List<enums.SearchBookingsRequestStatuses>? defaultValue,
]) {
  if (searchBookingsRequestStatuses == null) {
    return defaultValue;
  }

  return searchBookingsRequestStatuses
      .map((e) => searchBookingsRequestStatusesFromJson(e.toString()))
      .toList();
}

String? subscriptionClientRolesNullableToJson(
    enums.SubscriptionClientRoles? subscriptionClientRoles) {
  return subscriptionClientRoles?.value;
}

String? subscriptionClientRolesToJson(
    enums.SubscriptionClientRoles subscriptionClientRoles) {
  return subscriptionClientRoles.value;
}

enums.SubscriptionClientRoles subscriptionClientRolesFromJson(
  Object? subscriptionClientRoles, [
  enums.SubscriptionClientRoles? defaultValue,
]) {
  return enums.SubscriptionClientRoles.values
          .firstWhereOrNull((e) => e.value == subscriptionClientRoles) ??
      defaultValue ??
      enums.SubscriptionClientRoles.swaggerGeneratedUnknown;
}

enums.SubscriptionClientRoles? subscriptionClientRolesNullableFromJson(
  Object? subscriptionClientRoles, [
  enums.SubscriptionClientRoles? defaultValue,
]) {
  if (subscriptionClientRoles == null) {
    return null;
  }
  return enums.SubscriptionClientRoles.values
          .firstWhereOrNull((e) => e.value == subscriptionClientRoles) ??
      defaultValue;
}

String subscriptionClientRolesExplodedListToJson(
    List<enums.SubscriptionClientRoles>? subscriptionClientRoles) {
  return subscriptionClientRoles?.map((e) => e.value!).join(',') ?? '';
}

List<String> subscriptionClientRolesListToJson(
    List<enums.SubscriptionClientRoles>? subscriptionClientRoles) {
  if (subscriptionClientRoles == null) {
    return [];
  }

  return subscriptionClientRoles.map((e) => e.value!).toList();
}

List<enums.SubscriptionClientRoles> subscriptionClientRolesListFromJson(
  List? subscriptionClientRoles, [
  List<enums.SubscriptionClientRoles>? defaultValue,
]) {
  if (subscriptionClientRoles == null) {
    return defaultValue ?? [];
  }

  return subscriptionClientRoles
      .map((e) => subscriptionClientRolesFromJson(e.toString()))
      .toList();
}

List<enums.SubscriptionClientRoles>?
    subscriptionClientRolesNullableListFromJson(
  List? subscriptionClientRoles, [
  List<enums.SubscriptionClientRoles>? defaultValue,
]) {
  if (subscriptionClientRoles == null) {
    return defaultValue;
  }

  return subscriptionClientRoles
      .map((e) => subscriptionClientRolesFromJson(e.toString()))
      .toList();
}

String? updateUserRequestRoleNullableToJson(
    enums.UpdateUserRequestRole? updateUserRequestRole) {
  return updateUserRequestRole?.value;
}

String? updateUserRequestRoleToJson(
    enums.UpdateUserRequestRole updateUserRequestRole) {
  return updateUserRequestRole.value;
}

enums.UpdateUserRequestRole updateUserRequestRoleFromJson(
  Object? updateUserRequestRole, [
  enums.UpdateUserRequestRole? defaultValue,
]) {
  return enums.UpdateUserRequestRole.values
          .firstWhereOrNull((e) => e.value == updateUserRequestRole) ??
      defaultValue ??
      enums.UpdateUserRequestRole.swaggerGeneratedUnknown;
}

enums.UpdateUserRequestRole? updateUserRequestRoleNullableFromJson(
  Object? updateUserRequestRole, [
  enums.UpdateUserRequestRole? defaultValue,
]) {
  if (updateUserRequestRole == null) {
    return null;
  }
  return enums.UpdateUserRequestRole.values
          .firstWhereOrNull((e) => e.value == updateUserRequestRole) ??
      defaultValue;
}

String updateUserRequestRoleExplodedListToJson(
    List<enums.UpdateUserRequestRole>? updateUserRequestRole) {
  return updateUserRequestRole?.map((e) => e.value!).join(',') ?? '';
}

List<String> updateUserRequestRoleListToJson(
    List<enums.UpdateUserRequestRole>? updateUserRequestRole) {
  if (updateUserRequestRole == null) {
    return [];
  }

  return updateUserRequestRole.map((e) => e.value!).toList();
}

List<enums.UpdateUserRequestRole> updateUserRequestRoleListFromJson(
  List? updateUserRequestRole, [
  List<enums.UpdateUserRequestRole>? defaultValue,
]) {
  if (updateUserRequestRole == null) {
    return defaultValue ?? [];
  }

  return updateUserRequestRole
      .map((e) => updateUserRequestRoleFromJson(e.toString()))
      .toList();
}

List<enums.UpdateUserRequestRole>? updateUserRequestRoleNullableListFromJson(
  List? updateUserRequestRole, [
  List<enums.UpdateUserRequestRole>? defaultValue,
]) {
  if (updateUserRequestRole == null) {
    return defaultValue;
  }

  return updateUserRequestRole
      .map((e) => updateUserRequestRoleFromJson(e.toString()))
      .toList();
}

String? updateVehicleRequestApprovalTypeNullableToJson(
    enums.UpdateVehicleRequestApprovalType? updateVehicleRequestApprovalType) {
  return updateVehicleRequestApprovalType?.value;
}

String? updateVehicleRequestApprovalTypeToJson(
    enums.UpdateVehicleRequestApprovalType updateVehicleRequestApprovalType) {
  return updateVehicleRequestApprovalType.value;
}

enums.UpdateVehicleRequestApprovalType updateVehicleRequestApprovalTypeFromJson(
  Object? updateVehicleRequestApprovalType, [
  enums.UpdateVehicleRequestApprovalType? defaultValue,
]) {
  return enums.UpdateVehicleRequestApprovalType.values.firstWhereOrNull(
          (e) => e.value == updateVehicleRequestApprovalType) ??
      defaultValue ??
      enums.UpdateVehicleRequestApprovalType.swaggerGeneratedUnknown;
}

enums.UpdateVehicleRequestApprovalType?
    updateVehicleRequestApprovalTypeNullableFromJson(
  Object? updateVehicleRequestApprovalType, [
  enums.UpdateVehicleRequestApprovalType? defaultValue,
]) {
  if (updateVehicleRequestApprovalType == null) {
    return null;
  }
  return enums.UpdateVehicleRequestApprovalType.values.firstWhereOrNull(
          (e) => e.value == updateVehicleRequestApprovalType) ??
      defaultValue;
}

String updateVehicleRequestApprovalTypeExplodedListToJson(
    List<enums.UpdateVehicleRequestApprovalType>?
        updateVehicleRequestApprovalType) {
  return updateVehicleRequestApprovalType?.map((e) => e.value!).join(',') ?? '';
}

List<String> updateVehicleRequestApprovalTypeListToJson(
    List<enums.UpdateVehicleRequestApprovalType>?
        updateVehicleRequestApprovalType) {
  if (updateVehicleRequestApprovalType == null) {
    return [];
  }

  return updateVehicleRequestApprovalType.map((e) => e.value!).toList();
}

List<enums.UpdateVehicleRequestApprovalType>
    updateVehicleRequestApprovalTypeListFromJson(
  List? updateVehicleRequestApprovalType, [
  List<enums.UpdateVehicleRequestApprovalType>? defaultValue,
]) {
  if (updateVehicleRequestApprovalType == null) {
    return defaultValue ?? [];
  }

  return updateVehicleRequestApprovalType
      .map((e) => updateVehicleRequestApprovalTypeFromJson(e.toString()))
      .toList();
}

List<enums.UpdateVehicleRequestApprovalType>?
    updateVehicleRequestApprovalTypeNullableListFromJson(
  List? updateVehicleRequestApprovalType, [
  List<enums.UpdateVehicleRequestApprovalType>? defaultValue,
]) {
  if (updateVehicleRequestApprovalType == null) {
    return defaultValue;
  }

  return updateVehicleRequestApprovalType
      .map((e) => updateVehicleRequestApprovalTypeFromJson(e.toString()))
      .toList();
}

String? vehicleOperationalStatusNullableToJson(
    enums.VehicleOperationalStatus? vehicleOperationalStatus) {
  return vehicleOperationalStatus?.value;
}

String? vehicleOperationalStatusToJson(
    enums.VehicleOperationalStatus vehicleOperationalStatus) {
  return vehicleOperationalStatus.value;
}

enums.VehicleOperationalStatus vehicleOperationalStatusFromJson(
  Object? vehicleOperationalStatus, [
  enums.VehicleOperationalStatus? defaultValue,
]) {
  return enums.VehicleOperationalStatus.values
          .firstWhereOrNull((e) => e.value == vehicleOperationalStatus) ??
      defaultValue ??
      enums.VehicleOperationalStatus.swaggerGeneratedUnknown;
}

enums.VehicleOperationalStatus? vehicleOperationalStatusNullableFromJson(
  Object? vehicleOperationalStatus, [
  enums.VehicleOperationalStatus? defaultValue,
]) {
  if (vehicleOperationalStatus == null) {
    return null;
  }
  return enums.VehicleOperationalStatus.values
          .firstWhereOrNull((e) => e.value == vehicleOperationalStatus) ??
      defaultValue;
}

String vehicleOperationalStatusExplodedListToJson(
    List<enums.VehicleOperationalStatus>? vehicleOperationalStatus) {
  return vehicleOperationalStatus?.map((e) => e.value!).join(',') ?? '';
}

List<String> vehicleOperationalStatusListToJson(
    List<enums.VehicleOperationalStatus>? vehicleOperationalStatus) {
  if (vehicleOperationalStatus == null) {
    return [];
  }

  return vehicleOperationalStatus.map((e) => e.value!).toList();
}

List<enums.VehicleOperationalStatus> vehicleOperationalStatusListFromJson(
  List? vehicleOperationalStatus, [
  List<enums.VehicleOperationalStatus>? defaultValue,
]) {
  if (vehicleOperationalStatus == null) {
    return defaultValue ?? [];
  }

  return vehicleOperationalStatus
      .map((e) => vehicleOperationalStatusFromJson(e.toString()))
      .toList();
}

List<enums.VehicleOperationalStatus>?
    vehicleOperationalStatusNullableListFromJson(
  List? vehicleOperationalStatus, [
  List<enums.VehicleOperationalStatus>? defaultValue,
]) {
  if (vehicleOperationalStatus == null) {
    return defaultValue;
  }

  return vehicleOperationalStatus
      .map((e) => vehicleOperationalStatusFromJson(e.toString()))
      .toList();
}

String? vehicleUsageStatusNullableToJson(
    enums.VehicleUsageStatus? vehicleUsageStatus) {
  return vehicleUsageStatus?.value;
}

String? vehicleUsageStatusToJson(enums.VehicleUsageStatus vehicleUsageStatus) {
  return vehicleUsageStatus.value;
}

enums.VehicleUsageStatus vehicleUsageStatusFromJson(
  Object? vehicleUsageStatus, [
  enums.VehicleUsageStatus? defaultValue,
]) {
  return enums.VehicleUsageStatus.values
          .firstWhereOrNull((e) => e.value == vehicleUsageStatus) ??
      defaultValue ??
      enums.VehicleUsageStatus.swaggerGeneratedUnknown;
}

enums.VehicleUsageStatus? vehicleUsageStatusNullableFromJson(
  Object? vehicleUsageStatus, [
  enums.VehicleUsageStatus? defaultValue,
]) {
  if (vehicleUsageStatus == null) {
    return null;
  }
  return enums.VehicleUsageStatus.values
          .firstWhereOrNull((e) => e.value == vehicleUsageStatus) ??
      defaultValue;
}

String vehicleUsageStatusExplodedListToJson(
    List<enums.VehicleUsageStatus>? vehicleUsageStatus) {
  return vehicleUsageStatus?.map((e) => e.value!).join(',') ?? '';
}

List<String> vehicleUsageStatusListToJson(
    List<enums.VehicleUsageStatus>? vehicleUsageStatus) {
  if (vehicleUsageStatus == null) {
    return [];
  }

  return vehicleUsageStatus.map((e) => e.value!).toList();
}

List<enums.VehicleUsageStatus> vehicleUsageStatusListFromJson(
  List? vehicleUsageStatus, [
  List<enums.VehicleUsageStatus>? defaultValue,
]) {
  if (vehicleUsageStatus == null) {
    return defaultValue ?? [];
  }

  return vehicleUsageStatus
      .map((e) => vehicleUsageStatusFromJson(e.toString()))
      .toList();
}

List<enums.VehicleUsageStatus>? vehicleUsageStatusNullableListFromJson(
  List? vehicleUsageStatus, [
  List<enums.VehicleUsageStatus>? defaultValue,
]) {
  if (vehicleUsageStatus == null) {
    return defaultValue;
  }

  return vehicleUsageStatus
      .map((e) => vehicleUsageStatusFromJson(e.toString()))
      .toList();
}

String? vehicleUsageReferenceStatusNullableToJson(
    enums.VehicleUsageReferenceStatus? vehicleUsageReferenceStatus) {
  return vehicleUsageReferenceStatus?.value;
}

String? vehicleUsageReferenceStatusToJson(
    enums.VehicleUsageReferenceStatus vehicleUsageReferenceStatus) {
  return vehicleUsageReferenceStatus.value;
}

enums.VehicleUsageReferenceStatus vehicleUsageReferenceStatusFromJson(
  Object? vehicleUsageReferenceStatus, [
  enums.VehicleUsageReferenceStatus? defaultValue,
]) {
  return enums.VehicleUsageReferenceStatus.values
          .firstWhereOrNull((e) => e.value == vehicleUsageReferenceStatus) ??
      defaultValue ??
      enums.VehicleUsageReferenceStatus.swaggerGeneratedUnknown;
}

enums.VehicleUsageReferenceStatus? vehicleUsageReferenceStatusNullableFromJson(
  Object? vehicleUsageReferenceStatus, [
  enums.VehicleUsageReferenceStatus? defaultValue,
]) {
  if (vehicleUsageReferenceStatus == null) {
    return null;
  }
  return enums.VehicleUsageReferenceStatus.values
          .firstWhereOrNull((e) => e.value == vehicleUsageReferenceStatus) ??
      defaultValue;
}

String vehicleUsageReferenceStatusExplodedListToJson(
    List<enums.VehicleUsageReferenceStatus>? vehicleUsageReferenceStatus) {
  return vehicleUsageReferenceStatus?.map((e) => e.value!).join(',') ?? '';
}

List<String> vehicleUsageReferenceStatusListToJson(
    List<enums.VehicleUsageReferenceStatus>? vehicleUsageReferenceStatus) {
  if (vehicleUsageReferenceStatus == null) {
    return [];
  }

  return vehicleUsageReferenceStatus.map((e) => e.value!).toList();
}

List<enums.VehicleUsageReferenceStatus> vehicleUsageReferenceStatusListFromJson(
  List? vehicleUsageReferenceStatus, [
  List<enums.VehicleUsageReferenceStatus>? defaultValue,
]) {
  if (vehicleUsageReferenceStatus == null) {
    return defaultValue ?? [];
  }

  return vehicleUsageReferenceStatus
      .map((e) => vehicleUsageReferenceStatusFromJson(e.toString()))
      .toList();
}

List<enums.VehicleUsageReferenceStatus>?
    vehicleUsageReferenceStatusNullableListFromJson(
  List? vehicleUsageReferenceStatus, [
  List<enums.VehicleUsageReferenceStatus>? defaultValue,
]) {
  if (vehicleUsageReferenceStatus == null) {
    return defaultValue;
  }

  return vehicleUsageReferenceStatus
      .map((e) => vehicleUsageReferenceStatusFromJson(e.toString()))
      .toList();
}

String? vehicleUsageUpdateStatusRequestStatusNullableToJson(
    enums.VehicleUsageUpdateStatusRequestStatus?
        vehicleUsageUpdateStatusRequestStatus) {
  return vehicleUsageUpdateStatusRequestStatus?.value;
}

String? vehicleUsageUpdateStatusRequestStatusToJson(
    enums.VehicleUsageUpdateStatusRequestStatus
        vehicleUsageUpdateStatusRequestStatus) {
  return vehicleUsageUpdateStatusRequestStatus.value;
}

enums.VehicleUsageUpdateStatusRequestStatus
    vehicleUsageUpdateStatusRequestStatusFromJson(
  Object? vehicleUsageUpdateStatusRequestStatus, [
  enums.VehicleUsageUpdateStatusRequestStatus? defaultValue,
]) {
  return enums.VehicleUsageUpdateStatusRequestStatus.values.firstWhereOrNull(
          (e) => e.value == vehicleUsageUpdateStatusRequestStatus) ??
      defaultValue ??
      enums.VehicleUsageUpdateStatusRequestStatus.swaggerGeneratedUnknown;
}

enums.VehicleUsageUpdateStatusRequestStatus?
    vehicleUsageUpdateStatusRequestStatusNullableFromJson(
  Object? vehicleUsageUpdateStatusRequestStatus, [
  enums.VehicleUsageUpdateStatusRequestStatus? defaultValue,
]) {
  if (vehicleUsageUpdateStatusRequestStatus == null) {
    return null;
  }
  return enums.VehicleUsageUpdateStatusRequestStatus.values.firstWhereOrNull(
          (e) => e.value == vehicleUsageUpdateStatusRequestStatus) ??
      defaultValue;
}

String vehicleUsageUpdateStatusRequestStatusExplodedListToJson(
    List<enums.VehicleUsageUpdateStatusRequestStatus>?
        vehicleUsageUpdateStatusRequestStatus) {
  return vehicleUsageUpdateStatusRequestStatus
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String> vehicleUsageUpdateStatusRequestStatusListToJson(
    List<enums.VehicleUsageUpdateStatusRequestStatus>?
        vehicleUsageUpdateStatusRequestStatus) {
  if (vehicleUsageUpdateStatusRequestStatus == null) {
    return [];
  }

  return vehicleUsageUpdateStatusRequestStatus.map((e) => e.value!).toList();
}

List<enums.VehicleUsageUpdateStatusRequestStatus>
    vehicleUsageUpdateStatusRequestStatusListFromJson(
  List? vehicleUsageUpdateStatusRequestStatus, [
  List<enums.VehicleUsageUpdateStatusRequestStatus>? defaultValue,
]) {
  if (vehicleUsageUpdateStatusRequestStatus == null) {
    return defaultValue ?? [];
  }

  return vehicleUsageUpdateStatusRequestStatus
      .map((e) => vehicleUsageUpdateStatusRequestStatusFromJson(e.toString()))
      .toList();
}

List<enums.VehicleUsageUpdateStatusRequestStatus>?
    vehicleUsageUpdateStatusRequestStatusNullableListFromJson(
  List? vehicleUsageUpdateStatusRequestStatus, [
  List<enums.VehicleUsageUpdateStatusRequestStatus>? defaultValue,
]) {
  if (vehicleUsageUpdateStatusRequestStatus == null) {
    return defaultValue;
  }

  return vehicleUsageUpdateStatusRequestStatus
      .map((e) => vehicleUsageUpdateStatusRequestStatusFromJson(e.toString()))
      .toList();
}

String? contractsOnboardingStatusNullableToJson(
    enums.ContractsOnboardingStatus? contractsOnboardingStatus) {
  return contractsOnboardingStatus?.value;
}

String? contractsOnboardingStatusToJson(
    enums.ContractsOnboardingStatus contractsOnboardingStatus) {
  return contractsOnboardingStatus.value;
}

enums.ContractsOnboardingStatus contractsOnboardingStatusFromJson(
  Object? contractsOnboardingStatus, [
  enums.ContractsOnboardingStatus? defaultValue,
]) {
  return enums.ContractsOnboardingStatus.values
          .firstWhereOrNull((e) => e.value == contractsOnboardingStatus) ??
      defaultValue ??
      enums.ContractsOnboardingStatus.swaggerGeneratedUnknown;
}

enums.ContractsOnboardingStatus? contractsOnboardingStatusNullableFromJson(
  Object? contractsOnboardingStatus, [
  enums.ContractsOnboardingStatus? defaultValue,
]) {
  if (contractsOnboardingStatus == null) {
    return null;
  }
  return enums.ContractsOnboardingStatus.values
          .firstWhereOrNull((e) => e.value == contractsOnboardingStatus) ??
      defaultValue;
}

String contractsOnboardingStatusExplodedListToJson(
    List<enums.ContractsOnboardingStatus>? contractsOnboardingStatus) {
  return contractsOnboardingStatus?.map((e) => e.value!).join(',') ?? '';
}

List<String> contractsOnboardingStatusListToJson(
    List<enums.ContractsOnboardingStatus>? contractsOnboardingStatus) {
  if (contractsOnboardingStatus == null) {
    return [];
  }

  return contractsOnboardingStatus.map((e) => e.value!).toList();
}

List<enums.ContractsOnboardingStatus> contractsOnboardingStatusListFromJson(
  List? contractsOnboardingStatus, [
  List<enums.ContractsOnboardingStatus>? defaultValue,
]) {
  if (contractsOnboardingStatus == null) {
    return defaultValue ?? [];
  }

  return contractsOnboardingStatus
      .map((e) => contractsOnboardingStatusFromJson(e.toString()))
      .toList();
}

List<enums.ContractsOnboardingStatus>?
    contractsOnboardingStatusNullableListFromJson(
  List? contractsOnboardingStatus, [
  List<enums.ContractsOnboardingStatus>? defaultValue,
]) {
  if (contractsOnboardingStatus == null) {
    return defaultValue;
  }

  return contractsOnboardingStatus
      .map((e) => contractsOnboardingStatusFromJson(e.toString()))
      .toList();
}

String? contractsOnboardingPersonalLicenseTypeNullableToJson(
    enums.ContractsOnboardingPersonalLicenseType?
        contractsOnboardingPersonalLicenseType) {
  return contractsOnboardingPersonalLicenseType?.value;
}

String? contractsOnboardingPersonalLicenseTypeToJson(
    enums.ContractsOnboardingPersonalLicenseType
        contractsOnboardingPersonalLicenseType) {
  return contractsOnboardingPersonalLicenseType.value;
}

enums.ContractsOnboardingPersonalLicenseType
    contractsOnboardingPersonalLicenseTypeFromJson(
  Object? contractsOnboardingPersonalLicenseType, [
  enums.ContractsOnboardingPersonalLicenseType? defaultValue,
]) {
  return enums.ContractsOnboardingPersonalLicenseType.values.firstWhereOrNull(
          (e) => e.value == contractsOnboardingPersonalLicenseType) ??
      defaultValue ??
      enums.ContractsOnboardingPersonalLicenseType.swaggerGeneratedUnknown;
}

enums.ContractsOnboardingPersonalLicenseType?
    contractsOnboardingPersonalLicenseTypeNullableFromJson(
  Object? contractsOnboardingPersonalLicenseType, [
  enums.ContractsOnboardingPersonalLicenseType? defaultValue,
]) {
  if (contractsOnboardingPersonalLicenseType == null) {
    return null;
  }
  return enums.ContractsOnboardingPersonalLicenseType.values.firstWhereOrNull(
          (e) => e.value == contractsOnboardingPersonalLicenseType) ??
      defaultValue;
}

String contractsOnboardingPersonalLicenseTypeExplodedListToJson(
    List<enums.ContractsOnboardingPersonalLicenseType>?
        contractsOnboardingPersonalLicenseType) {
  return contractsOnboardingPersonalLicenseType
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String> contractsOnboardingPersonalLicenseTypeListToJson(
    List<enums.ContractsOnboardingPersonalLicenseType>?
        contractsOnboardingPersonalLicenseType) {
  if (contractsOnboardingPersonalLicenseType == null) {
    return [];
  }

  return contractsOnboardingPersonalLicenseType.map((e) => e.value!).toList();
}

List<enums.ContractsOnboardingPersonalLicenseType>
    contractsOnboardingPersonalLicenseTypeListFromJson(
  List? contractsOnboardingPersonalLicenseType, [
  List<enums.ContractsOnboardingPersonalLicenseType>? defaultValue,
]) {
  if (contractsOnboardingPersonalLicenseType == null) {
    return defaultValue ?? [];
  }

  return contractsOnboardingPersonalLicenseType
      .map((e) => contractsOnboardingPersonalLicenseTypeFromJson(e.toString()))
      .toList();
}

List<enums.ContractsOnboardingPersonalLicenseType>?
    contractsOnboardingPersonalLicenseTypeNullableListFromJson(
  List? contractsOnboardingPersonalLicenseType, [
  List<enums.ContractsOnboardingPersonalLicenseType>? defaultValue,
]) {
  if (contractsOnboardingPersonalLicenseType == null) {
    return defaultValue;
  }

  return contractsOnboardingPersonalLicenseType
      .map((e) => contractsOnboardingPersonalLicenseTypeFromJson(e.toString()))
      .toList();
}

String? userV1UsersRolesRoleGetRoleNullableToJson(
    enums.UserV1UsersRolesRoleGetRole? userV1UsersRolesRoleGetRole) {
  return userV1UsersRolesRoleGetRole?.value;
}

String? userV1UsersRolesRoleGetRoleToJson(
    enums.UserV1UsersRolesRoleGetRole userV1UsersRolesRoleGetRole) {
  return userV1UsersRolesRoleGetRole.value;
}

enums.UserV1UsersRolesRoleGetRole userV1UsersRolesRoleGetRoleFromJson(
  Object? userV1UsersRolesRoleGetRole, [
  enums.UserV1UsersRolesRoleGetRole? defaultValue,
]) {
  return enums.UserV1UsersRolesRoleGetRole.values
          .firstWhereOrNull((e) => e.value == userV1UsersRolesRoleGetRole) ??
      defaultValue ??
      enums.UserV1UsersRolesRoleGetRole.swaggerGeneratedUnknown;
}

enums.UserV1UsersRolesRoleGetRole? userV1UsersRolesRoleGetRoleNullableFromJson(
  Object? userV1UsersRolesRoleGetRole, [
  enums.UserV1UsersRolesRoleGetRole? defaultValue,
]) {
  if (userV1UsersRolesRoleGetRole == null) {
    return null;
  }
  return enums.UserV1UsersRolesRoleGetRole.values
          .firstWhereOrNull((e) => e.value == userV1UsersRolesRoleGetRole) ??
      defaultValue;
}

String userV1UsersRolesRoleGetRoleExplodedListToJson(
    List<enums.UserV1UsersRolesRoleGetRole>? userV1UsersRolesRoleGetRole) {
  return userV1UsersRolesRoleGetRole?.map((e) => e.value!).join(',') ?? '';
}

List<String> userV1UsersRolesRoleGetRoleListToJson(
    List<enums.UserV1UsersRolesRoleGetRole>? userV1UsersRolesRoleGetRole) {
  if (userV1UsersRolesRoleGetRole == null) {
    return [];
  }

  return userV1UsersRolesRoleGetRole.map((e) => e.value!).toList();
}

List<enums.UserV1UsersRolesRoleGetRole> userV1UsersRolesRoleGetRoleListFromJson(
  List? userV1UsersRolesRoleGetRole, [
  List<enums.UserV1UsersRolesRoleGetRole>? defaultValue,
]) {
  if (userV1UsersRolesRoleGetRole == null) {
    return defaultValue ?? [];
  }

  return userV1UsersRolesRoleGetRole
      .map((e) => userV1UsersRolesRoleGetRoleFromJson(e.toString()))
      .toList();
}

List<enums.UserV1UsersRolesRoleGetRole>?
    userV1UsersRolesRoleGetRoleNullableListFromJson(
  List? userV1UsersRolesRoleGetRole, [
  List<enums.UserV1UsersRolesRoleGetRole>? defaultValue,
]) {
  if (userV1UsersRolesRoleGetRole == null) {
    return defaultValue;
  }

  return userV1UsersRolesRoleGetRole
      .map((e) => userV1UsersRolesRoleGetRoleFromJson(e.toString()))
      .toList();
}

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
