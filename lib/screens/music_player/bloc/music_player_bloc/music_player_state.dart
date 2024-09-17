part of 'music_player_bloc.dart';

sealed class MusicPlayerState extends Equatable {

  const MusicPlayerState();

  @override
  List<Object?> get props => [];
}

final class PlayerStateInitial extends MusicPlayerState {}

final class PlayerStateLoading extends MusicPlayerState {
  final Song song;

  const PlayerStateLoading(this.song);

  @override
  List<Object?> get props => [song];
}

final class PlayerStateLoaded extends MusicPlayerState {
  final Song song;
  final Duration duration;
  final Duration position;
  final bool isPlayedDirectly;

  const PlayerStateLoaded(this.song, this.duration, this.position, this.isPlayedDirectly);

  @override
  List<Object?> get props => [song, duration, position, isPlayedDirectly];
}

final class PlayerStatePlaying extends MusicPlayerState {
  final Duration position;
  final bool isShuffle;
  final bool isRepeat;

  const PlayerStatePlaying(this.position, this.isShuffle, this.isRepeat);

  @override
  List<Object?> get props => [position, isShuffle, isRepeat];
}

final class PlayerStatePaused extends MusicPlayerState {
  final Duration position;
  final bool isShuffle;
  final bool isRepeat;

  const PlayerStatePaused(this.position, this.isShuffle,this.isRepeat);

  @override
  List<Object?> get props => [position, isShuffle, isRepeat];
}

final class PlayerStateCompleted extends MusicPlayerState {}


final class PlayerStateError extends MusicPlayerState {
  final String error;

  const PlayerStateError(this.error);

  @override
  List<Object?> get props => [error];

}
