import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:monymonky/core/widgets/navigation/custom_leading.dart';
import 'package:monymonky/features/account_management/2_presentation/presentation.dart';
import 'package:monymonky/features/account_management/router/router.dart';

class AccountListPage extends StatelessWidget {
  static const name = 'account_list_page';
  const AccountListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuentas'),
        leading: CustomLeading(
          route: AccountRoutes.accounts,
          navigationStrategy: GoNavigation(),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(25),
        child: _AccountListView(),
      ),
    );
  }
}

class _AccountListView extends StatelessWidget {
  const _AccountListView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        if (state is AccountsLoadingState) {
          return const CustomCircularProgressIndicator();
        } else if (state is EmptyAccountListState) {
          return const MessageWithoutAccounts();
        } else if (state is AccountsLoadedState) {
          return ListView.builder(
            itemCount: state.accounts.length,
            itemBuilder: (context, index) {
              final account = state.accounts[index];
              return Column(
                children: [
                  AccountCard(account: account),
                  const SizedBox(height: 20,)
                ],
              );
            },
          );
        } else if (state is AccountsErrorState) {
          return Text('Error: ${state.message}');
        }
        return Container(); // Estado inicial o desconocido
      },
    );
  }
}