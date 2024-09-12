import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';

class PlayerHelper {

  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isShuffleSongs = false;
  bool isRepeatSongs = false;

  Stream<Duration> get onDurationChanged => _audioPlayer.onDurationChanged;

  Stream<Duration> get onPositionChanged => _audioPlayer.onPositionChanged;

  Stream<void> get onPlayerComplete => _audioPlayer.onPlayerComplete;

  Stream<PlayerState> get onPlayerStateChanged =>
      _audioPlayer.onPlayerStateChanged;

  // total duration
  Future<Duration?> getTotalDuration() async {
    return await _audioPlayer.getDuration();
  }

  Future<void> setSource(String url) async {
    try {
      await _audioPlayer.setSource(AssetSource(url));
    } catch (e) {
      log('-------------------------------Error setting source: $e------------------------------------');
    }
  }

  void setReleaseMode(ReleaseMode releaseMode) {
    _audioPlayer.setReleaseMode(releaseMode);
  }

// play
  Future<void> play() async {
    log('play song');
    await _audioPlayer.resume();
  }

// resume
  Future<void> resume() async {
    log('Resume song');
    await _audioPlayer.resume();
  }

// seek
  Future<void> seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

// pause
  Future<void> pause() async {
    await _audioPlayer.pause();
  }

// stop
  Future<void> stop() async {
    await _audioPlayer.stop();
  }

  // dispose
  void dispose() {
    _audioPlayer.dispose();
  }
}

// // 设置重复播放模式
// void setRepeatMode(bool shouldRepeat) {
//   _repeatMode = shouldRepeat;
//   if (shouldRepeat) {
//     // 使用 AudioPlayer 的 setReleaseMode 方法来设置循环播放
//     _audioPlayer.setReleaseMode(ReleaseMode.loop);
//   } else {
//     _audioPlayer.setReleaseMode(ReleaseMode.release);
//   }
// }

// // 获取播放列表
// List<Song> getPlaylist() {
//   return _repository.getPlaylist(); // 返回一个不可修改的播放列表
// }
//
// // 获取下一首歌曲
// Song? getNextSong(Song currentSong) {
//   return _repository.getNextSong(currentSong);
// }
//
// // 获取上一首歌曲
// Song? getPreviousSong(Song currentSong) {
//   return _repository.getPreviousSong(currentSong);
// }

// // 设置当前播放的歌曲索引
// void setCurrentIndex(int index) {
//   if (index >= 0 && index < _repository.getPlaylist().length) {
//     _currentIndex = index;
//   }
// }
