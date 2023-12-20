import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:monymonky/core/di/locator.dart';

import 'package:monymonky/features/account_management/2_presentation/presentation.dart';
import 'package:monymonky/features/account_management/router/router.dart';


class CreateAccountPage extends StatelessWidget {
  static const name = 'create_account_page';

  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create account'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_sharp),
          onPressed: () => context.go(AccountRoutes.accounts),
        ),
      ),
      body: BlocProvider(
          create: (context) => AccountFormCubit(locator<AccountBloc>()),
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

              RegisterForm()
            ],
          ),
        ),
      ),
    );
  }
}