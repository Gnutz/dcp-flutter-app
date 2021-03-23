import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/presentation/costume/details/details_page.dart';
import 'package:digtial_costume_platform/presentation/costume/edit/edit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error.toString());
            return MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: Text(snapshot.error.toString()),
            ); //TODO: change this
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: CostumeEditPage(),
            );
          }
          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: CostumeEditPage(),
          ); //TODO: change this
        });
  }
}

class CostumeDetail extends StatefulWidget {
  @override
  _CostumeDetailState createState() => _CostumeDetailState();
}

class _CostumeDetailState extends State<CostumeDetail> {

  Costume costume = Costume(
    id: "0",
    fashion: Fashion.mens,
    timeperiod: "1920",
    category: "Shirt",
    quantity: 1,
    colors: ["blue", "green"],
    themes: ['first theme', 'second theme', 'third theme', 'fourth', 'fifth'],
    productions: [
      Production(
          title: "first", startDate: DateTime.now(), endDate: DateTime.now()),
      Production(
          title: "second", startDate: DateTime.now(), endDate: DateTime.now()),
      Production(
          title: "third", startDate: DateTime.now(), endDate: DateTime.now())
    ],
    storageLocation: "Lille garderobe - 13",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).costumeDetailsFor('')),
          centerTitle: true,
        ),
        body: DetailsPage(
          costume: costume,
        ));
  }
}
