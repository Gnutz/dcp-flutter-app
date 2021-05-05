import 'package:digtial_costume_platform/domain/core/institution.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';

enum UserRole {
  creative,
  creator,
  admin,
}

@JsonSerializable(anyMap: true, explicitToJson: true)
class User {
  @JsonKey(ignore: true)
  String? id;
  String name;
  String? email;
  bool isCreative;
  bool isCreator;
  bool isAdmin;
  Institution institution;

  User(
      {this.id,
      required this.name,
      this.email,
      this.isCreative = true,
      this.isCreator = false,
      this.isAdmin = false,
      required this.institution});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
