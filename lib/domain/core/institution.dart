class Institution {
  String uid;
  String name;
  String domain;
  String? alias;

  Institution(
      {required this.uid,
      required this.domain,
      required this.name,
      this.alias});
}