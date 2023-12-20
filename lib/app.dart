import 'package:flutter/material.dart';
import 'package:monymonky/core/themes/themes.dart';
import 'package:monymonky/routes/app_router.dart';

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