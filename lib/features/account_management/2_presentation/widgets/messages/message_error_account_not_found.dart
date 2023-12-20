import 'package:flutter/material.dart';

class MessageError extends StatelessWidget {
  final String messageError;

  const MessageError({
    super.key,
    required this.messageError,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(messageError),
    );
  }
}