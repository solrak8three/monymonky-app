import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monymonky/features/account_management/0_entity/entity.dart';
import 'package:monymonky/features/account_management/router/router.dart';

class AccountCard extends StatelessWidget {
  final Account account;

  const AccountCard({
    super.key,
    required this.account,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(AccountRoutes.editACcount(account.accountNumber));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListTile(
                  title: Text(account.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  subtitle: Text('${account.balance}€', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                  // Otros datos de la cuenta...
                ),
              ),
              const Icon(Icons.edit),
            ],
          ),
        ),
      ),
    );
  }
}

/*//Todo...
* locator<AccountBloc>()
            .add(DeleteAccountEvent(accountNumber: account.accountNumber));*/