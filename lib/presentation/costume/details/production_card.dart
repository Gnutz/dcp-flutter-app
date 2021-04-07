import 'package:digtial_costume_platform/domain/core/production.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductionCard extends StatelessWidget {
  final Production production;

  const ProductionCard({required this.production});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Text('${production.title},',
                style: TextStyle(fontSize: 18.0, color: Colors.grey[600])),
            Text(DateFormat('dd-MM-yyyy').format(production.startDate!),
                style: TextStyle(fontSize: 18.0, color: Colors.grey[600])),
            Text(' - ',
                style: TextStyle(fontSize: 18.0, color: Colors.grey[600])),
            Text(DateFormat('dd-MM-yyyy').format(production.endDate!),
                style: TextStyle(fontSize: 18.0, color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }
}
