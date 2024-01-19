import 'package:isar/isar.dart';

part 'notion_record.g.dart';

@collection
class NotionRecord {
  Id id = Isar.autoIncrement;

  String info;
  double price;
  String tag;
  String date;

  NotionRecord({
    required this.info,
    required this.price,
    required this.tag,
    required this.date,
  });

  @override
  String toString() {
    return 'Account{id: $id, info: $info, price: $price, tag: $tag, date: $date}';
  }
}