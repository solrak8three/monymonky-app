import 'package:monymonky/features/notion/0_entity/entity.dart';

abstract class ExpenseDatasource {
  Future<List<NotionRecord>> getRecords();
}