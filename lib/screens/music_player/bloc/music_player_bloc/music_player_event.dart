part of 'music_player_bloc.dart';

sealed class MusicPlayerEvent extends Equatable {
  const MusicPlayerEvent();

  @override
  List<Object?> get props => [];
}


final class LoadingSong extends MusicPlayerEvent {
  final Song song;

  const LoadingSong(this.song);

  @override
  List<Object?> get props => [song];
}


final class PlaySong extends MusicPlayerEvent {
  final Duration position;

  const PlaySong({this.position = Duration.zero});

  @override
  List<Object?> get props => [position];
}


final class UpdatePosition extends MusicPlayerEvent {
  final Duration position;

  const UpdatePosition(this.position);

  @override
  List<Object?> get props => [position];
}

final class PauseSong extends MusicPlayerEvent {
  final Duration position;

  const PauseSong(this.position);

  @override
  List<Object?> get props => [position];
}

final class ResumeSong extends MusicPlayerEvent {
  final Duration position;

  const ResumeSong(this.position);

  @override
  List<Object?> get props => [position];
}

final class SeekToPosition extends MusicPlayerEvent {
  final Duration position;

  const SeekToPosition(this.position);

  @override
  List<Object?> get props => [position];
}

final class DisposeSong extends MusicPlayerEvent {}

final class StopSong extends MusicPlayerEvent {}
//
// final class SeekToPosition extends MusicPlayerEvent {
//   final Duration position;
//
//   const SeekToPosition(this.position);
//
//   @override
//   List<Object?> get props => [position];
// }
//
// // time control events
// final class UpdateDuration extends MusicPlayerEvent {
//   final Duration duration;
//
//   const UpdateDuration(this.duration);
//
//   @override
//   List<Object?> get props => [duration];
// }
//
// final class SongCompleted extends MusicPlayerEvent {}
//
// // playlist events
// final class NextSong extends MusicPlayerEvent {}
//
// final class PreviousSong extends MusicPlayerEvent {}
//
// final class ShuffleSongs extends MusicPlayerEvent {}
//
// final class RepeatSong extends MusicPlayerEvent {}
