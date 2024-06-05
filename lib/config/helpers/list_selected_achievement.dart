import 'package:cash_of_clan_api/Services/models/models.dart';
import 'package:cash_of_clan_api/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final listDestroyedProvider = Provider<List<Achievement>>((ref) {
  final dataPlayer = ref.watch(dataPlayerProvider).player;
  final List<Achievement>? achievements = dataPlayer?.achievements;

  return achievements!.where((achievement) {
    return [
      "Humiliator",
      "Un-Build It",
      "Wall Buster",
      "Mortar Mauler",
      "X-Bow Exterminator"
      "Firefighter"
      "Anti-Artillery"
      "Shattered and Scattered"
      "Union Buster"
      "Counterspell"
      "Monolith Masher"
    ].contains(achievement.name);
  }).toList();
});
