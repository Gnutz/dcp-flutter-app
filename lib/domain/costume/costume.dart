import 'package:digtial_costume_platform/domain/core/production.dart';
import 'package:digtial_costume_platform/domain/costume/status.dart';
import 'package:digtial_costume_platform/domain/costume/storage_location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'costume.g.dart';

enum Fashion {
  mens,
  womens,
}

@JsonSerializable(anyMap: true, explicitToJson: true)
class Costume {
  @JsonKey(ignore: true)
  String? id;
  DateTime? edited;
  DateTime? created;
  Fashion? fashion;
  String? category;
  String? timePeriod;
  List<String>? themes;
  List<String>? colors;
  List<Production>? productions;
  int? quantity;
  StorageLocation? storageLocation;
  Status? status;

  Costume(
      {this.id,
      this.edited,
      this.created,
      this.fashion,
      this.category,
      this.timePeriod,
      this.themes,
      this.colors,
      this.productions,
      this.quantity,
      this.storageLocation,
      this.status});

  factory Costume.fromJson(Map<String, dynamic> json) =>
      _$CostumeFromJson(json);

  Map<String, dynamic> toJson() => _$CostumeToJson(this);
}
