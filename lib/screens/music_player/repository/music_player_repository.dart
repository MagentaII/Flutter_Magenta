import 'package:equatable/equatable.dart';

import '../models/song.dart';

class MusicPlayerRepository {
  final List<Song> _songs = [
    const Song(
      songName: 'Playing with Light',
      artistName: 'Roie Shpigler',
      albumArtImagePath:
      'assets/images/album_images/playing_with_light_image.jpg',
      audioPath: 'audio/playing_with_light.mp3',
    ),
    const Song(
      songName: 'Hopscotch',
      artistName: 'Louis Adrien',
      albumArtImagePath: 'assets/images/album_images/hopscotch_image.jpg',
      audioPath: 'audio/hopscotch.mp3',
    ),
    const Song(
      songName: 'Woodcraft',
      artistName: 'Ziv Moran',
      albumArtImagePath: 'assets/images/album_images/woodcraft_image.jpg',
      audioPath: 'audio/woodcraft.mp3',
    ),
  ];

  // 获取播放列表
  List<Song> getPlaylist() {
    return List.unmodifiable(_songs); // 返回一个不可修改的播放列表
  }

  // 获取指定索引的歌曲
  Song? getSongAt(int index) {
    if (index >= 0 && index < _songs.length) {
      return _songs[index];
    }
    return null;
  }

  // 获取下一首歌曲
  Song? getNextSong(Song currentSong) {
    int currentIndex = _songs.indexOf(currentSong);
    if (currentIndex >= 0 && currentIndex < _songs.length - 1) {
      return _songs[currentIndex + 1];
    }
    return null; // 或者返回 null/抛出异常等
  }

  // 获取上一首歌曲
  Song? getPreviousSong(Song currentSong) {
    int currentIndex = _songs.indexOf(currentSong);
    if (currentIndex > 0) {
      return _songs[currentIndex - 1];
    }
    return null; // 或者返回 null/抛出异常等
  }
}