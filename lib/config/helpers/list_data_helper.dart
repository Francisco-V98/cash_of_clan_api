import 'package:cash_of_clan_api/Services/models/data_player_model.dart';
import 'package:cash_of_clan_api/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Item {
  final String title;
  final String image;
  final String description;
  final String? name;

  Item({
    required this.title,
    required this.image,
    required this.description,
    this.name, 
  });
}

const String baseUrl = 'https://pixelcrux.com/Clash_of_Clans/Images';

final listHomeVillageProvider = Provider<List<Item>>((ref) {
  final dataPlayer = ref.watch(dataPlayerProvider).player;

  return [
    Item(
      title: 'Town Hall',
      image: '$baseUrl/Hall/Town_Hall_${dataPlayer?.townHallLevel.toString()}.png',
      description: 'Nivel ${dataPlayer?.townHallLevel.toString()}',
    ),
    Item(
      title: 'Trophies',
      image: '$baseUrl/Icons/Trophy.png',
      description: dataPlayer?.trophies.toString() ?? 'Error trophies',
    ),
    Item(
      title: 'Highest Trophies',
      image: '$baseUrl/Icons/Trophy_Best.png',
      description: dataPlayer?.bestTrophies.toString() ?? 'Error bestTrophies',
    ),
    Item(
      title: 'Total Attack Wins',
      image: '$baseUrl/Icons/Attack_Barbarian.png',
      description: 'item 4.',
    ),
    Item(
      title: 'Total Defense Wins',
      image: '$baseUrl/Icons/Shield_1.png',
      description: 'item 5.',
    ),
  ];
});

final listResourcesProvider = Provider<List<Item>>((ref) {
  final dataPlayer = ref.watch(dataPlayerProvider).player;
  return [
    Item(
      title: 'Gold',
      image: '$baseUrl/Icons/Gold.png',
      description: 'Nivel ${dataPlayer?.townHallLevel.toString()}',
      name: 'Gold Grab'
    ),
    Item(
      title: 'Elixir',
      image: '$baseUrl/Icons/Elixir.png',
      description: dataPlayer?.trophies.toString() ?? 'Error trophies',
      name: 'Elixir Escapade'
    ),
    Item(
      title: 'Dark Elixir',
      image: '$baseUrl/Icons/Dark_Elixir.png',
      description: dataPlayer?.bestTrophies.toString() ?? 'Error bestTrophies',
      name: 'Heroic Heist'
    ),
  ];
});


