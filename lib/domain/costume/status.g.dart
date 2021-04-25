// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InStorage _$InStorageFromJson(Map json) {
  return InStorage(
    StorageLocation.fromJson(
        Map<String, dynamic>.from(json['location'] as Map)),
  );
}

Map<String, dynamic> _$InStorageToJson(InStorage instance) => <String, dynamic>{
      'location': instance.location.toJson(),
    };

InUse _$InUseFromJson(Map json) {
  return InUse(
    inUseFor: json['inUseFor'] == null
        ? null
        : Production.fromJson(
            Map<String, dynamic>.from(json['inUseFor'] as Map)),
  );
}

Map<String, dynamic> _$InUseToJson(InUse instance) => <String, dynamic>{
      'inUseFor': instance.inUseFor?.toJson(),
    };

RentedOut _$RentedOutFromJson(Map json) {
  return RentedOut(
    json['rentedOutTo'] == null
        ? null
        : Institution.fromJson(
            Map<String, dynamic>.from(json['rentedOutTo'] as Map)),
    json['rentedBy'] == null
        ? null
        : User.fromJson(Map<String, dynamic>.from(json['rentedBy'] as Map)),
    json['rentedFor'] == null
        ? null
        : Production.fromJson(
            Map<String, dynamic>.from(json['rentedFor'] as Map)),
  );
}

Map<String, dynamic> _$RentedOutToJson(RentedOut instance) => <String, dynamic>{
      'rentedOutTo': instance.rentedOutTo?.toJson(),
      'rentedBy': instance.rentedBy?.toJson(),
      'rentedFor': instance.rentedFor?.toJson(),
    };
