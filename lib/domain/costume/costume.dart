import 'package:digtial_costume_platform/domain/core/production.dart';
import 'package:digtial_costume_platform/domain/costume/costume_image.dart';
import 'package:digtial_costume_platform/domain/costume/status.dart';
import 'package:digtial_costume_platform/domain/costume/storage_location.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'fashion.dart';

part 'costume.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
@_StatusConverter()
class Costume extends Equatable {
  @JsonKey(ignore: true)
  String? id;
  DateTime edited;
  DateTime created;
  Fashion fashion;
  String? category;
  int quantity;
  String? timePeriod;
  @JsonKey(fromJson: tagsFromJson, toJson: tagsToJson)
  List<String> themes;
  @JsonKey(fromJson: tagsFromJson, toJson: tagsToJson)
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
      this.category,
      this.timePeriod,
      required this.created,
      int? quantity,
      required this.edited,
      List<String>? themes,
      List<String>? colors,
      List<Production>? productions,
      List<CostumeImage>? images,
      StorageLocation? storageLocation})
      : this.fashion = fashion ?? Fashion.mens,
        this.quantity = quantity ?? 1,
        this.themes = themes ?? <String>[],
        this.colors = colors ?? <String>[],
        this.productions = productions ?? <Production>[],
        this.images = images ?? <CostumeImage>[] {
    this.storageLocation = storageLocation;
  }

  factory Costume.fromJson(Map<String, dynamic> json) =>
      _$CostumeFromJson(json);

  Map<String, dynamic> toJson() => _$CostumeToJson(this);

  @override
  List<Object?> get props => [
        id,
        edited,
        created,
        fashion,
        category,
        quantity,
        timePeriod,
        themes,
        colors,
        productions,
        images,
        storageLocation,
        status
      ];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is Costume &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          edited == other.edited &&
          created == other.created &&
          fashion == other.fashion &&
          category == other.category &&
          quantity == other.quantity &&
          timePeriod == other.timePeriod &&
          themes == other.themes &&
          colors == other.colors &&
          productions == other.productions &&
          images == other.images &&
          _storageLocation == other._storageLocation &&
          _status == other._status;

  @override
  int get hashCode =>
      super.hashCode ^
      id.hashCode ^
      edited.hashCode ^
      created.hashCode ^
      fashion.hashCode ^
      category.hashCode ^
      quantity.hashCode ^
      timePeriod.hashCode ^
      themes.hashCode ^
      colors.hashCode ^
      productions.hashCode ^
      images.hashCode ^
      _storageLocation.hashCode ^
      _status.hashCode;
}

class _StatusConverter<T> implements JsonConverter<Status?, Object?> {
  const _StatusConverter();

  @override
  Status? fromJson(Object? json) {
    if (json is Map<String, dynamic> && json.containsKey('location')) {
      return InStorage.fromJson(json);
    } else if (json is Map<String, dynamic> && json.containsKey('inUseFor')) {
      return InUse.fromJson(json);
    }
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

List<String> tagsFromJson(Object? json) {
  if (json is Map<String, dynamic>) {
    List<String> tags = <String>[];
    json.forEach((key, value) {
      if (value == true) {
        tags.add(key);
      }
    });
    return tags;
  }

  return <String>[];
}

Map<String, dynamic>? tagsToJson(List<String>? tags) {
  final json = <String, bool>{};
  if (tags != null) {
    tags.forEach((tag) {
      json[tag] = true;
    });
    return json;
  }

}
