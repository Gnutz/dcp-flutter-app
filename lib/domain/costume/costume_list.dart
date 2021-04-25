import 'costume.dart';

class CostumeList {
  String uid;
  String? owner;
  List<String> sharedWith = <String>[];
  DateTime? created;
  DateTime? updated;
  String title;
  List<Costume> costumes = <Costume>[];

  CostumeList({required this.uid, this.owner, required this.title});
}
