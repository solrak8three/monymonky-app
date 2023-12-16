import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monymonky/core/di/locator.dart';
import 'package:monymonky/core/themes/themes.dart';
import 'package:monymonky/features/account_management/1_domain/domain.dart';
import 'package:monymonky/features/account_management/2_presentation/bloc/account_bloc.dart';
import 'package:monymonky/routes/app_router.dart';

void main() {
  initLocator();
  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AccountBloc(locator<AccountRepository>()),)
        ],
        child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      title: 'MonyMonky',
      theme: AppTheme().getTheme(),
    );
  }
}
