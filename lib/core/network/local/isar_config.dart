import 'package:isar/isar.dart';
import 'package:monymonky/features/account_management/0_entity/entity.dart';
import 'package:path_provider/path_provider.dart';

class IsarConfig {
  static Isar? _isarInstance;

  static Future<Isar> get isarInstance async => _isarInstance ??= await openDB();

  static Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    _isarInstance ??= await Isar.open(
        [AccountSchema],
        inspector: true,
        directory: dir.path,
      );
    return _isarInstance!;
  }

  static void closeDB() {
    _isarInstance?.close();
    _isarInstance = null;
  }
}
