import 'package:monymonky/features/notion/notion.dart';

class NotionRepositoryImpl extends NotionRepository {
  final NotionDatasource notionDatasource;

  NotionRepositoryImpl(this.notionDatasource);

  @override
  Future<List<NotionRecord>> getRecords() {
    return notionDatasource.getRecords();
  }
}