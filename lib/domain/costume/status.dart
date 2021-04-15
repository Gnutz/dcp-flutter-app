import 'package:digtial_costume_platform/domain/auth/user.dart';
import 'package:digtial_costume_platform/domain/core/institution.dart';
import 'package:digtial_costume_platform/domain/core/production.dart';

class StorageLocation {
  final Location main;
  final Location subLocation;

  StorageLocation({required this.main, required this.subLocation});
}

class Location {
  final String id;
  final String name;

  Location({required this.id, required this.name});
}

abstract class Status {}

class InStorage extends Status {
  StorageLocation location;

  InStorage(this.location);
}

class InUse extends Status {
  Production inUseFor;

  InUse(this.inUseFor);
}

class RentedOut extends Status {
  Institution rentedOutTo;
  User rentedBy;
  Production rentedFor;

  RentedOut(this.rentedOutTo, this.rentedBy, this.rentedFor);
}
