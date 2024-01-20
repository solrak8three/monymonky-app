import 'package:monymonky/features/notion/notion.dart';

abstract class NotionRepository {
  Future<List<NotionRecord>> getRecords(final FilterDto filters);
}