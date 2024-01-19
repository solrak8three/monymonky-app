import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:monymonky/core/network/network.dart';
import 'package:monymonky/core/network/remote/api_dio_client_notion.dart';
import 'package:monymonky/core/repository/dio_http_notion_repository.dart';
import 'package:monymonky/core/repository/repository.dart';
import 'package:monymonky/features/account_management/di.dart';
import 'package:monymonky/features/notion/notion.dart';

final GetIt locator = GetIt.instance;

void initLocator() {
  locator.registerSingletonAsync<Isar>(() => IsarConfig.isarInstance);
  locator.registerLazySingleton<APIDioClientNotion>(() => APIDioClientNotion());
  locator.registerLazySingleton<HttpRepository>(() => DioHttpNotionRepository(locator<APIDioClientNotion>()));


  setupAccountManagement(locator);
  setupNotion(locator);
}
