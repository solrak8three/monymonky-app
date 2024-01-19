import 'package:monymonky/features/notion/0_entity/notion_record.dart';
import 'package:monymonky/features/notion/1_domain/domain.dart';

class NotionDatasourceImpl extends NotionDatasource {

  // TODO... Establecer conexión con DIO y llamar a Notion.

  @override
  Future<List<NotionRecord>> getRecords() async {
    await Future.delayed(const Duration(seconds: 2));
    return _mockRecords();
  }


  List<NotionRecord>_mockRecords() => [
    NotionRecord(
      info: 'Esto es una prueba',
      price: 3.25,
      tag: 'prueba',
      date: '19-01-2024',
    ),
    NotionRecord(
      info: 'Hakunna Mattata',
      price: 5.30,
      tag: 'africa',
      date: '18-01-2024',
    )
  ];
}