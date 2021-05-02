// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'costume_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CostumeImage _$CostumeImageFromJson(Map json) {
  return CostumeImage(
    id: json['id'] as String?,
    downloadUrl: json['downloadUrl'] as String,
    uploaded: DateTime.parse(json['uploaded'] as String),
  );
}

Map<String, dynamic> _$CostumeImageToJson(CostumeImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'downloadUrl': instance.downloadUrl,
      'uploaded': instance.uploaded.toIso8601String(),
    };
