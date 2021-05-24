import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'institution.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Institution extends Equatable{
  String? id;
  String name;
  String? domain;
  String? alias;

  Institution(
      {this.id,
      required this.name,
      this.domain,
      this.alias});

  factory Institution.fromJson(Map<String, dynamic> json) =>
      _$InstitutionFromJson(json);

  Map<String, dynamic> toJson() => _$InstitutionToJson(this);

  @override
  List<Object?> get props => [id, name, domain, alias];
}