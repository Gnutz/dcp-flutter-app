import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'storage_location.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class StorageLocation extends Equatable{
  Location? main;
  Location? subLocation;

  StorageLocation({this.main, this.subLocation});

  factory StorageLocation.fromJson(Map<String, dynamic> json) =>
      _$StorageLocationFromJson(json);

  Map<String, dynamic> toJson() => _$StorageLocationToJson(this);

  @override
  List<Object?> get props => [main, subLocation];
}

@JsonSerializable(anyMap: true, explicitToJson: true)
class Location extends Equatable {
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

  @override
  List<Object?> get props => [id, location];
}
