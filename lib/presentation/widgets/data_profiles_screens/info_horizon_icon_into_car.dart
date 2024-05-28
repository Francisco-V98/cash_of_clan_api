import 'package:flutter/material.dart';

class InfoHorizonIconIntoCar extends StatelessWidget {
  final bool divider;
  final String title;
  final String infoUp;
  final String infoDonw;
  final String image;
  const InfoHorizonIconIntoCar({
    super.key,
    this.divider = true,
    required this.title,
    required this.infoUp,
    this.infoDonw = '',
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Image.network(
                  image,
                  width: 40),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    infoUp,
                    style: const TextStyle(fontSize: 16),
                  ),
                  infoDonw == ''
                      ? const SizedBox.shrink()
                      : Text(infoDonw, style: const TextStyle(fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
        divider
            ? const Divider(color: Colors.black54)
            : const SizedBox.shrink(),
      ],
    );
  }
}
