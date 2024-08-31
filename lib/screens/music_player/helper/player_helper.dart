import 'package:audioplayers/audioplayers.dart';

class PlayerHelper {
  final AudioPlayer _audioPlayer = AudioPlayer();

// play
  Future<void> play(String url) async {
    await _audioPlayer.play(AssetSource(url));
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

// dispose
  void dispose() {
    _audioPlayer.dispose();
  }
}
