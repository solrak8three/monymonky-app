// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:monymonky/core/widgets/navigation/custom_leading.dart';
import 'package:monymonky/features/account_management/router/router.dart';


class EditAccountPage extends StatelessWidget {
  static const name = 'edit_account_page';

  final String accountNumber;

  const EditAccountPage({
    super.key,
    required this.accountNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar cuenta'),
        leading: const CustomLeading(route: AccountRoutes.accountList),
      ),
      body: const _AccountsView(),
    );
  }
}

class _AccountsView extends StatelessWidget {
  const _AccountsView();

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Editar cuenta'),
          ],
        )
    );
  }
}
