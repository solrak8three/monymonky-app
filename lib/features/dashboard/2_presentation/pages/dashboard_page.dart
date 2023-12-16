import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  static const name = 'dashboard_page';

  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MonyMonky'),
      ),
      body: const Center(
        child: Text('Dashboard page'),
      ),
    );
  }
}