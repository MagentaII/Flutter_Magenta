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
      log('(Player Helper) Error setting source: $e');
    }
  }

  void setReleaseMode(ReleaseMode releaseMode) {
    _audioPlayer.setReleaseMode(releaseMode);
  }

// play
  Future<void> play() async {
    log('(Player Helper) play song');
    await _audioPlayer.resume();
  }

// resume
  Future<void> resume() async {
    log('(Player Helper) Resume song');
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
