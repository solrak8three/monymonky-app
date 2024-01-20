import 'package:monymonky/features/notion/notion.dart';

class NotionRepositoryImpl extends NotionRepository {
  final NotionDatasource notionDatasource;

  NotionRepositoryImpl(this.notionDatasource);

  @override
  Future<List<NotionRecord>> getRecords(final FilterDto filters) {
    return notionDatasource.getRecords(filters);
  }
}