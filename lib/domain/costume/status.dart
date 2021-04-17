import 'package:digtial_costume_platform/domain/auth/user.dart';
import 'package:digtial_costume_platform/domain/core/institution.dart';
import 'package:digtial_costume_platform/domain/core/production.dart';
import 'package:digtial_costume_platform/domain/costume/storage_location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'status.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
abstract class Status {}

@JsonSerializable(anyMap: true, explicitToJson: true)
class InStorage extends Status {
  StorageLocation? location;

  InStorage(this.location);

  factory InStorage.fromJson(Map<String, dynamic> json) =>
      _$InStorageFromJson(json);

  Map<String, dynamic> toJson() => _$InStorageToJson(this);
}

@JsonSerializable(anyMap: true, explicitToJson: true)
class InUse extends Status {
  Production? inUseFor;

  InUse(this.inUseFor);

  factory InUse.fromJson(Map<String, dynamic> json) => _$InUseFromJson(json);

  Map<String, dynamic> toJson() => _$InUseToJson(this);
}

@JsonSerializable(anyMap: true, explicitToJson: true)
class RentedOut extends Status {
  Institution? rentedOutTo;
  User? rentedBy;
  Production? rentedFor;

  RentedOut(this.rentedOutTo, this.rentedBy, this.rentedFor);

  factory RentedOut.fromJson(Map<String, dynamic> json) =>
      _$RentedOutFromJson(json);

  Map<String, dynamic> toJson() => _$RentedOutToJson(this);
}
