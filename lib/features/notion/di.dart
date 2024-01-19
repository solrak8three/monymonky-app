import 'package:get_it/get_it.dart';
import 'package:monymonky/features/notion/3_infrastructure/datasources/remote/notion_datasource_impl.dart';
import 'package:monymonky/features/notion/notion.dart';

// Cambiar nombre de método y añadirlo en /lib/core/di/locator.dart

// Registro de Datasource, Repositorio y Caso de Uso
void setupNotion(GetIt locator) {
  _registerRepositories(locator);
  _registerUseCases(locator);
  _registerBloc(locator);
}

void _registerRepositories(GetIt locator) {
  // Registro del datasource
  locator.registerSingleton<NotionDatasource>(NotionDatasourceImpl());

  // Registro del repository inyectandole el datasource
  locator.registerSingleton<NotionRepository>(
    NotionRepositoryImpl(locator<NotionDatasource>())
  );
}

void _registerUseCases(GetIt locator) {
  // Registro del caso de uso particular inyectandole su repository
  locator.registerFactory(() => GetAllRecordsUsecase(
    locator<NotionRepository>()
  ));

  // Registro de la agrupación de casos de uso, inyectandole sus casos de uso
  locator.registerFactory(
        () => NotiontUseCases(
      getAllRecordsUsecase: locator<GetAllRecordsUsecase>()
    ),
  );
}

void _registerBloc(GetIt locator) {
  // Registro del bloc inyectandole el grupo de casos de uso
  locator.registerLazySingleton(() => NotionDataCubit(locator<NotiontUseCases>()));
}
