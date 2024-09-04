import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_magenta/screens/music_player/repository/music_player_repository.dart';

class PlayerHelper {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final MusicPlayerRepository _repository = MusicPlayerRepository();

  // int _currentIndex = -1; // 当前播放的歌曲索引
  bool _repeatMode = false; // 当前重复播放模式

  Stream<Duration> get onDurationChanged => _audioPlayer.onDurationChanged;

  Stream<Duration> get onPositionChanged => _audioPlayer.onPositionChanged;

  Stream<void> get onPlayerComplete => _audioPlayer.onPlayerComplete;

  Stream<PlayerState> get onPlayerStateChanged => _audioPlayer.onPlayerStateChanged;

  // total duration
  Future<Duration?> getTotalDuration() async {
    return await _audioPlayer.getDuration();
  }

  Future<void> setSource(String url) async {
    await _audioPlayer.setSource(AssetSource(url));
  }

  void setReleaseMode(ReleaseMode releaseMode) {
    _audioPlayer.setReleaseMode(releaseMode);
  }

// play
  Future<void> play() async {
    await _audioPlayer.resume();
  }

// resume
  Future<void> resume() async {
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

  // 设置重复播放模式
  void setRepeatMode(bool shouldRepeat) {
    _repeatMode = shouldRepeat;
    if (shouldRepeat) {
      // 使用 AudioPlayer 的 setReleaseMode 方法来设置循环播放
      _audioPlayer.setReleaseMode(ReleaseMode.loop);
    } else {
      _audioPlayer.setReleaseMode(ReleaseMode.release);
    }
  }

// dispose
  void dispose() {
    _audioPlayer.dispose();
  }
}



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

