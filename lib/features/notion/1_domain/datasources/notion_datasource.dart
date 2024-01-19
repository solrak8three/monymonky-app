import 'package:monymonky/features/notion/0_entity/entity.dart';

abstract class NotionDatasource {
  Future<List<NotionRecord>> getRecords();
}