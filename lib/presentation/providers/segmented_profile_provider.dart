import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ProfileFilter { player, clan }

final profileFilterProvider = StateProvider<ProfileFilter>((ref) {
  return ProfileFilter.player;
});