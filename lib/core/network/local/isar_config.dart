import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarConfig {

  late Future<Isar> db;

  static Future<void> initializeIsar() async {

  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [],
        inspector: true,
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }
}
