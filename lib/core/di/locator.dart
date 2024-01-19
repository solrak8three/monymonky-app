import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:monymonky/core/network/network.dart';
import 'package:monymonky/features/account_management/di.dart';
import 'package:monymonky/features/notion/notion.dart';

final GetIt locator = GetIt.instance;

void initLocator() {
  ///-- Register core
  locator.registerSingletonAsync<Isar>(() => IsarConfig.isarInstance);
  locator.registerLazySingleton<APIDioClientNotion>(() => APIDioClientNotion());
  ///-- Register packages
  setupAccountManagement(locator);
  setupNotion(locator);
}
