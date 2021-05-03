import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'production.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Production extends Equatable {
  @JsonKey(ignore: true)
  String? id;
  String title;
  DateTime startDate;
  DateTime endDate;

  Production({this.id, required this.title, required this.startDate, required this.endDate});

  factory Production.fromJson(Map<String, dynamic> json) =>
      _$ProductionFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, startDate, endDate];
}
