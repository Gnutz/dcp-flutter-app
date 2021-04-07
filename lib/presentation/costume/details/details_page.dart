
/*
class DetailsPage extends StatelessWidget {
  final Costume costume;

  const DetailsPage({required this.costume});

  IconData? fashionToIcon(Fashion fashion) {
    switch (fashion) {
      case Fashion.mens:
        return Icons.accessibility_outlined;
      case Fashion.womens:
        return Icons.accessible_forward_sharp;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
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
              Text('${costume.timePeriod},',
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold)),
              Text('${costume.quantity.toString()},',
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold)),
              const SizedBox(width: 50.0),
              Icon(fashionToIcon(costume.fashion!))
            ]),

            // Colors and themes, secondary information
            const SizedBox(height: 25.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Wrap(children: [
                  Text(
                    '${AppLocalizations.of(context)!.themes}: ',
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  ...costume.themes!
                      .map<Widget>((theme) => Text(
                            '$theme, ',
                            style: TextStyle(
                                fontSize: 18.0, color: Colors.grey[600]),
                          ))
                      .toList(),
                ]),
                const SizedBox(height: 10.0),
                Wrap(children: [
                  Text(
                    '${AppLocalizations.of(context)!.colors}: ',
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  ...costume.colors!
                      .map<Widget>((color) => Text(
                            '$color, ',
                            style: TextStyle(
                                fontSize: 18.0, color: Colors.grey[600]),
                          ))
                      .toList()
                ]),
              ],
            ),
            const SizedBox(height: 10.0),

            // user operations
            //TODO: needs to change depending on user dependency injection
            //TODO: add a add to list option
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 20.0),
                const IconButton(icon: Icon(Icons.add), onPressed: null),
                const IconButton(icon: Icon(Icons.edit), onPressed: null),
                const IconButton(
                    icon: Icon(Icons.delete_outline), onPressed: null),
                ElevatedButton(
                    onPressed: null,
                    child: Text(AppLocalizations.of(context)!.checkOut)),
                const SizedBox(width: 20.0),
              ],
            ),
            const SizedBox(height: 10.0),

            //Productions:
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(5.0))),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(children: [
                  Text(
                    AppLocalizations.of(context)!.productionLastTen,
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Column(children: [
                    ...costume.productions!
                        .map<Widget>((production) =>
                            ProductionCard(production: production))
                        .toList(),
                    ElevatedButton(
                        onPressed: () {},
                        child: Text(AppLocalizations.of(context)!.seeAll,
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
} */
