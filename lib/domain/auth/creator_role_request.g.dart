// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creator_role_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatorRoleRequest _$CreatorRoleRequestFromJson(Map json) {
  return CreatorRoleRequest(
    requestedBy:
        User.fromJson(Map<String, dynamic>.from(json['requestedBy'] as Map)),
  );
}

Map<String, dynamic> _$CreatorRoleRequestToJson(CreatorRoleRequest instance) =>
    <String, dynamic>{
      'requestedBy': instance.requestedBy.toJson(),
    };
