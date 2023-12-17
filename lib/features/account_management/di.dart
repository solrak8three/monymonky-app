import 'package:get_it/get_it.dart';
import 'package:monymonky/features/account_management/1_domain/domain.dart';
import 'package:monymonky/features/account_management/2_presentation/bloc/account_bloc.dart';
import 'package:monymonky/features/account_management/3_infrastructure/infrastructure.dart';

// Registro de Datasource, Repositorio y Caso de Uso
void setupAccountManagement(GetIt locator) {
  locator.registerSingleton<AccountDatasource>(AccountDatasourceImpl());

  locator.registerSingleton<AccountRepository>(
      AccountRepositoryImpl(locator<AccountDatasource>())
  );

  locator.registerFactory(
        () => CreateAccountUseCase(locator<AccountRepository>()),
  );

  locator.registerFactory(
    () => AccountBloc(locator<CreateAccountUseCase>()),
  );
}
