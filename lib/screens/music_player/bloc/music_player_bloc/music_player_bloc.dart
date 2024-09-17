import 'dart:async';
import 'dart:developer';

import 'dart:math' hide log;
import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_magenta/screens/music_player/repository/music_player_repository.dart';
import '../../helper/player_helper.dart';
import '../../models/song.dart';

part 'music_player_event.dart';

part 'music_player_state.dart';

class MusicPlayerBloc extends Bloc<MusicPlayerEvent, MusicPlayerState> {
  final _playerHelper = PlayerHelper();
  final MusicPlayerRepository repository;
  PlayerState _playerState = PlayerState.stopped;
  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<PlayerState>? _playerStateSubscription;
  StreamSubscription<void>? _playerCompleteSubscription;

  MusicPlayerBloc({required this.repository}) : super(PlayerStateInitial()) {
    on<LoadingSong>(_loadingSong);
    on<PlaySong>(_playSong);
    on<UpdatePosition>(_updatePosition);
    on<PauseSong>(_pauseSong);
    on<ResumeSong>(_resumeSong);
    on<StopSong>(_stopSong);
    on<SeekToPosition>(_seekToPosition);
    on<DisposeSong>(_disposeSong);
    on<NextSong>(_nextSong);
    on<PreviousSong>(_previousSong);
    on<ToggleShuffleSongs>(_toggleShuffleSongs);
    on<ToggleRepeatSong>(_toggleRepeatSong);
  }

  // 在Bloc dispose时取消订阅
  @override
  Future<void> close() {
    _positionSubscription?.cancel();
    _playerStateSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerHelper.dispose();
    return super.close();
  }

  Future<void> _loadingSong(
    LoadingSong event,
    Emitter<MusicPlayerState> emit,
  ) async {
    emit(PlayerStateLoading(event.songs[event.currentIndex]));
    log('(Bloc) _playerHelper.setReleaseMode1');
    if (_playerHelper.isRepeatSongs == true) {
      log('(Bloc) LoadingSong');
      log('(Bloc) _playerHelper.setReleaseMode：loop');
      _playerHelper.setReleaseMode(ReleaseMode.loop);
    } else {
      log('(Bloc) LoadingSong');
      log('(Bloc) _playerHelper.setReleaseMode：stop');
      _playerHelper.setReleaseMode(ReleaseMode.stop);
    }

    log('(Bloc) _playerHelper.setSource1');
    await _playerHelper.setSource(event.songs[event.currentIndex].audioPath);
    Duration totalDuration =
        await _playerHelper.getTotalDuration() ?? Duration.zero;
    log('loading Song State : $totalDuration');

    await _playerCompleteSubscription?.cancel();
    _playerCompleteSubscription = _playerHelper.onPlayerComplete.listen((_) {
      log('(Bloc) Song Complete');
      // add(StopSong());
      add(NextSong(event.songs, event.currentIndex, isPlayedDirectly: true));
    });

    await _playerStateSubscription?.cancel();
    _playerStateSubscription =
        _playerHelper.onPlayerStateChanged.listen((state) {
      log('(Bloc) Current player state: $state');
      _playerState = state;
    });

    await _positionSubscription?.cancel();
    _positionSubscription = _playerHelper.onPositionChanged.listen((position) {
      log('(Bloc) listen position changed');
      add(UpdatePosition(position));
    });

    log('(Bloc) is Played Directly: ${event.isPlayedDirectly}');
    emit(PlayerStateLoaded(event.songs[event.currentIndex], totalDuration,
        Duration.zero, event.isPlayedDirectly));

    // if (event.isPlayedDirectly) {
    //   add(const PlaySong());
    // }
  }

  Future<void> _playSong(
    PlaySong event,
    Emitter<MusicPlayerState> emit,
  ) async {
    log('(Bloc) Play Song');
    try {
      await _playerHelper.play();
      emit(PlayerStatePlaying(event.position, _playerHelper.isShuffleSongs,
          _playerHelper.isRepeatSongs));
    } catch (e) {
      emit(PlayerStateError(e.toString()));
    }
  }

  Future<void> _updatePosition(
    UpdatePosition event,
    Emitter<MusicPlayerState> emit,
  ) async {
    if (_playerState == PlayerState.playing && state is PlayerStatePlaying) {
      emit(PlayerStatePlaying(event.position, _playerHelper.isShuffleSongs,
          _playerHelper.isRepeatSongs));
    }
  }

  Future<void> _pauseSong(
    PauseSong event,
    Emitter<MusicPlayerState> emit,
  ) async {
    if (state is PlayerStatePlaying) {
      await _playerHelper.pause();
      emit(PlayerStatePaused(event.position, _playerHelper.isShuffleSongs,
          _playerHelper.isRepeatSongs));
    }
  }

  Future<void> _resumeSong(
    ResumeSong event,
    Emitter<MusicPlayerState> emit,
  ) async {
    if (state is PlayerStatePaused || _playerState == PlayerState.paused) {
      await _playerHelper.resume();
      emit(PlayerStatePlaying(event.position, _playerHelper.isShuffleSongs,
          _playerHelper.isRepeatSongs));
    }
  }

  Future<void> _stopSong(
    StopSong event,
    Emitter<MusicPlayerState> emit,
  ) async {
    await _playerHelper.stop();
    emit(PlayerStateCompleted());
  }

  Future<void> _seekToPosition(
    SeekToPosition event,
    Emitter<MusicPlayerState> emit,
  ) async {
    await _playerHelper.seek(event.position);

    if (state is PlayerStatePlaying || _playerState == PlayerState.playing) {
      emit(PlayerStatePlaying(event.position, _playerHelper.isShuffleSongs,
          _playerHelper.isRepeatSongs));
    } else {
      emit(PlayerStatePaused(event.position, _playerHelper.isShuffleSongs,
          _playerHelper.isRepeatSongs));
    }
  }

  Future<void> _disposeSong(
    DisposeSong event,
    Emitter<MusicPlayerState> emit,
  ) async {
    await _playerHelper.stop();
  }

  Future<void> _nextSong(
    NextSong event,
    Emitter<MusicPlayerState> emit,
  ) async {
    int nextIndex = -1;
    if (_playerHelper.isShuffleSongs) {
      Random random = Random();
      int randomIndex;

      do {
        randomIndex = random.nextInt(event.songs.length);
      } while (randomIndex == event.currentIndex);

      nextIndex = randomIndex;
      log('(Bloc) Shuffled Next Song : ${event.songs[nextIndex].songName}');
    } else {
      nextIndex = (event.currentIndex + 1) % event.songs.length;
      log('(Bloc) Next Song : ${event.songs[nextIndex].songName}');
    }
    log('(Bloc) Next Index: $nextIndex');
    await _playerHelper.pause();
    Future.delayed(Duration.zero, () {
      add(LoadingSong(
          songs: event.songs,
          currentIndex: nextIndex,
          isPlayedDirectly: event.isPlayedDirectly));
    });
  }

  Future<void> _previousSong(
    PreviousSong event,
    Emitter<MusicPlayerState> emit,
  ) async {
    final int previousIndex =
        (event.currentIndex - 1 + event.songs.length) % event.songs.length;
    log('(Bloc) Previous Index: $previousIndex');
    await _playerHelper.pause();
    Future.delayed(Duration.zero, () {
      add(LoadingSong(
          songs: event.songs,
          currentIndex: previousIndex,
          isPlayedDirectly: event.isPlayedDirectly));
    });
  }

  Future<void> _toggleShuffleSongs(
    ToggleShuffleSongs event,
    Emitter<MusicPlayerState> emit,
  ) async {
    _playerHelper.isShuffleSongs = event.isShuffle;
    if (_playerState == PlayerState.playing) {
      emit(PlayerStatePlaying(event.position, _playerHelper.isShuffleSongs,
          _playerHelper.isRepeatSongs));
    } else {
      emit(PlayerStatePaused(event.position, _playerHelper.isShuffleSongs,
          _playerHelper.isRepeatSongs));
    }
  }

  Future<void> _toggleRepeatSong(
    ToggleRepeatSong event,
    Emitter<MusicPlayerState> emit,
  ) async {
    _playerHelper.isRepeatSongs = event.isRepeat;
    if (_playerHelper.isRepeatSongs == true) {
      log('(Bloc) ToggleRepeatSong');
      log('(Bloc) _playerHelper.setReleaseMode：loop');
      _playerHelper.setReleaseMode(ReleaseMode.loop);
    } else {
      log('(Bloc) ToggleRepeatSong');
      log('(Bloc) _playerHelper.setReleaseMode：stop');
      _playerHelper.setReleaseMode(ReleaseMode.stop);
    }
    if (_playerState == PlayerState.playing) {
      emit(PlayerStatePlaying(event.position, _playerHelper.isShuffleSongs,
          _playerHelper.isRepeatSongs));
    } else {
      emit(PlayerStatePaused(event.position, _playerHelper.isShuffleSongs,
          _playerHelper.isRepeatSongs));
    }
  }
}
