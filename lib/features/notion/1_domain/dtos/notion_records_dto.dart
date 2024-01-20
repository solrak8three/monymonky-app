import 'package:monymonky/features/notion/notion.dart';

class NotionRecordsDto {
  final List<NotionRecord> records;
  final String amount;

  NotionRecordsDto({required this.records, required this.amount});
}