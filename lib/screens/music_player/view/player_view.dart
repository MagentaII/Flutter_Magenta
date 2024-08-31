import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_magenta/screens/music_player/models/song.dart';

import '../bloc/music_player_bloc.dart';

class PlayerView extends StatelessWidget {
  final Song song;

  const PlayerView({required this.song, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5EE),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 32,
                      color: Color(0xFF5F4D3A),
                    ),
                  ),
                  const Text(
                    'P L A Y E R',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                        color: Color(0xFF5F4D3A)),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
                      size: 32,
                      color: Color(0xFF5F4D3A),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // 阴影颜色和透明度
                      spreadRadius: 5, // 阴影扩散半径
                      blurRadius: 10, // 阴影模糊半径
                      offset: const Offset(0, 10), // 阴影偏移量
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: 330,
                      width: 330,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(song.albumArtImagePath))),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              song.songName,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(song.artistName),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '00:00',
                      style: TextStyle(fontSize: 18, color: Color(0xFF5F4D3A)),
                    ),
                    Icon(
                      Icons.shuffle,
                      color: Color(0xFF5F4D3A),
                    ),
                    Icon(
                      Icons.repeat,
                      color: Color(0xFF5F4D3A),
                    ),
                    Text(
                      '00:00',
                      style: TextStyle(fontSize: 18, color: Color(0xFF5F4D3A)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Slider(
                min: 0,
                max: 100,
                value: 50,
                activeColor: Colors.brown,
                onChanged: (value) {},
              ),
              const SizedBox(height: 24),
              BlocBuilder<MusicPlayerBloc, MusicPlayerState>(
                builder: (context, state) {
                  bool isPlaying = state is PlayerStatePlaying;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 让图标均匀分布
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                // 轻微的阴影颜色和透明度
                                spreadRadius: 2,
                                // 阴影扩散半径
                                blurRadius: 6,
                                // 阴影模糊半径
                                offset: const Offset(2, 2), // 阴影偏移量
                              ),
                            ],
                          ),
                          child: const Icon(Icons.skip_previous,
                              color: Colors.brown, size: 32), // 使用黑色图标
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (isPlaying) {
                            context.read<MusicPlayerBloc>().add(PauseSong());
                          } else {
                            context.read<MusicPlayerBloc>().add(PlaySong(song));
                          }
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: isPlaying ? 75 : 70,
                          width: isPlaying ? 75 : 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                // 轻微的阴影颜色和透明度
                                spreadRadius: 2,
                                // 阴影扩散半径
                                blurRadius: 6,
                                // 阴影模糊半径
                                offset: const Offset(2, 2), // 阴影偏移量
                              ),
                            ],
                          ),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return ScaleTransition(
                                  scale: animation, child: child);
                            },
                            child: Icon(
                              isPlaying ? Icons.pause : Icons.play_arrow,
                              key: ValueKey<bool>(isPlaying),
                              color: Colors.brown,
                              size: 40,
                            ),
                          ), // 突出播放按钮
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                // 轻微的阴影颜色和透明度
                                spreadRadius: 2,
                                // 阴影扩散半径
                                blurRadius: 6,
                                // 阴影模糊半径
                                offset: const Offset(2, 2), // 阴影偏移量
                              ),
                            ],
                          ),
                          child: const Icon(Icons.skip_next,
                              color: Colors.brown, size: 32), // 使用黑色图标
                        ),
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
