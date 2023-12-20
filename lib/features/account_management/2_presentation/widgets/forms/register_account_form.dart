import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:monymonky/core/config/routes/routes.dart';
import 'package:monymonky/core/shared/widgets/widgets.dart';
import 'package:monymonky/features/account_management/2_presentation/presentation.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

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
              label: const Text('Guardar'),
              onPressed: accountFormCubit.onSubmit,
            ),
          ],
        ),
      ),
    );
  }
}