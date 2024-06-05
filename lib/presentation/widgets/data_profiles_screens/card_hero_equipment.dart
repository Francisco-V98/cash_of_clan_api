import 'package:flutter/material.dart';

class CardHeroEquipment extends StatelessWidget {
  final int level;
  final int maxLevel;
  final String name;
  const CardHeroEquipment({
    super.key,
    required this.level,
    required this.name,
    required this.maxLevel,
  });

  @override
  Widget build(BuildContext context) {
    final nameWithUnderscore = name.replaceAll(' ', '_');
    const String imgError =
        'https://developers.google.com/static/maps/documentation/streetview/images/error-image-generic.png';
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.network(
              'https://pixelcrux.com/Clash_of_Clans/Images/Attack_Icons/$nameWithUnderscore.png',
              errorBuilder: (context, error, stackTrace) =>
                  Image.network(imgError)),
        ),
        Positioned(
          bottom: 2,
          left: 2,
          child: Container(
            width: 26,
            height: 21,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      width: 23,
                      height: 18,
                      decoration: BoxDecoration(
                        color: level == maxLevel
                            ? const Color.fromARGB(255, 229, 193, 52)
                            : Colors.black,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            level.toString(),
                            style: const TextStyle(
                                fontFamily: 'SupercellMagic',
                                color: Colors.black,
                                fontSize: 18),
                          ),
                        ),
                        Center(
                          child: Text(
                            level.toString(),
                            style: const TextStyle(
                              fontFamily: 'SupercellMagic',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
