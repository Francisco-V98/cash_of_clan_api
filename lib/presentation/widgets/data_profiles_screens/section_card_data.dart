import 'package:cash_of_clan_api/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SectionCardsData extends StatelessWidget {
  final List list;
  final String title;
  final bool centerText;
  const SectionCardsData({
    super.key,
    required this.list,
    required this.title,
    this.centerText = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextH1(text: title, size: 20, centerText: centerText),
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
              mainAxisExtent: 136,
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
