// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Institution _$InstitutionFromJson(Map json) {
  return Institution(
    name: json['name'] as String,
    domain: json['domain'] as String?,
    alias: json['alias'] as String?,
  )..id = json['id'] as String?;
}

Map<String, dynamic> _$InstitutionToJson(Institution instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'domain': instance.domain,
      'alias': instance.alias,
    };
