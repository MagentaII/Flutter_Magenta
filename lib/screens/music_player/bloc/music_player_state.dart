part of 'music_player_bloc.dart';

sealed class MusicPlayerState extends Equatable {
  const MusicPlayerState();

  @override
  List<Object?> get props => [];
}

final class PlayerStateInitial extends MusicPlayerState {}

final class PlayerStatePlaying extends MusicPlayerState {
  final Song song;

  const PlayerStatePlaying(this.song);

  @override
  List<Object?> get props => [song];
}

class PlayerStatePaused extends MusicPlayerState {
  final Song song;

  const PlayerStatePaused(this.song);

  @override
  List<Object?> get props => [song];
}

class PlayerStateStopped extends MusicPlayerState {}
