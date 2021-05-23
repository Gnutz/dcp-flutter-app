// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'costume_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CostumeImage _$CostumeImageFromJson(Map json) {
  return CostumeImage(
    id: json['id'] as String?,
    path: json['path'] as String,
    uploaded: json['uploaded'] == null
        ? null
        : DateTime.parse(json['uploaded'] as String),
  );
}

Map<String, dynamic> _$CostumeImageToJson(CostumeImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
      'uploaded': instance.uploaded?.toIso8601String(),
    };
