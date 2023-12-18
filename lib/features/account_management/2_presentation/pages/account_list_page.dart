import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monymonky/features/account_management/2_presentation/bloc/bloc.dart';

class AccountListPage extends StatelessWidget {
  static const name = 'account_list_page';
  const AccountListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuentas'),
      ),
      body: const _AccountListView(),
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
          return const CircularProgressIndicator();
        } else if (state is AccountsLoadedState) {
          return ListView.builder(
            itemCount: state.accounts.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.accounts[index].name),
                subtitle: Text('${state.accounts[index].balance}€'),
                // Otros datos de la cuenta...
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