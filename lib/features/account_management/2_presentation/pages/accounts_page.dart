import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:monymonky/core/widgets/navigation/custom_leading.dart';
import 'package:monymonky/features/account_management/router/router.dart';
import 'package:monymonky/features/notion/router/static_routes.dart';

class AccountsPage extends StatelessWidget {
  static const name = 'accounts_page';
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuentas'),
        leading: CustomLeading(
          route: '/',
          navigationStrategy: GoNavigation(),
        ),
      ),
      body: const _AccountsView(),
    );
  }
}

class _AccountsView extends StatelessWidget {
  const _AccountsView();

  @override
  Widget build(BuildContext context) {

    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.push(AccountRoutes.createAccount),
              child: const Text('Crear cuenta'),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                context.push(AccountRoutes.accountList);
              },
              child: const Text('Listar Cuentas'),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                context.push(NotionRoutes.notionShowDatabase);
              },
              child: const Text('Notion'),
            )
          ],
        )
    );
  }
}
