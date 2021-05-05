// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map json) {
  return User(
    name: json['name'] as String,
    email: json['email'] as String?,
    isCreative: json['isCreative'] as bool,
    isCreator: json['isCreator'] as bool,
    isAdmin: json['isAdmin'] as bool,
    institution: Institution.fromJson(
        Map<String, dynamic>.from(json['institution'] as Map)),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'isCreative': instance.isCreative,
      'isCreator': instance.isCreator,
      'isAdmin': instance.isAdmin,
      'institution': instance.institution.toJson(),
    };
