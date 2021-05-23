import 'package:json_annotation/json_annotation.dart';

part 'costume_image.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class CostumeImage {
  String? id;
  String path;
  DateTime? uploaded;

  CostumeImage(
      {this.id,
      required this.path,
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
  int get hashCode => id.hashCode ^ path.hashCode ^ uploaded.hashCode;
}
