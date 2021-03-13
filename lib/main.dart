import 'package:digtial_costume_platform/Costume.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  IconData fashionToIcon(Fashion fashion) {
    switch (fashion) {
      case Fashion.Mens:
        return Icons.accessibility_outlined;
      case Fashion.Womens:
        return Icons.accessible_forward_sharp;
      default:
        return null;
    }
  }

  //wrapper function for creating Text list
  Widget textTemplate(String text) => Text('$text, ');

  Widget costumeTempate(costume) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Column(
        children: <Widget>[
          //Banner of id, time period, quantity and gender marker
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text('${costume.id},'),
            Text('${costume.timeperiod},'),
            Text('${costume.quantity.toString()},'),
            SizedBox(width: 50.0),
            Icon(fashionToIcon(costume.fashion))
          ]),
          Column(
            children: <Widget>[
              Row(children: [
                Text(
                  'Themes: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: costume.themes
                      .map<Widget>((theme) => textTemplate(theme))
                      .toList(),
                ),
              ]),
              Row(children: [
                Text(
                  'Colors: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: costume.colors
                      .map<Widget>((color) => textTemplate(color))
                      .toList(),
                ),
              ]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 20.0),
              IconButton(icon: Icon(Icons.add), onPressed: null),
              IconButton(icon: Icon(Icons.edit), onPressed: null),
              IconButton(icon: Icon(Icons.delete_outline), onPressed: null),
              FlatButton(onPressed: null, child: Text('Check out')),
              SizedBox(width: 20.0),
            ],
          ),
          Column(children: [
            Text('TopTen Productions: '),
            Column(
              children: costume.productions
                  .map<Widget>((production) => Text(production.title))
                  .toList(),
            ),
          ])
        ],
      ),
    );
  }

  List<Costume> costumes = [
    Costume(
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
            title: "second",
            startDate: DateTime.now(),
            endDate: DateTime.now()),
        Production(
            title: "third", startDate: DateTime.now(), endDate: DateTime.now())
      ],
      storageLocation: "Lille garderobe - 13",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).helloWorld),
        centerTitle: true,
      ),
      body: Column(
          children:
              costumes.map((costume) => costumeTempate(costume)).toList()),
    );
  }
}
