import 'package:flutter/material.dart';

class CardHeroEquipment extends StatelessWidget {
  final String level;
  final String name;
  const CardHeroEquipment({
    super.key,
    required this.level,
    required this.name,
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
                Image.network(imgError)
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                level,
                style: const TextStyle(
                    fontFamily: 'SupercellMagic', color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
