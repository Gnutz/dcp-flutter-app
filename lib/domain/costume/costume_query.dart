import 'package:freezed_annotation/freezed_annotation.dart';

import 'costume.dart';
import 'fashion.dart';

part 'costume_query.freezed.dart';

@freezed
class CostumeQuery with _$CostumeQuery {
  const factory CostumeQuery({
    String? production,
    Fashion? fashion,
    String? category,
    String? timePeriod,
    List<String>? themes,
    List<String>? colors,
  }) = _CostumeQuery;

  factory CostumeQuery.initial() => const CostumeQuery();
}
