import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:monymonky/core/config/routes/account_routes.dart';
import 'package:monymonky/core/shared/widgets/widgets.dart';
import 'package:monymonky/features/account_management/2_presentation/bloc/bloc.dart';


class CreateAccountPage extends StatelessWidget {
  static const name = 'create_account_page';

  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create account'),
      ),
      body: BlocProvider(
          create: (context) => AccountFormCubit(),
          child: const _AccountsView()
      ),
    );
  }
}

class _AccountsView extends StatelessWidget {
  const _AccountsView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),

              FlutterLogo(size: 100),

              SizedBox(height: 20,),

              _RegisterForm()
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final accountFormCubit = context.watch<AccountFormCubit>();
    final accountName = accountFormCubit.state.nameInput;
    final accountBalance = accountFormCubit.state.balanceInput;

    return BlocListener<AccountBloc, AccountState>(
      listener: (context, state) {
        if (state is AccountCreatedState) {
          context.read<AccountBloc>().add(GetAllAccountsEvent());
          context.push(AccountRoutes.accountList);
        }
      },
      child: Form(
        child: Column(
          children: [

            CustomTextFormField(
              label: 'Nombre de cuenta',
              prefixIcon: Icons.account_balance,
              onChanged: accountFormCubit.accountNameChanged,
              errorMessage: accountName.errorMessage,
            ),

            const SizedBox(height: 20,),

            CustomSlider(
              onSliderChange: accountFormCubit.accountBalanceChanged,
            ),

            const SizedBox(height: 20,),

            FilledButton.tonalIcon(
              icon: const Icon(Icons.save),
              label: const Text('Crear Cuenta'),
              onPressed: () {
                BlocProvider.of<AccountBloc>(context).add(
                  CreateAccountEvent(
                    name: accountName.value,
                    balance: accountBalance.value,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}