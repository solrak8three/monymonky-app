import 'package:flutter/material.dart';
import 'package:monymonky/core/di/locator.dart';
import 'package:monymonky/routes/app_router.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MonyMonky',
      routerConfig: appRouter,
    );
  }
}
