import 'package:monymonky/core/core.dart';
import 'package:monymonky/features/notion/notion.dart';

class NotionDatasourceImpl extends NotionDatasource {

  final APIDioClientNotion apiClientNotion = locator<APIDioClientNotion>();

  @override
  Future<List<NotionRecord>> getRecords(final FilterDto filters) async {
    try {
      final response = await apiClientNotion.dio.post(
        '/expense/notion',
        data: filters.toJson(),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to load records with status code: ${response.statusCode}');
      }
      final notionRecordResponse = NotionRecordResponse.fromJson(response.data);
      final records = notionRecordResponse.records;
      return records.map((record) => NotionRecordMapper.toEntity(record)).toList();
    } catch(error) {
      throw Exception(error.toString());
    }
  }
}