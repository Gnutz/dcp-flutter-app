import 'package:digtial_costume_platform/domain/auth/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'creator_role_request.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class CreatorRoleRequest {
  User requestedBy;

  CreatorRoleRequest({required this.requestedBy});

  Map<String, dynamic> toJson() => _$CreatorRoleRequestToJson(this);
}
