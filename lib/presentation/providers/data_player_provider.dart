import 'package:cash_of_clan_api/Services/Services/data_profile_service.dart';
import 'package:cash_of_clan_api/Services/models/data_player_model.dart';
import 'package:cash_of_clan_api/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dataPlayerProvider =
    StateNotifierProvider<DataPlayerNotifier, DataPlayerState>((ref) {
  final valueTextController = ref.watch(textControllerProvider);
  return DataPlayerNotifier(valueTextController);
});

class DataPlayerNotifier extends StateNotifier<DataPlayerState> {
  final String idValue;
  DataPlayerNotifier(this.idValue) : super(DataPlayerState());

  Future<void> getDataPlayer() async {
    state = state.copyWith(isLoading: true);

    try {
      final getPlayer = await DataProfileService().getDataPlayer(idValue);
      state = state.copyWith(isLoading: false, player: getPlayer);
    } catch (error) {
      ('Error al obtener la data del player: $error');
      state = state.copyWith(isLoading: true);
    }
  }
}

class DataPlayerState {
  final GetDataPlayerModel? player;
  final bool isLoading;

  DataPlayerState({
    this.player,
    this.isLoading = false,
  });

  DataPlayerState copyWith({
    GetDataPlayerModel? player,
    bool? isLoading,
  }) =>
      DataPlayerState(
        player: player ?? this.player,
        isLoading: isLoading ?? this.isLoading,
      );
}
