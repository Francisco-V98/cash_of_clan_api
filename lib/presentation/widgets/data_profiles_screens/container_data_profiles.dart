import 'package:flutter/material.dart';

class ContainerDataProfiles extends StatelessWidget {
  final String title;
  final List<Widget> body;
  const ContainerDataProfiles({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 230, 231, 234),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 2,
            color: const Color.fromARGB(255, 190, 114, 5),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 16),
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          children: [
            titleSection(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: body,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget titleSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 190, 114, 5),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 6),
              blurRadius: 6,
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'SupercellMagic',
              fontSize: 24,
              color: Colors.white,
              shadows: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
