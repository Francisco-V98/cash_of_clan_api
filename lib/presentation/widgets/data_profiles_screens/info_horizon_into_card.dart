import 'package:flutter/material.dart';

class InfoHorizonIntoCar extends StatelessWidget {
  final bool divider;
  final String title;
  final String infoUp;
  final String infoDonw;
  const InfoHorizonIntoCar({
    super.key,
    this.divider = true,
    required this.title,
    required this.infoUp,
    this.infoDonw = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(
            children: [
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