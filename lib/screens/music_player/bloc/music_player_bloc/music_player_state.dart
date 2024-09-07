part of 'music_player_bloc.dart';

sealed class MusicPlayerState extends Equatable {

  const MusicPlayerState();

  @override
  List<Object?> get props => [];
}

final class PlayerStateInitial extends MusicPlayerState {}

final class PlayerStateLoading extends MusicPlayerState {}

final class PlayerStateLoaded extends MusicPlayerState {
  final Song song;
  final Duration duration;
  final Duration position;

  const PlayerStateLoaded(this.song, this.duration, this.position);

  @override
  List<Object?> get props => [song, duration, position];
}

final class PlayerStatePlaying extends MusicPlayerState {
  final Duration position;

  const PlayerStatePlaying(this.position);

  @override
  List<Object?> get props => [position];
}

final class PlayerStatePaused extends MusicPlayerState {
  final Duration position;

  const PlayerStatePaused(this.position);

  @override
  List<Object?> get props => [position];
}

final class PlayerStateCompleted extends MusicPlayerState {}

final class PlayerStateShuffleStatus extends MusicPlayerState {
  final bool isShuffled;

  const PlayerStateShuffleStatus(this.isShuffled);
}

final class PlayerStateRepeatStatus extends MusicPlayerState {
  final bool isRepeating;

  const PlayerStateRepeatStatus(this.isRepeating);
}

// final class PlayerStateStopped extends MusicPlayerState {
//   const PlayerStateStopped({
//     required super.song,
//   });
// }
//
// final class PlayerStateSeeking extends MusicPlayerState {
//   const PlayerStateSeeking({
//     required super.song,
//     required super.position,
//   });
// }


final class PlayerStateError extends MusicPlayerState {
  final String error;

  const PlayerStateError(this.error);

  @override
  List<Object?> get props => [error];

}
