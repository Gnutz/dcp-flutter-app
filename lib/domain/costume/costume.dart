import 'package:digtial_costume_platform/domain/core/production.dart';
import 'package:digtial_costume_platform/domain/costume/costume_image.dart';
import 'package:digtial_costume_platform/domain/costume/status.dart';
import 'package:digtial_costume_platform/domain/costume/storage_location.dart';
import 'package:digtial_costume_platform/shared/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'costume.g.dart';

enum Fashion {
  mens,
  womens,
}

@JsonSerializable(anyMap: true, explicitToJson: true)
@_StatusConverter()
class Costume {
  @JsonKey(ignore: true)
  String? id;
  DateTime edited;
  DateTime created;
  Fashion fashion;
  String category;
  int quantity;
  String timePeriod;
  List<String> themes;
  List<String> colors;
  List<Production> productions;

  @JsonKey(ignore: true)
  List<CostumeImage> images;

  StorageLocation? _storageLocation;

  StorageLocation? get storageLocation => _storageLocation;

  set storageLocation(StorageLocation? location) {
    if (location?.main != null && location?.subLocation != null) {
      _storageLocation = location;
      _status = InStorage(storageLocation!);
    }
  }

  Status? _status;

  Status? get status => _status;

  set status(Status? status) {
    _status = status;

    if (status is InUse) {
      _storageLocation = null;
    }
  }

  Costume(
      {this.id,
      Fashion? fashion,
      String? category,
      String? timePeriod,
      required this.created,
      int? quantity,
      required this.edited,
      List<String>? themes,
      List<String>? colors,
      List<Production>? productions,
      List<CostumeImage>? images,
      StorageLocation? storageLocation})
      : this.fashion = fashion ?? Fashion.mens,
        this.category = category ?? StringsConstants.empty,
        this.timePeriod = timePeriod ?? StringsConstants.empty,
        this.quantity = quantity ?? 1,
        this.themes = themes ?? <String>[],
        this.colors = colors ?? <String>[],
        this.productions = productions ?? <Production>[],
        this.images = images ?? <CostumeImage>[] {
    this.storageLocation = storageLocation;
  }

  factory Costume.fromJson(Map<String, dynamic> json) =>
      _$CostumeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CostumeToJson(this);
}

class _StatusConverter<T> implements JsonConverter<Status?, Object?> {
  const _StatusConverter();

  @override
  Status? fromJson(Object? json) {
    if (json is Map<String, dynamic> && json.containsKey('location'))
      return InStorage.fromJson(json);
    else if (json is Map<String, dynamic> && json.containsKey('inUseFor'))
      return InUse.fromJson(json);
  }

  @override
  Object? toJson(Status? status) {
    if (status != null) {
      return status.toJson();
    } else {
      return <String, dynamic>{};
    }
  }
}
