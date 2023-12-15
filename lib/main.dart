import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MonyMonky',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MonyMonky'),
        ),
        body: const Center(child: Text('Gestiona tu dinero con Monymonky')),
      ),
    );
  }
}
