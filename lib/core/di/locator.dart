import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  //getIt.registerLazySingleton<AuthService>(() => AuthServiceImpl());
}

// Se llamaria así
// final authService = getIt<AuthService>();
