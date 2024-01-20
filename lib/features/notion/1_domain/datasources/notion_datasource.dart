import 'package:monymonky/features/notion/notion.dart';

abstract class NotionDatasource {
  Future<List<NotionRecord>> getRecords(final FilterDto filters);
}