import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monymonky/features/account_management/router/router.dart';

class DashboardPage extends StatelessWidget {
  static const name = 'dashboard_page';

  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MonyMonky'),
      ),
      body: const _DashboardView(),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                context.go(AccountRoutes.accounts);
              },
              child: const Text('Accounts'),
          )
        ],
      )
    );
  }
}