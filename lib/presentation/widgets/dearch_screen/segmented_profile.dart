import 'package:cash_of_clan_api/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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