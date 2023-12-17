import 'package:flutter/material.dart';

class AccountListPage extends StatelessWidget {
  static const name = 'account_list_page';
  const AccountListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account List'),
      ),
      body: const _AccountListView(),
    );
  }
}

class _AccountListView extends StatelessWidget {
  const _AccountListView();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Account list'),);
  }
}