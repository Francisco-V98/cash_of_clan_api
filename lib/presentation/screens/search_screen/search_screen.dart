import 'package:cash_of_clan_api/presentation/providers/providers.dart';
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
                    onPressed: () => context.push('/player-data'),
                  )
                : ContainerSearchProfile(
                    title: 'Buscar Clan',
                    labelInput: 'ID Clan',
                    onPressed: () => context.push('/player-data'),
                  ),
          ],
        ),
      ),
    );
  }
}

class SegmentedProfile extends ConsumerWidget {
  const SegmentedProfile({
    super.key,
    required this.currentProfileFilter,
  });

  final ProfileFilter currentProfileFilter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Seleccionar perfil:',
            style: TextStyle(color: Colors.black54)),
        const Spacer(),
        SizedBox(
          width: 210,
          child: SegmentedButton(
            segments: const [
              ButtonSegment(
                value: ProfileFilter.player,
                icon: Text('Jugador'),
              ),
              ButtonSegment(
                value: ProfileFilter.clan,
                icon: Text('Clan'),
              ),
            ],
            selected: <ProfileFilter>{currentProfileFilter},
            onSelectionChanged: (value) {
              ref.read(profileFilterProvider.notifier).state = value.first;
            },
            selectedIcon: currentProfileFilter.name == 'clan'
                ? const Icon(Icons.admin_panel_settings)
                : const Icon(Icons.person),
          ),
        ),
      ],
    );
  }
}

class ContainerSearchProfile extends StatelessWidget {
  final String title;
  final String labelInput;
  final Function()? onPressed;
  const ContainerSearchProfile({
    super.key,
    required this.title,
    required this.labelInput,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 230, 231, 234),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 2,
          color: const Color.fromARGB(255, 190, 114, 5),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 16),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 190, 114, 5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'SupercellMagic',
                    fontSize: 24,
                    color: Colors.white,
                    shadows: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Row(
              children: [
                const Text(
                  '#',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 190, 114, 5),
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  height: 56,
                  width: 266,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: labelInput,
                      hintStyle: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 190, 114, 5), width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: SizedBox(
              width: 164,
              height: 44,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 190, 114, 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 4),
                child: const Text(
                  'Buscar',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

