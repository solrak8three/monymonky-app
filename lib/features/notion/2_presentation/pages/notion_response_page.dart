import 'package:flutter/material.dart';
import 'package:monymonky/core/core.dart';
import 'package:monymonky/features/account_management/router/router.dart';

class NotionResponsePage extends StatelessWidget {

  static const name = 'notion_response_page';
  const NotionResponsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notion Database'),
        leading: CustomLeading(
          route: AccountRoutes.accounts,
          navigationStrategy: GoNavigation(),
        ),
      ),
      body: const _NotionResponseView(),
    );
  }
}


class _NotionResponseView extends StatelessWidget {
  const _NotionResponseView();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Body'));
  }
}
