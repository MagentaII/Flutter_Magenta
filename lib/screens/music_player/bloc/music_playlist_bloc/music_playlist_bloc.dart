import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/song.dart';
import '../../repository/music_player_repository.dart';

part 'music_playlist_event.dart';
part 'music_playlist_state.dart';

class MusicPlaylistBloc extends Bloc<MusicPlaylistEvent, MusicPlaylistState> {
  final MusicPlayerRepository repository;

  MusicPlaylistBloc({required this.repository}) : super(PlaylistStateInitial()) {
    on<LoadSongs>(_onLoadSongs);
  }

  Future<void> _onLoadSongs(
      LoadSongs event,
      Emitter<MusicPlaylistState> emit,
      ) async {
    try {
      final songs = repository.getPlaylist();
      emit(PlayListStateLoaded(songs));
    } catch (e) {
      emit(const PlayListError('Failed to load songs'));
    }
  }
}
