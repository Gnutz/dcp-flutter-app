enum Fashion {
  Mens,
  Womens,
}

class Production {
  String title;
  DateTime startDate;
  DateTime endDate;

  Production({this.title, this.startDate, this.endDate});
}

class Costume {
  String id;

  //created
  Fashion fashion;
  String category;
  String timeperiod;
  List<String> themes;
  List<String> colors;
  List<Production> productions;
  int quantity;
  String storageLocation;

  Costume(
      {this.id,
      this.fashion,
      this.category,
      this.timeperiod,
      this.themes,
      this.colors,
      this.productions,
      this.quantity,
      this.storageLocation});
}
