import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loshical/src/router/go_router_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: Loshical(),
    ),
  );
}

class Loshical extends HookConsumerWidget {
  const Loshical({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
    );
  }
}
