import 'package:digtial_costume_platform/domain/core/production.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Constants {
  Constants._();

  static const double padding = 20;
  static const double avatarRadius = 45;
}

class CostumeCheckOutDialog extends StatefulWidget {
  final String title, descriptions, text;

  const CostumeCheckOutDialog(
      {Key? key,
      required this.title,
      required this.descriptions,
      required this.text})
      : super(key: key);

  @override
  _CostumeCheckOutDialogState createState() => _CostumeCheckOutDialogState();
}

class _CostumeCheckOutDialogState extends State<CostumeCheckOutDialog> {
  Production? selected;
  final List<Production> productions = <Production>[
    Production(
        id: "ya",
        title: "title",
        startDate: DateTime.now(),
        endDate: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
          child: Column(
        children: <Widget>[
          const Text(
            "Zone Selection",
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          DropdownButtonFormField<Production>(
            value: selected,
            items: productions
                .map((production) => DropdownMenuItem<Production>(
                    value: production,
                    child: Text(
                        '${production.title}, ${DateFormat('dd-MM-yyyy').format(production.startDate!)} - ${DateFormat('dd-MM-yyyy').format(production.endDate!)}')))
                .toList(),
            onChanged: (val) => setState(() {
              selected = val;
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // ignore: deprecated_member_use
              RaisedButton(
                color: Colors.blue,
                onPressed: () => Navigator.of(context).pop(selected),
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                color: Colors.blue,
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
