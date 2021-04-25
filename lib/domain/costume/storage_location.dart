import 'package:json_annotation/json_annotation.dart';

part 'storage_location.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class StorageLocation {
  Location? main;
  Location? subLocation;

  StorageLocation({this.main, this.subLocation});

  factory StorageLocation.fromJson(Map<String, dynamic> json) =>
      _$StorageLocationFromJson(json);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StorageLocation &&
          runtimeType == other.runtimeType &&
          main == other.main &&
          subLocation == other.subLocation;

  @override
  int get hashCode => main.hashCode ^ subLocation.hashCode;

  Map<String, dynamic> toJson() => _$StorageLocationToJson(this);
}

@JsonSerializable(anyMap: true, explicitToJson: true)
class Location {
  String? id;
  String location;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Location && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  Location({this.id, required this.location});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
