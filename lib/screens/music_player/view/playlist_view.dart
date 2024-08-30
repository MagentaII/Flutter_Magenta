import 'package:flutter/material.dart';
import 'package:flutter_magenta/screens/music_player/view/player_view.dart';

import '../models/song.dart';

class PlaylistView extends StatelessWidget {
  const PlaylistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5EE),
      appBar: AppBar(
        backgroundColor: const Color(0xFFC2A986),
        title: const Text(
          'P L A Y L I S T',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF443628),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 20.0),
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.home,
            size: 32.0,
            color: Color(0xFF443628),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Expanded(
              child: _PlaylistBody(),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlaylistBody extends StatelessWidget {
  const _PlaylistBody();

  @override
  Widget build(BuildContext context) {
    final List<Song> songs = [
      const Song(
        songName: 'Playing with Light',
        artistName: 'Roie Shpigler',
        albumArtImagePath:
            'assets/images/album_images/playing_with_light_image.jpg',
        audioPath: 'assets/audio/playing_with_light.mp3',
      ),
      const Song(
        songName: 'Hopscotch',
        artistName: 'Louis Adrien',
        albumArtImagePath: 'assets/images/album_images/hopscotch_image.jpg',
        audioPath: 'assets/audio/hopscotch.mp3',
      ),
      const Song(
        songName: 'Woodcraft',
        artistName: 'Ziv Moran',
        albumArtImagePath: 'assets/images/album_images/woodcraft_image.jpg',
        audioPath: 'assets/audio/woodcraft.mp3',
      ),
    ];
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        final song = songs[index];
        return ListTile(
          leading: Container(
            width: 50.0, // 调整图标宽度
            height: 50.0, // 调整图标高度
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage(song.albumArtImagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            song.songName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(song.artistName),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const PlayerView(),
              ),
            );
          },
        );
      },
    );
  }
}
