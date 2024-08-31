part of 'music_player_bloc.dart';

sealed class MusicPlayerEvent extends Equatable {
  const MusicPlayerEvent();
}

final class PlaySong extends MusicPlayerEvent {
  final Song song;

  const PlaySong(this.song);

  @override
  List<Object?> get props => [song];
}

final class PauseSong extends MusicPlayerEvent {
  @override
  List<Object?> get props => [];
}

class StopSong extends MusicPlayerEvent {
  @override
  List<Object?> get props => [];
}
