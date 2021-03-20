import 'package:digtial_costume_platform/domain/auth/user.dart';
import 'package:digtial_costume_platform/presentation/auth/authenticate.dart';
import 'package:digtial_costume_platform/presentation/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
