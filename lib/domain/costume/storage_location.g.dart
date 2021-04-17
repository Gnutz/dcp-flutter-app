// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StorageLocation _$StorageLocationFromJson(Map json) {
  return StorageLocation(
    main: Location.fromJson(Map<String, dynamic>.from(json['main'] as Map)),
    subLocation: Location.fromJson(
        Map<String, dynamic>.from(json['subLocation'] as Map)),
  );
}

Map<String, dynamic> _$StorageLocationToJson(StorageLocation instance) =>
    <String, dynamic>{
      'main': instance.main.toJson(),
      'subLocation': instance.subLocation.toJson(),
    };

Location _$LocationFromJson(Map json) {
  return Location(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
    };
