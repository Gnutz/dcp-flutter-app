// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Production _$ProductionFromJson(Map json) {
  return Production(
    title: json['title'] as String,
    startDate: DateTime.parse(json['startDate'] as String),
    endDate: DateTime.parse(json['endDate'] as String),
  );
}

Map<String, dynamic> _$ProductionToJson(Production instance) =>
    <String, dynamic>{
      'title': instance.title,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
    };
