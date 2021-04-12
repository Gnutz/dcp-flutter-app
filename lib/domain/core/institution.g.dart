// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Institution _$InstitutionFromJson(Map json) {
  return Institution(
    uid: json['uid'] as String?,
    name: json['name'] as String,
    domain: json['domain'] as String?,
    alias: json['alias'] as String?,
  );
}

Map<String, dynamic> _$InstitutionToJson(Institution instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'domain': instance.domain,
      'alias': instance.alias,
    };
