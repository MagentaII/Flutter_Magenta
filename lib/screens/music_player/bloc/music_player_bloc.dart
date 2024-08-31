import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_magenta/screens/music_player/helper/player_helper.dart';

import '../models/song.dart';

part 'music_player_event.dart';

part 'music_player_state.dart';

class MusicPlayerBloc extends Bloc<MusicPlayerEvent, MusicPlayerState> {
  final PlayerHelper _playerHelper = PlayerHelper();

  MusicPlayerBloc() : super(PlayerStateInitial()) {
    on<PlaySong>(_playSong);
    on<PauseSong>(_pauseSong);
    on<StopSong>(_stopSong);
  }

  Future<void> _playSong(
    PlaySong event,
    Emitter<MusicPlayerState> emit,
  ) async {
    try {
      await _playerHelper.play(event.song.audioPath);
      emit(PlayerStatePlaying(event.song));
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  Future<void> _pauseSong(
    PauseSong event,
    Emitter<MusicPlayerState> emit,
  ) async {
    if (state is PlayerStatePlaying) {
      await _playerHelper.pause();
      emit(PlayerStatePaused((state as PlayerStatePlaying).song));
    }
  }

  Future<void> _stopSong(
    StopSong event,
    Emitter<MusicPlayerState> emit,
  ) async {
    await _playerHelper.stop();
    emit(PlayerStateStopped());
  }
}
