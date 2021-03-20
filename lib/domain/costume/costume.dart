import 'package:digtial_costume_platform/domain/auth/user.dart';

enum Fashion {
  mens,
  womens,
}

enum UserRoles { admin, creator, creative }

class Production {
  String title;
  DateTime startDate;
  DateTime endDate;

  Production({this.title, this.startDate, this.endDate});
}

class Costume {
  String id;

  DateTime created;
  DateTime edited;
  Fashion fashion;
  String category;
  String timeperiod;
  List<String> themes;
  List<String> colors;
  List<Production> productions;
  int quantity;
  String storageLocation;

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
  List<String> sharedWith;
  DateTime created;
  String title;
  List<Costume> costumes;

  CostumeList(
      {this.uid,
      this.owner,
      this.sharedWith,
      this.created,
      this.title,
      this.costumes});
}

class Invitation {
  String uid;
  User from;
  User to;
  String listId;
  String listTitle;
  int numberOfCostumes;

  Invitation(
      {this.from,
      this.to,
      this.uid,
      this.listId,
      this.listTitle,
      this.numberOfCostumes});
}

class Institution {
  String uid;
  String name;
  String domain;
  String alias;
}

class CreatorRoleRequest {
  User requestedBy;

  CreatorRoleRequest({this.requestedBy});
}

abstract class Status {}

class StorageLocation {
  String mainLocation;
  String subLocation;
}