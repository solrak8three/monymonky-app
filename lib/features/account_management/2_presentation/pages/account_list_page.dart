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
        title: const Text('Account List'),
      ),
      body: const _AccountListView(),
    );
  }
}

class _AccountListView extends StatefulWidget {
  const _AccountListView();

  @override
  State<_AccountListView> createState() => _AccountListViewState();
}

class _AccountListViewState extends State<_AccountListView> {

  @override
  void initState() {
    super.initState();
    context.read<AccountBloc>().add(GetAllAccountsEvent());
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        if (state is AccountsLoading) {
          return const CircularProgressIndicator();
        } else if (state is AccountsLoaded) {
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
        } else if (state is AccountsError) {
          return Text('Error: ${state.message}');
        }
        return Container(); // Estado inicial o desconocido
      },
    );
  }
}