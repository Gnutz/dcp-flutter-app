import 'package:digtial_costume_platform/domain/auth/user.dart';

class Invitation {
  String? uid;
  User from;
  User to;
  String listId;
  String listTitle;
  int numberOfCostumes;

  Invitation(
      {required this.from,
      required this.to,
      this.uid,
      required this.listId,
      required this.listTitle,
      required this.numberOfCostumes});
}
