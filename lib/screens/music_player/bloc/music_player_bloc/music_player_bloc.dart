import 'dart:async';
import 'dart:developer';

// import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_magenta/screens/music_player/helper/player_helper.dart';
import 'package:flutter_magenta/screens/music_player/repository/music_player_repository.dart';
import '../../models/song.dart';

part 'music_player_event.dart';

part 'music_player_state.dart';

class MusicPlayerBloc extends Bloc<MusicPlayerEvent, MusicPlayerState> {
  final PlayerHelper _playerHelper = PlayerHelper();
  final MusicPlayerRepository repository;
  late PlayerState _playerState;
  late final StreamSubscription<Duration> _positionSubscription;
  late final StreamSubscription<PlayerState> _playerStateSubscription;
  late final StreamSubscription<void> _playerCompleteSubscription;

  MusicPlayerBloc({required this.repository}) : super(PlayerStateInitial()) {
    on<LoadingSong>(_loadingSong);
    on<PlaySong>(_playSong);
    on<UpdatePosition>(_updatePosition);
    on<PauseSong>(_pauseSong);
    on<ResumeSong>(_resumeSong);
    on<StopSong>(_stopSong);
    on<SeekToPosition>(_seekToPosition);
    on<DisposeSong>(_disposeSong);
  }

  // 在Bloc dispose时取消订阅
  @override
  Future<void> close() {
    _positionSubscription.cancel();
    _playerStateSubscription.cancel();
    _playerCompleteSubscription.cancel();
    _playerHelper.dispose();
    return super.close();
  }

  Future<void> _loadingSong(
    LoadingSong event,
    Emitter<MusicPlayerState> emit,
  ) async {
    emit(PlayerStateLoading());

    _playerHelper.setReleaseMode(ReleaseMode.stop);

    await _playerHelper.setSource(event.song.audioPath);
    final totalDuration =
        await _playerHelper.getTotalDuration() ?? Duration.zero;
    log('loading Song State : $totalDuration');

    _playerCompleteSubscription = _playerHelper.onPlayerComplete.listen((_) {
      add(StopSong());
    });

    _playerStateSubscription =
        _playerHelper.onPlayerStateChanged.listen((state) {
      log('Current player state: $state');
      _playerState = state;
    });

    _positionSubscription = _playerHelper.onPositionChanged.listen((position) {
      log('listen position changed');
      add(UpdatePosition(position));
    });

    emit(PlayerStateLoaded(totalDuration));
  }

  Future<void> _playSong(
    PlaySong event,
    Emitter<MusicPlayerState> emit,
  ) async {
    try {
      await _playerHelper.play();

      // 发射初始的播放状态
      emit(PlayerStatePlaying(event.position));
    } catch (e) {
      emit(PlayerStateError(e.toString()));
    }
  }

  Future<void> _updatePosition(
    UpdatePosition event,
    Emitter<MusicPlayerState> emit,
  ) async {
    if (_playerState == PlayerState.playing && state is PlayerStatePlaying) {
      emit(PlayerStatePlaying(event.position));
    }
  }

  Future<void> _pauseSong(
    PauseSong event,
    Emitter<MusicPlayerState> emit,
  ) async {
    if (state is PlayerStatePlaying) {
      await _playerHelper.pause();
      emit(PlayerStatePaused(event.position));
    }
  }

  Future<void> _resumeSong(
    ResumeSong event,
    Emitter<MusicPlayerState> emit,
  ) async {
    if (state is PlayerStatePaused) {
      await _playerHelper.resume();
      // log('_positionSubscription : $_positionSubscription');
      emit(PlayerStatePlaying(event.position));
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

    emit(state is PlayerStatePlaying
        ? PlayerStatePlaying(event.position)
        : PlayerStatePaused(event.position));
  }

  void _disposeSong(
    DisposeSong event,
    Emitter<MusicPlayerState> emit,
  ) {
    _playerHelper.dispose();
  }

// Future<void> _stopSong(
//   StopSong event,
//   Emitter<MusicPlayerState> emit,
// ) async {
//   if (state is PlayerStatePlaying || state is PlayerStatePaused) {
//     await _playerHelper.stop();
//     final currentSong = state.song;
//     emit(PlayerStateStopped(song: currentSong));
//   }
// }
//
// Future<void> _seekToPosition(
//   SeekToPosition event,
//   Emitter<MusicPlayerState> emit,
// ) async {
//   if (state is PlayerStatePlaying ||
//       state is PlayerStatePaused ||
//       state is PlayerStateSeeking) {
//     final currentSong = state.song;
//
//     // 调用播放器的 seek 方法，将进度调整到指定位置
//     await _playerHelper.seek(event.position);
//
//     // 发射新的状态，更新到指定位置
//     emit(PlayerStateSeeking(
//       song: currentSong,
//       position: event.position,
//     ));
//
//     // 如果之前是播放状态，重新发射播放状态，确保播放继续
//     if (state is PlayerStatePlaying) {
//       emit(PlayerStatePlaying(
//         song: currentSong,
//         position: event.position,
//       ));
//     }
//   }
// }
//
// Future<void> _updateDuration(
//   UpdateDuration event,
//   Emitter<MusicPlayerState> emit,
// ) async {
//   if (state is PlayerStatePlaying ||
//       state is PlayerStatePaused ||
//       state is PlayerStateSeeking) {
//     final currentSong = state.song;
//     final currentPosition = state.position;
//
//     // 发射新的状态，更新到指定的时长
//     emit(PlayerStatePlaying(
//       song: currentSong,
//       position: currentPosition,
//     ));
//   }
// }
//
// Future<void> _songCompleted(
//   SongCompleted event,
//   Emitter<MusicPlayerState> emit,
// ) async {
//   if (state is PlayerStatePlaying ||
//       state is PlayerStatePaused ||
//       state is PlayerStateSeeking) {
//     final currentSong = state.song;
//
//     // 发射歌曲完成状态
//     emit(PlayerStateCompleted(song: currentSong));
//   }
// }
//
// Future<void> _nextSong(
//   NextSong event,
//   Emitter<MusicPlayerState> emit,
// ) async {
//   try {
//     if (state is PlayerStatePlaying ||
//         state is PlayerStatePaused ||
//         state is PlayerStateSeeking) {
//       // 这里假设你有一个方法来获取下一首歌曲
//       final currentSong = state.song;
//       final nextSong = _playerHelper.getNextSong(currentSong!); // 你需要实现这个方法
//
//       // 停止当前歌曲
//       await _playerHelper.stop();
//
//       await _playerHelper.play();
//
//       emit(PlayerStatePlaying(
//         song: nextSong,
//         position: Duration.zero, // 新歌曲开始时位置是0
//         // duration: await _playerHelper.getTotalDuration() ?? Duration.zero,
//       ));
//     }
//   } catch (e) {
//     print('Error switching to next song: $e');
//     // 你可以在这里处理错误情况，例如发射错误状态或通知用户
//   }
// }
//
// Future<void> _previousSong(
//   PreviousSong event,
//   Emitter<MusicPlayerState> emit,
// ) async {
//   try {
//     if (state is PlayerStatePlaying ||
//         state is PlayerStatePaused ||
//         state is PlayerStateSeeking) {
//       // 获取上一首歌曲，这个方法需要你实现
//       final currentSong = state.song;
//       final previousSong =
//           _playerHelper.getPreviousSong(currentSong!); // 你需要实现这个方法
//
//       // 停止当前歌曲
//       await _playerHelper.stop();
//
//       // 播放上一首歌曲
//       await _playerHelper.play();
//
//       // 发射播放状态，表示播放的是上一首歌曲
//       emit(PlayerStatePlaying(
//         song: previousSong,
//         position: Duration.zero, // 新歌曲开始时位置是0
//         // duration: await _playerHelper.getTotalDuration() ?? Duration.zero,
//       ));
//     }
//   } catch (e) {
//     print('Error switching to previous song: $e');
//     // 你可以在这里处理错误情况，例如发射错误状态或通知用户
//   }
// }
//
// Future<void> _shuffleSongs(
//   ShuffleSongs event,
//   Emitter<MusicPlayerState> emit,
// ) async {
//   try {
//     if (state is PlayerStatePlaying || state is PlayerStatePaused) {
//       // 获取当前播放列表，假设你有一个方法可以获取这个列表
//       final List<Song> playlist = _playerHelper.getPlaylist(); // 你需要实现这个方法
//
//       // 打乱播放列表
//       final List<Song> shuffledPlaylist = List.from(playlist);
//       shuffledPlaylist.shuffle(Random());
//
//       // 停止当前歌曲
//       await _playerHelper.stop();
//
//       // 播放打乱后的第一首歌曲
//       final Song firstSong = shuffledPlaylist.first;
//       await _playerHelper.play();
//
//       // 发射新的播放状态，表示播放的是打乱后的第一首歌曲
//       emit(PlayerStatePlaying(
//         song: firstSong,
//         position: Duration.zero, // 新歌曲开始时位置是0
//         // duration: await _playerHelper.getTotalDuration() ?? Duration.zero,
//       ));
//     }
//   } catch (e) {
//     print('Error shuffling songs: $e');
//     // 你可以在这里处理错误情况，例如发射错误状态或通知用户
//   }
// }
//
// Future<void> _repeatSong(
//   RepeatSong event,
//   Emitter<MusicPlayerState> emit,
// ) async {
//   try {
//     if (state is PlayerStatePlaying || state is PlayerStatePaused) {
//       final currentState = state as MusicPlayerState;
//       final Song currentSong = currentState.song!;
//
//       // 更新播放设置为重复播放当前歌曲
//       // 这里可以设置一个标记来表示需要重复播放
//       _playerHelper.setRepeatMode(true);
//
//       // 如果当前歌曲已经在播放中，重新播放它
//       if (state is PlayerStatePlaying) {
//         await _playerHelper.stop(); // 停止当前歌曲
//         await _playerHelper.play(); // 重新播放当前歌曲
//       }
//
//       // 发射新的播放状态，表示当前歌曲设置为重复播放
//       emit(PlayerStatePlaying(
//         song: currentSong,
//         position: currentState.position,
//         // duration: currentState.duration,
//       ));
//     }
//   } catch (e) {
//     print('Error setting repeat mode: $e');
//     // 处理错误情况，例如发射错误状态或通知用户
//   }
// }
}
