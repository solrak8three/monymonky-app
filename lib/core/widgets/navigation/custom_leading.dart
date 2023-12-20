import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomLeading extends StatelessWidget {
  final String route;

  const CustomLeading({
    super.key,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_sharp),
      onPressed: () => context.go(route),
    );
  }
}