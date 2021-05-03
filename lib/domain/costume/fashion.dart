enum Fashion {
  mens,
  womens,
}

class FashionEnumToStringMapper {
  static final _fashionMap = {Fashion.mens: "mens", Fashion.womens: "womens"};

  static String? fashionToString(Fashion fashion) {
    return _fashionMap[fashion];
  }
}
