import 'package:digtial_costume_platform/Costume.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

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

  Widget costumeTemplate(costume, BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Banner of id, time period, quantity and gender marker
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text('${costume.id},',
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold)),
              Text('${costume.timeperiod},',
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold)),
              Text('${costume.quantity.toString()},',
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold)),
              SizedBox(width: 50.0),
              Icon(fashionToIcon(costume.fashion))
            ]),

            // Colors and themes, secondary information
            SizedBox(height: 25.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Wrap(children: [
                  Text(
                    '${AppLocalizations.of(context).themes}: ',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  ...(costume.themes
                      .map<Widget>((theme) => textTemplate(theme))
                      .toList()),
                ]),
                SizedBox(height: 10.0),
                Wrap(children: [
                  Text(
                    '${AppLocalizations.of(context).colors}: ',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  ...(costume.colors
                      .map<Widget>((color) => textTemplate(color))
                      .toList())
                ]),
              ],
            ),
            SizedBox(height: 10.0),

            // user operations
            //TODO: needs to change depending on user dependency injection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 20.0),
                IconButton(icon: Icon(Icons.add), onPressed: null),
                IconButton(icon: Icon(Icons.edit), onPressed: null),
                IconButton(icon: Icon(Icons.delete_outline), onPressed: null),
                RaisedButton(
                    onPressed: null,
                    child: Text(AppLocalizations.of(context).checkOut)),
                SizedBox(width: 20.0),
              ],
            ),
            SizedBox(height: 10.0),

            //Productions:
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(children: [
                  Text(
                    AppLocalizations.of(context).productionLastTen,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Column(children: [
                    ...(costume.productions
                        .map<Widget>(
                            (production) => productionTemplate(production))
                        .toList()),
                    RaisedButton(
                        onPressed: () {},
                        child: Text(AppLocalizations.of(context).seeAll,
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.grey[600])))
                    //TODO: Add link to fetch all productions
                  ]),
                ]),
              ),
            )

            //TODO: Add images section
            //FloatingActionButton(onPressed: null)
          ],
        ),
      ),
    );
  }

  //wrapper function for creating Text list
  Widget textTemplate(String text) => Text(
        '$text, ',
        style: TextStyle(fontSize: 18.0, color: Colors.grey[600]),
      );

  Widget productionTemplate(Production production) => Card(
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Text('${production.title},',
                  style: TextStyle(fontSize: 18.0, color: Colors.grey[600])),
              Text(DateFormat('dd-MM-yyyy').format(production.startDate),
                  style: TextStyle(fontSize: 18.0, color: Colors.grey[600])),
              Text(' - ',
                  style: TextStyle(fontSize: 18.0, color: Colors.grey[600])),
              Text(DateFormat('dd-MM-yyyy').format(production.endDate),
                  style: TextStyle(fontSize: 18.0, color: Colors.grey[600])),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).helloWorld),
        centerTitle: true,
      ),
      body: Column(
          children: costumes
              .map((costume) => costumeTemplate(costume, context))
              .toList()),
    );
  }
}
