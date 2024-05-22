import 'package:cash_of_clan_api/presentation/providers/providers.dart';
import 'package:cash_of_clan_api/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 231, 234),
      body: _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentProfileFilter = ref.watch(profileFilterProvider);
    final dataPlayer = ref.watch(dataPlayerProvider);
    final TextEditingController controller = TextEditingController();

    if (dataPlayer.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 64),
              child: Image.network('https://i.imgur.com/RympLgO.png'),
            ),
            SegmentedProfile(currentProfileFilter: currentProfileFilter),
            const SizedBox(height: 8),
            currentProfileFilter.name == 'player'
                ? ContainerSearchProfile(
                    title: 'Buscar Jugador',
                    labelInput: 'ID Jugador',
                    controller: controller,
                    onPressed: () {
                      context.push('/player-data');
                      ref
                          .read(textControllerProvider.notifier)
                          .update((state) => controller.text);
                    })
                : ContainerSearchProfile(
                    title: 'Buscar Clan',
                    labelInput: 'ID Clan',
                    controller: controller,
                    onPressed: () {
                      context.push('/clan-data');
                    }),
          ],
        ),
      ),
    );
  }
}
