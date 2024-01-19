import 'package:monymonky/features/notion_database/0_entity/entity.dart';

abstract class ExpenseDatasource {
  Future<List<NotionRecord>> getRecords();
}