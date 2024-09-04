part of 'music_player_bloc.dart';

sealed class MusicPlayerState extends Equatable {

  const MusicPlayerState();

  @override
  List<Object?> get props => [];
}

final class PlayerStateInitial extends MusicPlayerState {}

final class PlayerStateLoading extends MusicPlayerState {}

final class PlayerStateLoaded extends MusicPlayerState {
  final Duration duration;
  final Duration position;

  const PlayerStateLoaded(this.duration, this.position);

  @override
  List<Object?> get props => [duration, position];
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
