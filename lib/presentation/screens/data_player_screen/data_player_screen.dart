import 'package:cash_of_clan_api/Services/models/data_player_model.dart';
import 'package:cash_of_clan_api/config/config.dart';
import 'package:cash_of_clan_api/presentation/providers/providers.dart';
import 'package:cash_of_clan_api/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataPlayerScreen extends ConsumerWidget {
  const DataPlayerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 231, 234),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 231, 234),
        titleTextStyle: const TextStyle(
          fontFamily: 'SupercellMagic',
          color: Color.fromARGB(255, 190, 114, 5),
          fontSize: 24,
          shadows: [
            Shadow(
              color: Colors.black,
              offset: Offset(0, 2),
            ),
          ],
        ),
        title: const Text('Jugador'),
        centerTitle: true,
      ),
      body: const Center(
        child: _Body(),
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(dataPlayerProvider);
    final dataPlayer = ref.watch(dataPlayerProvider).player;
    final itemsHomeVillage = ref.watch(listHomeVillageProvider);
    final itemsResourcesVillage = ref.watch(listResourcesProvider);

    if (player.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final List<HeroEquipment>? listTroops = dataPlayer?.troops;
    final List<HeroEquipment>? listHeros = dataPlayer?.heroes;
    final List<HeroEquipment>? listSpells = dataPlayer?.spells;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            infoPlayerSection(dataPlayer),
            ContainerDataProfiles(
              title: 'Campamento',
              body: [
                SectionCardsData(
                  list: itemsHomeVillage,
                  title: 'Home Village',
                ),
              ],
            ),
            ContainerDataProfiles(
              title: 'Botin',
              body: [
                SectionCardsData(
                  list: itemsResourcesVillage,
                  title: 'Recursos totales saqueados',
                  centerText: false,
                ),
              ],
            ),
            armySection(listTroops, listHeros, listSpells),
          ],
        ),
      ),
    );
  }

  Widget armySection(
    List<HeroEquipment>? listTroops,
    List<HeroEquipment>? listHeros,
    List<HeroEquipment>? listSpells,
  ) {
    List<HeroEquipment>? homeTroops = listTroops
        ?.where((equipment) => equipment.village == Village.HOME)
        .toList();
    List<HeroEquipment>? builderBaseTroops = listTroops
        ?.where((equipment) => equipment.village == Village.BUILDER_BASE)
        .toList();
    List<HeroEquipment>? homeSpells = listSpells
        ?.where((equipment) => equipment.village == Village.HOME)
        .toList();
    List<HeroEquipment>? homeVillageHero = listHeros
        ?.where((equipment) => equipment.village == Village.HOME)
        .toList();
    List<HeroEquipment>? builderBaseHero = listHeros
        ?.where((equipment) => equipment.village == Village.BUILDER_BASE)
        .toList();

    return DefaultTabController(
      length: 2,
      child: ContainerDataProfiles(
        title: 'Ejercito',
        body: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: TabBar(tabs: [
              Tab(text: 'Home Village'),
              Tab(text: 'Builder Base'),
            ]),
          ),
          SizedBox(
            height: 300,
            child: TabBarView(children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    heroEquipmentSection(homeTroops),
                    heroEquipmentSection(homeSpells),
                    heroEquipmentSection(homeVillageHero),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    heroEquipmentSection(builderBaseTroops),
                    heroEquipmentSection(builderBaseHero),
                  ],
                ),
              ),
            ]),
          ),
          // heroEquipmentSection(listTroops),
        ],
      ),
    );
  }

  Widget heroEquipmentSection(List<HeroEquipment>? listEquipment) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: listEquipment?.length,
        itemBuilder: (BuildContext context, int index) {
          final String level = listEquipment?[index].level.toString() ?? 'x';
          final String name = listEquipment?[index].name ?? 'Error name';
          return CardHeroEquipment(
            level: level,
            name: name,
          );
        },
      ),
    );
  }

  Widget infoPlayerSection(GetDataPlayerModel? dataPlayer) {
    final String? imageClan = dataPlayer?.clan?.badgeUrls?.small;
    final Clan? clanData = dataPlayer?.clan;
    return ContainerDataProfiles(
      title: 'Jugador',
      body: [
        TextH1(text: dataPlayer?.name ?? 'Error name'),
        Text(dataPlayer?.tag ?? 'Error tag'),
        InfoHorizonIconIntoCar(
          image: 'https://pixelcrux.com/Clash_of_Clans/Images/Icons/XP-p.png',
          title: 'Nivel de Experiencia',
          infoUp: dataPlayer?.expLevel.toString() ?? 'Error expLevel',
          infoDonw: '${dataPlayer?.builderBaseTrophies.toString()} XP',
        ),
        InfoHorizonIconIntoCar(
          image:
              'https://pixelcrux.com/Clash_of_Clans/Images/Icons/Trophy-p.png',
          title: 'Trofeos',
          infoUp: dataPlayer?.trophies.toString() ?? 'Error trophies',
        ),
        InfoHorizonIconIntoCar(
          image:
              'https://pixelcrux.com/Clash_of_Clans/Images/Icons/Builder_Trophy.png',
          title: 'Trofeos de Constructor',
          infoUp: dataPlayer?.builderBaseTrophies.toString() ??
              'Error builderBaseTrophies',
          infoDonw: dataPlayer?.builderBaseLeague?.name ??
              'Error builderBaseTrophies',
        ),
        clanData != null
            ? InfoHorizonIconIntoCar(
                image: imageClan ??
                    'https://pixelcrux.com/Clash_of_Clans/Images/Icons/Builder_Trophy.png',
                title: 'Clan',
                infoUp: clanData.name ?? 'Error clanName',
                infoDonw: clanData.tag ?? 'Error clanTag',
                divider: false,
              )
            : const SizedBox.shrink(),
        const SizedBox(height: 24),
        const TextH1(text: 'Cambiar Jugador', size: 20),
        const TextfieldDataProfiels(),
      ],
    );
  }



}
