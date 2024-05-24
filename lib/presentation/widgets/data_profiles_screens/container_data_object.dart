import 'package:cash_of_clan_api/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ContainerDataObject extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const ContainerDataObject({
    super.key,
    required this.image, required this.title, required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(255, 244, 228, 207),
        border: Border.all(
          width: 2,
          color: const Color.fromARGB(255, 190, 114, 5),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 4,
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 80,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 244, 244, 240),
              borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                image,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Column(
              children: [
                TextH1(text: title, size: 16),
                Text(description)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
