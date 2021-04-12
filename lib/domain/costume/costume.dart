import 'package:digtial_costume_platform/domain/core/production.dart';
import 'package:digtial_costume_platform/domain/costume/status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'costume.freezed.dart';

enum Fashion {
  mens,
  womens,
}

@freezed
class Costume with _$Costume {
  const factory Costume(
      {String? id,
      DateTime? edited,
      DateTime? created,
      Fashion? fashion,
      String? category,
      String? timePeriod,
      List<String>? themes,
      List<String>? colors,
      List<Production>? productions,
      int? quantity,
      StorageLocation? storageLocation,
      Status? status}) = _Costume;
}
