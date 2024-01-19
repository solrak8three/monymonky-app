import 'package:monymonky/features/notion/notion.dart';

class NotionRecordMapper {
  static NotionRecord toEntity(Record record) =>
      NotionRecord(
          info: record.info,
          price: record.price,
          tag: record.tag,
          date: record.date.toLocal().toString(),
      );
}
