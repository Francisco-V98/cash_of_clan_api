import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class DataPlayerScreen extends ConsumerWidget {
  const DataPlayerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final idPlayer = ref.watch(textControllerProvider);
    return Scaffold(
      body: Center(
        child: Text('Soy La data del player $idPlayer'),
      ),
    );
  }
}
