
import 'package:digtial_costume_platform/presentation/core/theme.dart';
import 'package:digtial_costume_platform/shared/string_extension.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String costumeCategory;

  const CategoryCard({Key? key, required this.costumeCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColorTheme.inputDecoratorFocusedBorderOutlineSideColor,
      child: Center(
        child: Column(
          children: [
            Expanded(
                child: Image.asset(
                    "images/icons/costume_categories/$costumeCategory.png")),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Text(costumeCategory..capitalize(),
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: MyColorTheme.buttonTextColor)),
            ),
          ],
        ),
      ),
    );
  }
}