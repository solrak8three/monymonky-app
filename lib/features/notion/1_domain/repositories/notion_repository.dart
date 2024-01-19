import 'package:monymonky/features/notion/0_entity/entity.dart';

abstract class NotionRepository {
  Future<List<NotionRecord>> getRecords();
}