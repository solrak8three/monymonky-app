import 'package:get_it/get_it.dart';
import 'package:monymonky/features/account_management/1_domain/domain.dart';
import 'package:monymonky/features/account_management/2_presentation/bloc/bloc.dart';
import 'package:monymonky/features/account_management/3_infrastructure/infrastructure.dart';

// Registro de Datasource, Repositorio y Caso de Uso
void setupAccountManagement(GetIt locator) {
  // Registro del datasource
  locator.registerSingleton<AccountDatasource>(AccountDatasourceImpl());

  // Registro del repository inyectandole el datasource
  locator.registerSingleton<AccountRepository>(
      AccountRepositoryImpl(locator<AccountDatasource>())
  );

  // Registro del caso de uso particular inyectandole su repository
  locator.registerFactory(
        () => CreateAccountUseCase(locator<AccountRepository>()),
  );

  // Registro de la agrupación de casos de uso, inyectandole sus casos de uso
  locator.registerFactory(
    () => AccountUseCases(
      createAccountUseCase: locator<CreateAccountUseCase>()
    ),
  );

  // Registro del bloc inyectandole el grupo de casos de uso
  locator.registerFactory(
    () => AccountBloc(locator<AccountUseCases>()),
  );
}
