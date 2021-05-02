import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'costume_image.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class CostumeImage extends Equatable{
  String? id;
  String downloadUrl;
  DateTime uploaded;

  CostumeImage(
      {this.id,
      required this.downloadUrl,
      required this.uploaded});

  factory CostumeImage.fromJson(Map<String, dynamic> json) =>
      _$CostumeImageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CostumeImageToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => throw [id, downloadUrl, uploaded];


}
