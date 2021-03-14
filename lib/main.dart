import 'package:digtial_costume_platform/costume.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'details_page.dart';

void main() => runApp(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: CostumeDetail(),
    ));

class CostumeDetail extends StatefulWidget {
  @override
  _CostumeDetailState createState() => _CostumeDetailState();
}

class _CostumeDetailState extends State<CostumeDetail> {

  Costume costume = Costume(
    id: "0",
    fashion: Fashion.Mens,
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
