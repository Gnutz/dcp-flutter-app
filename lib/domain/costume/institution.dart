class Institution {
  String uid;
  String name;
  String domain;
  String? alias;

  Institution(
      {required this.uid,
      this.alias,
      required this.domain,
      required this.name});
}
