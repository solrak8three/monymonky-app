import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monymonky/core/config/routes/routes.dart';

class MessageWithoutAccounts extends StatelessWidget {
  const MessageWithoutAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Center(
            child: Column(
              children: [
                Text(
                  'No tienes cuentas creadas',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Text(
                  'Crea al menos una',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
              ],
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => context.go(AccountRoutes.createAccount),
            child: const Text('Crear cuenta'),
          ),
        ],
      ),
    );
  }
}