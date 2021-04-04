import 'package:digtial_costume_platform/domain/auth/user.dart';

enum Fashion {
  mens,
  womens,
}

class Production {
  String? title;
  DateTime? startDate;
  DateTime? endDate;

  Production({this.title, this.startDate, this.endDate});
}

class Costume {
  String? id;

  DateTime? created;
  DateTime? edited;
  Fashion? fashion;
  String? category;
  String? timeperiod;
  List<String>? themes;
  List<String>? colors;
  List<Production>? productions;
  int? quantity;
  String? storageLocation;

  Costume(
      {this.id,
      this.fashion,
      this.category,
      this.timeperiod,
      this.themes,
      this.colors,
      this.productions,
      this.quantity,
      this.storageLocation});
}

class CostumeList {
  String uid;
  String owner;
  List<String> sharedWith = <String>[];
  DateTime? created;
  String title;
  List<Costume> costumes = <Costume>[];

  CostumeList({required this.uid, required this.owner, required this.title});
}

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


class CreatorRoleRequest {
  User requestedBy;

  CreatorRoleRequest({required this.requestedBy});
}

abstract class Status {}
