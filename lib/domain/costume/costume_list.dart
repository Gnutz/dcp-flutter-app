import 'costume.dart';

class CostumeList {
  String uid;
  String owner;
  List<String> sharedWith = <String>[];
  DateTime? created;
  String title;
  List<Costume> costumes = <Costume>[];

  CostumeList({required this.uid, required this.owner, required this.title});
}
