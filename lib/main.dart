import 'package:cash_of_clan_api/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    return MaterialApp.router(
      title: 'Cash of Clan API',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: ThemeData(colorSchemeSeed: const Color.fromARGB(255, 190, 114, 5)),
    );
  }
}


