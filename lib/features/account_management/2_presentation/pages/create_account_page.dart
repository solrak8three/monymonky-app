import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monymonky/features/account_management/2_presentation/bloc/account_bloc.dart';


class CreateAccountPage extends StatelessWidget {
  static const name = 'create_account_page';
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create account'),
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
            _Form()
          ],
        )
    );
  }
}


class _Form extends StatelessWidget {
  const _Form();

  @override
  Widget build(BuildContext context) {
    String? accountName;
    final _formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nombre de la cuenta'),
              onSaved: (value) {
                accountName = value;
              },
              // Validador si es necesario...
            ),
            const SizedBox(height: 40),
            // Otros campos del formulario...
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();
                  BlocProvider.of<AccountBloc>(context).add(
                    CreateAccountEvent(
                        name: accountName!,
                        accountNumber: 'A001',
                        balance: 1000
                    ),
                  );
                }
              },
              child: const Text('Crear Cuenta'),
            ),
          ],
        ),
      ),
    );
  }
}
