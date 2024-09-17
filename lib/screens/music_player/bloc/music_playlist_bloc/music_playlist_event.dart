part of 'music_playlist_bloc.dart';

sealed class MusicPlaylistEvent extends Equatable {
  const MusicPlaylistEvent();

  @override
  List<Object?> get props => [];
}

final class LoadSongs extends MusicPlaylistEvent {}