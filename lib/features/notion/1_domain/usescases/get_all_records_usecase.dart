import 'package:monymonky/features/notion/notion.dart';

class GetAllRecordsUsecase {

  final NotionRepository notionRepository;

  GetAllRecordsUsecase(this.notionRepository);

  Future<List<NotionRecord>> call() async {
    return notionRepository.getRecords();
  }
}