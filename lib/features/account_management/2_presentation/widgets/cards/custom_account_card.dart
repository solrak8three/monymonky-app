import 'package:flutter/material.dart';
import 'package:monymonky/core/di/locator.dart';
import 'package:monymonky/features/account_management/0_entity/entity.dart';
import 'package:monymonky/features/account_management/2_presentation/presentation.dart';

class AccountCard extends StatelessWidget {
  final Account account;

  const AccountCard({
    super.key,
    required this.account,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
            IconButton.outlined(
              onPressed: () {
                locator<AccountBloc>()
                    .add(DeleteAccountEvent(accountNumber: account.accountNumber));
              },
              icon: const Icon(Icons.delete_forever),
            ),
          ],
        ),
      ),
    );
  }
}