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
        title: const Text('Player'),
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
    final List<Achievement>? achievements = dataPlayer?.achievements;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            infoPlayerSection(dataPlayer),
            clanParticipationSection(dataPlayer),
            ContainerDataProfiles(
              title: 'Campaign',
              body: [
                SectionCardsData(
                  list: itemsHomeVillage,
                  title: 'Home Village',
                ),
              ],
            ),
            ContainerDataProfiles(
              title: 'Spoils',
              body: [
                SectionCardsData(
                  list: itemsResourcesVillage,
                  title: 'Total Resources Looted',
                  centerText: false,
                ),
              ],
            ),
            armySection(listTroops, listHeros, listSpells),
            achievementsSection(achievements),
          ],
        ),
      ),
    );
  }

  ContainerDataProfiles clanParticipationSection(
      GetDataPlayerModel? dataPlayer) {
    final String? clanIcon = dataPlayer?.clan?.badgeUrls?.medium;
    return ContainerDataProfiles(
      title: 'Clan Participation',
      body: [
        Stack(
          children: [
            clanIcon == null
                ? const SizedBox.shrink()
                : Positioned(
                    right: 0,
                    child: Opacity(
                      opacity: 0.2,
                      child: Image.network(
                        clanIcon,
                        width: 100,
                      ),
                    ),
                  ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    TextH1(
                      text: dataPlayer?.clan?.name ?? 'Error name Clan',
                      size: 20,
                    ),
                    Text(dataPlayer?.clan?.tag ?? 'Error tag'),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    children: [
                      InfoHorizonIntoCar(title: 'Role', infoUp: 'Member'),
                      InfoHorizonIntoCar(
                          title: 'Clan Wars', infoUp: 'Opted In'),
                      InfoHorizonIntoCar(
                          title: 'Troops Donated This Season', infoUp: '0'),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: TextH1(
                    text: 'Todas las Donaciones',
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget achievementsSection(List<Achievement>? achievements) {
    List<Achievement>? homeAchievements = achievements
        ?.where((equipment) => equipment.village == Village.HOME)
        .toList();
    List<Achievement>? builderBaseAchievements = achievements
        ?.where((equipment) => equipment.village == Village.BUILDER_BASE)
        .toList();

    return DefaultTabController(
      length: 2,
      child: ContainerDataProfiles(
        title: 'Achivmnts',
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
            child: TabBarView(
              children: [
                SingleChildScrollView(
                  child: achievementsGridView(homeAchievements),
                ),
                SingleChildScrollView(
                  child: achievementsGridView(builderBaseAchievements),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget achievementsGridView(List<Achievement>? achievements) {
    if (achievements == null || achievements.isEmpty) {
      return const Center(child: Text('No hay logros disponibles.'));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          mainAxisExtent: 253,
        ),
        itemCount: achievements.length,
        itemBuilder: (BuildContext context, int index) {
          return ContainerAchievementsData(
            rating: achievements[index].stars,
            title: achievements[index].name ?? 'error title',
            info: achievements[index].info ?? 'error info',
            completionInfo: achievements[index].completionInfo ?? 'Completed!',
            target: achievements[index].target,
            value: achievements[index].value,
          );
        },
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
        title: 'Army',
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
                    armyGridView(homeTroops),
                    armyGridView(homeSpells),
                    armyGridView(homeVillageHero),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    armyGridView(builderBaseTroops),
                    armyGridView(builderBaseHero),
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

  Widget armyGridView(List<HeroEquipment>? listEquipment) {
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
          final int level = listEquipment?[index].level ?? 0;
          final int maxLevel = listEquipment?[index].maxLevel ?? 0;
          final String name = listEquipment?[index].name ?? 'Error name';
          return CardHeroEquipment(
            level: level,
            name: name,
            maxLevel: maxLevel,
          );
        },
      ),
    );
  }

  Widget infoPlayerSection(GetDataPlayerModel? dataPlayer) {
    final String? imageClan = dataPlayer?.clan?.badgeUrls?.small;
    final Clan? clanData = dataPlayer?.clan;
    final String townHallLevel = dataPlayer!.townHallLevel.toString();
    return ContainerDataProfiles(
      title: 'Player',
      body: [
        Stack(
          children: [
            Positioned(
              right: 0,
              child: Opacity(
                opacity: 0.2,
                child: Image.network(
                  'https://pixelcrux.com/Clash_of_Clans/Images/Hall/Town_Hall_$townHallLevel.png',
                  width: 100,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextH1(text: dataPlayer.name ?? 'Error name'),
                        Text(dataPlayer.tag ?? 'Error tag'),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 30,
                      width: 48,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 161, 95, 3),
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 8,
                            color: Colors.black45,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 15,
                            decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 190, 114, 5),
                            borderRadius: BorderRadius.vertical(top: Radius.circular(4))
                            ),
                          ),
                          const Center(
                            child: Text(
                              'Visit',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                InfoHorizonIconIntoCar(
                  image:
                      'https://pixelcrux.com/Clash_of_Clans/Images/Icons/XP-p.png',
                  title: 'Experience Level',
                  infoUp: dataPlayer.expLevel.toString(),
                  infoDonw: '${dataPlayer.builderBaseTrophies.toString()} XP',
                ),
                InfoHorizonIconIntoCar(
                  image:
                      'https://pixelcrux.com/Clash_of_Clans/Images/Icons/Trophy-p.png',
                  title: 'Trophies',
                  infoUp: dataPlayer.trophies.toString(),
                ),
                InfoHorizonIconIntoCar(
                  image:
                      'https://pixelcrux.com/Clash_of_Clans/Images/Icons/Builder_Trophy.png',
                  title: 'Builder Trophies',
                  infoUp: dataPlayer.builderBaseTrophies.toString(),
                  infoDonw: dataPlayer.builderBaseLeague?.name ??
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
                const TextH1(text: 'Change Player', size: 20),
                const SizedBox(height: 4),
                const Text('Enter Player Tag'),
                const TextfieldDataProfiels(),
                const SizedBox(height: 4),
                const Row(
                  children: [
                    Icon(
                      Icons.help,
                      size: 16,
                      color: Color.fromARGB(255, 193, 112, 9),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'What is a player tag?',
                      style: TextStyle(color: Color.fromARGB(255, 193, 112, 9)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
