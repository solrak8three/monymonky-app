import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:monymonky/core/network/local/isar_config.dart';
import 'package:monymonky/features/account_management/1_domain/domain.dart';
import 'package:monymonky/features/account_management/3_infrastructure/infrastructure.dart';

final GetIt locator = GetIt.instance;

void initLocator() {
  locator.registerSingletonAsync<Isar>(() => IsarConfig.isarInstance);

  locator.registerSingleton<AccountDatasource>(AccountDatasourceImpl());

  locator.registerSingleton<AccountRepository>(
      AccountRepositoryImpl(locator<AccountDatasource>())
  );
}
