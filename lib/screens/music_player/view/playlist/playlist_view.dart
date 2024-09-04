import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/music_playlist_bloc/music_playlist_bloc.dart';
import '../player/player_view.dart';

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
    context.read<MusicPlaylistBloc>().add(LoadSongs());
    return BlocBuilder<MusicPlaylistBloc, MusicPlaylistState>(
      builder: (context, state) {
        if (state is PlaylistStateInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PlayListStateLoaded) {
          return ListView.builder(
            itemCount: state.songs.length,
            itemBuilder: (context, index) {
              final song = state.songs[index];
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
                      builder: (context) => PlayerView(song: song),
                    ),
                  );
                },
              );
            },
          );
        } else if (state is PlayListError) {
          return Center(child: Text('Error: ${state.error}'));
        } else {
          // Handle other possible states or return a default widget
          return const Center(child: Text('No content available'));
        }
      },
    );
  }
}
