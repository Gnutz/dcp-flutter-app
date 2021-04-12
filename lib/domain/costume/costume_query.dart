import 'package:digtial_costume_platform/domain/core/production.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'costume.dart';

part 'costume_query.freezed.dart';

@freezed
class CostumeQuery with _$CostumeQuery {
  const factory CostumeQuery({
    Production? production,
    Fashion? fashion,
    String? category,
    String? timePeriod,
    List<String>? themes,
    List<String>? colors,
  }) = _CostumeQuery;

  factory CostumeQuery.initial() => const CostumeQuery();
}
