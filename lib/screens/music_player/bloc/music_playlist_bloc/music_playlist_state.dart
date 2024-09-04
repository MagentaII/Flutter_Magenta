part of 'music_playlist_bloc.dart';

sealed class MusicPlaylistState extends Equatable {
  final Song? song;
  final Duration position;
  final Duration duration;
  final String? error;

  const MusicPlaylistState({
    this.song,
    this.position = Duration.zero,
    this.duration = Duration.zero,
    this.error,
  });

  @override
  List<Object?> get props => [song, position, duration, error];
}

final class PlaylistStateInitial extends MusicPlaylistState {
  @override
  List<Object> get props => [];
}

final class PlayListStateLoaded extends MusicPlaylistState {
  final List<Song> songs;

  const PlayListStateLoaded(this.songs) : super(song: null); // 没有当前播放歌曲

  @override
  List<Object> get props => [songs];
}

class PlayListError extends MusicPlaylistState {
  final String message;

  const PlayListError(this.message) : super(error: message);

  @override
  List<Object> get props => [message];
}
