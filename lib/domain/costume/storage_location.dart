import 'package:json_annotation/json_annotation.dart';

part 'storage_location.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class StorageLocation {
  final Location main;
  final Location subLocation;

  StorageLocation({required this.main, required this.subLocation});

  factory StorageLocation.fromJson(Map<String, dynamic> json) =>
      _$StorageLocationFromJson(json);

  Map<String, dynamic> toJson() => _$StorageLocationToJson(this);
}

@JsonSerializable(anyMap: true, explicitToJson: true)
class Location {
  @JsonKey(ignore: true)
  final String? id;
  final String name;

  Location({this.id, required this.name});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
