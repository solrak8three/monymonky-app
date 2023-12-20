import 'package:get_it/get_it.dart';
import 'package:monymonky/features/account_management/1_domain/domain.dart';
import 'package:monymonky/features/account_management/2_presentation/bloc/bloc.dart';
import 'package:monymonky/features/account_management/3_infrastructure/infrastructure.dart';

// Registro de Datasource, Repositorio y Caso de Uso
void setupAccountManagement(GetIt locator) {
  _registerRepositories(locator);
  _registerUseCases(locator);
  _registerBloc(locator);
}

void _registerRepositories(GetIt locator) {
  // Registro del datasource
  locator.registerSingleton<AccountDatasource>(AccountDatasourceImpl());

  // Registro del repository inyectandole el datasource
  locator.registerSingleton<AccountRepository>(
      AccountRepositoryImpl(locator<AccountDatasource>())
  );
}

void _registerUseCases(GetIt locator) {
  // Registro del caso de uso particular inyectandole su repository
  locator.registerFactory(() => CreateAccountUseCase(locator<AccountRepository>()));
  locator.registerFactory(() => GetAllAccountsUseCase(locator<AccountRepository>()));
  locator.registerFactory(() => DeleteAccountUseCase(locator<AccountRepository>()));
  locator.registerFactory(() => GetAccountUseCase(locator<AccountRepository>()));

  // Registro de la agrupación de casos de uso, inyectandole sus casos de uso
  locator.registerFactory(
    () => AccountUseCases(
      createAccountUseCase: locator<CreateAccountUseCase>(),
      getAllAccountsUseCase: locator<GetAllAccountsUseCase>(),
      deleteAccountUseCase: locator<DeleteAccountUseCase>(),
      getAccountUseCase: locator<GetAccountUseCase>(),
    ),
  );
}

void _registerBloc(GetIt locator) {
  // Registro del bloc inyectandole el grupo de casos de uso
  locator.registerLazySingleton(() => AccountBloc(locator<AccountUseCases>()));
}
