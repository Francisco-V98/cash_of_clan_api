import 'package:cash_of_clan_api/presentation/screens/screens.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: '/player-data',
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: '/clan-data',
      builder: (context, state) => const SearchScreen(),
    ),
  ]);
});
