import 'package:digtial_costume_platform/domain/auth/user.dart';
import 'package:digtial_costume_platform/domain/core/institution.dart';
import 'package:digtial_costume_platform/domain/core/production.dart';
import 'package:digtial_costume_platform/domain/costume/storage_location.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'status.g.dart';

abstract class Status{
  Map<String, dynamic> toJson();
}

@JsonSerializable(anyMap: true, explicitToJson: true)
class Undefined implements Status {
  Undefined() : super();

  factory Undefined.fromJson(Map<String, dynamic> json) =>
      _$UndefinedFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UndefinedToJson(this);
}

@JsonSerializable(anyMap: true, explicitToJson: true)
class InStorage extends Equatable implements Status{
  StorageLocation location;

  InStorage(this.location) : super();

  factory InStorage.fromJson(Map<String, dynamic> json) =>
      _$InStorageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InStorageToJson(this);

  @override
  List<Object?> get props => [location];
}

@JsonSerializable(anyMap: true, explicitToJson: true)
class InUse extends Equatable implements Status{
  Production? inUseFor;

  InUse({this.inUseFor}) : super();

  factory InUse.fromJson(Map<String, dynamic> json) => _$InUseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InUseToJson(this);

  @override
  List<Object?> get props => [inUseFor];
}

@JsonSerializable(anyMap: true, explicitToJson: true)
class RentedOut  extends Equatable implements Status{
  Institution? rentedOutTo;
  User? rentedBy;
  Production? rentedFor;

  RentedOut(this.rentedOutTo, this.rentedBy, this.rentedFor) : super();

  factory RentedOut.fromJson(Map<String, dynamic> json) =>
      _$RentedOutFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RentedOutToJson(this);

  @override
  List<Object?> get props => [rentedBy, rentedFor, rentedOutTo];

}
