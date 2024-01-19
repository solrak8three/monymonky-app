// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:monymonky/core/widgets/navigation/custom_leading.dart';
import 'package:monymonky/features/account_management/0_entity/account.dart';
import 'package:monymonky/features/account_management/2_presentation/presentation.dart';
import 'package:monymonky/features/account_management/router/router.dart';


class EditAccountPage extends StatelessWidget {
  static const name = 'edit_account_page';

  const EditAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar cuenta'),
        leading: CustomLeading(
            route: AccountRoutes.accountList,
            navigationStrategy: GoNavigation(),
        ),
      ),
      body: const _BodyBloc(),
    );
  }
}

class _BodyBloc extends StatelessWidget {
  const _BodyBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountBloc, AccountState>(
        listener: (context, state) {
          // TODO...
        },
        builder: (context, state) {
          if (state is AccountsLoadingState) {
            return const CustomCircularProgressIndicator();
          } else if (state is AccountLoadedState) {
            return _AccountEditView(account: state.account);
          } else if (state is AccountsErrorState){
            return MessageError(messageError: state.message);
          }
          return const Text('Error inesperado');
        },
    );
  }
}

class _AccountEditView extends StatelessWidget {
  final Account account;

  const _AccountEditView({
    required this.account,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('data: ${account.name}'),
    );
  }
}
