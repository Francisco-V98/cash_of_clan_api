import 'package:cash_of_clan_api/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ContainerAchievementsData extends StatelessWidget {
  final int? rating;
  final String title;
  final String info;
  final String completionInfo;
  final int? target;
  final int? value;
  const ContainerAchievementsData({
    super.key,
    required this.rating,
    required this.title,
    required this.info,
    required this.completionInfo,
    required this.target,
    required this.value,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(255, 193, 112, 9),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 244, 228, 207),
              borderRadius: BorderRadius.vertical(top: Radius.circular(8))
            ),
            child: Column(
              children: [
                StarRating(
                  rating: rating,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextH1(text: title, size: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    info,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  completionInfo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
          const Spacer(),
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 244, 228, 207),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 4, top: 8, left: 4, right: 4),
              child: LinearProgressIndicator(
                value: value! / target!,
                backgroundColor: const Color.fromARGB(255, 239, 153, 63),
                minHeight: 8,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final int? rating;

  const StarRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: buildStars(),
      ),
    );
  }

  Widget star(bool starFill) => Icon(
        starFill ? Icons.star_rounded : Icons.star_border_rounded,
        size: 28,
        color: const Color.fromARGB(255, 229, 193, 52),
        shadows: const [
          Shadow(blurRadius: 1, color: Colors.black54, offset: Offset(0, 2)),
        ],
      );

  List<Widget> buildStars() {
    switch (rating) {
      case 1:
        return [
          star(true),
          star(false),
          star(false),
        ];
      case 2:
        return [
          star(true),
          star(true),
          star(false),
        ];
      case 3:
        return [
          star(true),
          star(true),
          star(true),
        ];
      default:
        return [
          star(false),
          star(false),
          star(false),
        ];
    }
  }
}
