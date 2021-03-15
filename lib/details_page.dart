import 'package:digtial_costume_platform/production_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'costume.dart';

class DetailsPage extends StatelessWidget {
  final Costume costume;

  DetailsPage({this.costume});

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

  @override
  Widget build(BuildContext context) {
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
                      .map<Widget>((theme) => Text(
                            '$theme, ',
                            style: TextStyle(
                                fontSize: 18.0, color: Colors.grey[600]),
                          ))
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
                      .map<Widget>((color) => Text(
                            '$color, ',
                            style: TextStyle(
                                fontSize: 18.0, color: Colors.grey[600]),
                          ))
                      .toList())
                ]),
              ],
            ),
            SizedBox(height: 10.0),

            // user operations
            //TODO: needs to change depending on user dependency injection
            //TODO: add a add to list option
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 20.0),
                IconButton(icon: Icon(Icons.add), onPressed: null),
                IconButton(icon: Icon(Icons.edit), onPressed: null),
                IconButton(icon: Icon(Icons.delete_outline), onPressed: null),
                ElevatedButton(
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
                        .map<Widget>((production) =>
                            ProductionCard(production: production))
                        .toList()),
                    ElevatedButton(
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
}
