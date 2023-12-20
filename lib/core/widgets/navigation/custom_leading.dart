import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum NavigationType { go, push, pop }

class CustomLeading extends StatelessWidget {
  final String route;
  final NavigationStrategy navigationStrategy;

  const CustomLeading({
    super.key,
    required this.route,
    required this.navigationStrategy,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_sharp),
      onPressed: () => navigationStrategy.performNavigation(context, route),
    );
  }
}

abstract class NavigationStrategy {
  void performNavigation(BuildContext context, [String? route]);
}

class GoNavigation implements NavigationStrategy {
  @override
  void performNavigation(BuildContext context, [String? route]) {
    context.go(route ?? '');
  }
}

class PushNavigation implements NavigationStrategy {
  @override
  void performNavigation(BuildContext context, [String? route]) {
    context.push(route ?? '');
  }
}

class PopNavigation implements NavigationStrategy {
  @override
  void performNavigation(BuildContext context, [String? route]) {
    context.pop();
  }
}
