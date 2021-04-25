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

  @JsonKey(fromJson: _statusToJsonMapper)
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
      this.status}) {
    this.productions = productions ?? <Production>[];
    this.themes = themes ?? <String>[];
    this.colors = colors ?? <String>[];
  }

  factory Costume.fromJson(Map<String, dynamic> json) =>
      _$CostumeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CostumeToJson(this);

  static Status? _statusToJsonMapper(Map<String, dynamic> json) {
    if (json.containsKey('location')) return InStorage.fromJson(json);
    if (json.containsKey('inUseFor')) return InUse.fromJson(json);
    if (json.containsKey('rentedFor')) return RentedOut.fromJson(json);
  }
}
