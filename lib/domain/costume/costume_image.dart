import 'package:json_annotation/json_annotation.dart';

part 'costume_image.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class CostumeImage {
  String? id;
  String imagePath;
  String downloadUrl;
  DateTime uploaded;

  CostumeImage(
      {this.id,
      required this.imagePath,
      required this.downloadUrl,
      required this.uploaded});

  factory CostumeImage.fromJson(Map<String, dynamic> json) =>
      _$CostumeImageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CostumeImageToJson(this);
}
