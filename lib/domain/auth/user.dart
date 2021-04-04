import 'package:digtial_costume_platform/domain/costume/institution.dart';

enum UserRole {
  creative,
  creator,
  admin,
}

class User {
  String? uid;
  String? name;
  String? email;
  bool isCreative;
  bool isCreator;
  bool isAdmin;
  Institution? institution;

  User(
      {this.uid,
      this.name,
      this.email,
      this.isCreative = true,
      this.isCreator = false,
      this.isAdmin = false,
      this.institution});
}
