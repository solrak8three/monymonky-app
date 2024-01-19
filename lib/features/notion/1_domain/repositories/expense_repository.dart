import 'package:monymonky/features/notion/0_entity/entity.dart';

abstract class ExpenseRepository {
  Future<List<NotionRecord>> getRecords();
}