import 'package:json_annotation/json_annotation.dart';

part 'production.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Production {
  @JsonKey(ignore: true)
  String? id;
  String? title;
  DateTime? startDate;
  DateTime? endDate;

  Production({this.id, this.title, this.startDate, this.endDate});

  factory Production.fromJson(Map<String, dynamic> json) =>
      _$ProductionFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionToJson(this);
}
