import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'costume_image.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class CostumeImage {
  String? id;
  String downloadUrl;
  DateTime uploaded;

  CostumeImage(
      {this.id,
      required this.downloadUrl,
      required this.uploaded});

  factory CostumeImage.fromJson(Map<String, dynamic> json) =>
      _$CostumeImageFromJson(json);

  Map<String, dynamic> toJson() => _$CostumeImageToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CostumeImage &&
          id == other.id;

  @override
  int get hashCode => id.hashCode ^ downloadUrl.hashCode ^ uploaded.hashCode;
}
