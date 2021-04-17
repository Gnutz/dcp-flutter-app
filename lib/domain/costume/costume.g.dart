// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'costume.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Costume _$CostumeFromJson(Map json) {
  return Costume(
    edited: json['edited'] == null
        ? null
        : DateTime.parse(json['edited'] as String),
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    fashion: _$enumDecodeNullable(_$FashionEnumMap, json['fashion']),
    category: json['category'] as String?,
    timePeriod: json['timePeriod'] as String?,
    themes:
        (json['themes'] as List<dynamic>?)?.map((e) => e as String).toList(),
    colors:
        (json['colors'] as List<dynamic>?)?.map((e) => e as String).toList(),
    productions: (json['productions'] as List<dynamic>?)
        ?.map((e) => Production.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList(),
    quantity: json['quantity'] as int?,
    storageLocation: json['storageLocation'] == null
        ? null
        : StorageLocation.fromJson(
            Map<String, dynamic>.from(json['storageLocation'] as Map)),
    status: Costume._statusToJsonMapper(json['status'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CostumeToJson(Costume instance) => <String, dynamic>{
      'edited': instance.edited?.toIso8601String(),
      'created': instance.created?.toIso8601String(),
      'fashion': _$FashionEnumMap[instance.fashion],
      'category': instance.category,
      'timePeriod': instance.timePeriod,
      'themes': instance.themes,
      'colors': instance.colors,
      'productions': instance.productions?.map((e) => e.toJson()).toList(),
      'quantity': instance.quantity,
      'storageLocation': instance.storageLocation?.toJson(),
      'status': instance.status?.toJson(),
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$FashionEnumMap = {
  Fashion.mens: 'mens',
  Fashion.womens: 'womens',
};
