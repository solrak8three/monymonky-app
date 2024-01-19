import 'package:monymonky/features/notion_database/0_entity/entity.dart';

abstract class ExpenseRepository {
  Future<List<NotionRecord>> getRecords();
}