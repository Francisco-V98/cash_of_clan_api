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

    if (player.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            infoPlayerSection(dataPlayer),
            const SizedBox(height: 24),
            ContainerDataProfiles(
              title: 'Campamento',
              body: [
                SectionCardsData(list: itemsHomeVillage),
                SectionCardsData(list: itemsHomeVillage),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget infoPlayerSection(GetDataPlayerModel? dataPlayer) {
    return ContainerDataProfiles(
      title: 'Jugador',
      body: [
        TextH1(text: dataPlayer?.name ?? 'Error name'),
        Text(dataPlayer?.tag ?? 'Error tag'),
        InfoHorizonIconIntoCar(
          image: 'XP-p.png',
          title: 'Nivel de Experiencia',
          infoUp: dataPlayer?.expLevel.toString() ?? 'Error expLevel',
          infoDonw: '${dataPlayer?.builderBaseTrophies.toString()} XP',
        ),
        InfoHorizonIconIntoCar(
          image: 'Trophy-p.png',
          title: 'Trofeos',
          infoUp: dataPlayer?.trophies.toString() ?? 'Error trophies',
        ),
        InfoHorizonIconIntoCar(
          image: 'Builder_Trophy.png',
          title: 'Trofeos de Constructor',
          infoUp: dataPlayer?.builderBaseTrophies.toString() ??
              'Error builderBaseTrophies',
          infoDonw: dataPlayer?.builderBaseLeague?.name ??
              'Error builderBaseTrophies',
        ),
        dataPlayer!.clan != null
            ? InfoHorizonIconIntoCar(
                image: 'Builder_Trophy.png',
                title: 'Clan',
                infoUp: dataPlayer.clan?.name ?? 'Error clanName',
                infoDonw: dataPlayer.clan?.tag ?? 'Error clanTag',
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

class SectionCardsData extends StatelessWidget {
  final List list;
  const SectionCardsData({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: TextH1(text: 'Home Village', size: 20),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 150,
            ),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return ContainerDataObject(
                image: list[index].image,
                title: list[index].title,
                description: list[index].description,
              );
            },
          ),
        ),
      ],
    );
  }
}
