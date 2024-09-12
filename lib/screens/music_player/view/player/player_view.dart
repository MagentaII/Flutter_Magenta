import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_magenta/screens/music_player/models/song.dart';

import '../../bloc/music_player_bloc/music_player_bloc.dart';

class PlayerView extends StatelessWidget {
  final List<Song> songs;
  final int currentIndex; // Required for initial loading

  const PlayerView({required this.songs, required this.currentIndex, super.key});

  @override
  Widget build(BuildContext context) {
    Duration position = Duration.zero;
    Duration duration = Duration.zero;
    String? albumArtImagePath;
    String? songName;
    String? artistName;
    int? songIndex;
    bool isShuffle = false;
    bool isRepeat = false;

    context
        .read<MusicPlayerBloc>()
        .add(LoadingSong(songs: songs, currentIndex: currentIndex));

    String formatTime(Duration time) {
      String minutes = time.inMinutes.remainder(60).toString().padLeft(2, '0');
      String seconds = time.inSeconds.remainder(60).toString().padLeft(2, '0');
      return '$minutes:$seconds';
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        log('Pop Scope, didPop: $didPop');
        if (didPop) {
          return;
        }
        context.read<MusicPlayerBloc>().add(DisposeSong());
        // 等待处理完成后再执行 pop 操作
        Future.delayed(Duration.zero, () {
          if (context.mounted) {
            log('Dispose Song');
            Navigator.of(context).pop();
          }
        });
      },
      child: BlocBuilder<MusicPlayerBloc, MusicPlayerState>(
        builder: (context, state) {
          if (state is PlayerStateLoaded) {
            duration = state.duration;
            position = state.position;
            albumArtImagePath = state.song.albumArtImagePath;
            songName = state.song.songName;
            artistName = state.song.artistName;
            songIndex = songs.indexOf(state.song);
            log('state is PlaySong, duration : $duration');
            if (state.isPlayedDirectly == true) {
              context.read<MusicPlayerBloc>().add(const PlaySong());
            }
          } else if (state is PlayerStatePlaying) {
            position = state.position;
            isShuffle = state.isShuffle;
            isRepeat = state.isRepeat;
            log('PlayerStatePlaying, is shuffle? $isShuffle');
          } else if (state is PlayerStatePaused) {
            position = state.position;
            isShuffle = state.isShuffle;
            isRepeat = state.isRepeat;
            log('PlayerStatePaused, is shuffle? $isShuffle');
          } else if (state is PlayerStateCompleted) {
            position = duration;
          }
          log('state is PlaySong, duration again : $duration');

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
                            Navigator.of(context).maybePop();
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
                                    image: AssetImage(albumArtImagePath ??=
                                        'assets/images/album_images/default_album_art.jpg'))),
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    songName ??= 'Unknown Music Name....',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      artistName ??= 'Unknown Artist Name....'),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formatTime(position),
                            style: const TextStyle(
                                fontSize: 18, color: Color(0xFF5F4D3A)),
                          ),
                          IconButton(
                            icon: isShuffle == true
                                ? const Icon(Icons.shuffle_rounded,
                                    color: Color(
                                      0xFF008383,
                                    ), size: 28,)
                                : const Icon(Icons.shuffle_rounded,
                                    color: Color(
                                      0xFF5F4D3A,
                                    ), size: 28,),
                            onPressed: () {
                              isShuffle = !isShuffle;
                              context
                                  .read<MusicPlayerBloc>()
                                  .add(ToggleShuffleSongs(position, isShuffle));
                            },
                          ),
                          IconButton(
                            icon: isRepeat == true
                                ? const Icon(Icons.repeat,
                              color: Color(
                                0xFF008383,
                              ), size: 28,)
                                : const Icon(Icons.repeat,
                              color: Color(
                                0xFF5F4D3A,
                              ), size: 28,),
                            onPressed: () {
                              isRepeat = !isRepeat;
                              context
                                  .read<MusicPlayerBloc>()
                                  .add(ToggleRepeatSong(position, isRepeat));
                            },
                          ),
                          Text(
                            formatTime(duration),
                            style: const TextStyle(
                                fontSize: 18, color: Color(0xFF5F4D3A)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Slider(
                      min: 0,
                      max: duration.inSeconds > 0
                          ? duration.inSeconds.toDouble()
                          : 1,
                      // 确保 max 不为 0
                      value: position.inSeconds
                          .toDouble()
                          .clamp(0, duration.inSeconds.toDouble()),
                      // 确保 value 在范围内
                      activeColor: Colors.brown,
                      onChanged: (value) {
                        context.read<MusicPlayerBloc>().add(
                            SeekToPosition(Duration(seconds: value.toInt())));
                      },
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // 让图标均匀分布
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (state is PlayerStatePlaying) {
                              context.read<MusicPlayerBloc>().add(PreviousSong(
                                  songs, songIndex ??= currentIndex,
                                  isPlayedDirectly: true));
                            } else {
                              context.read<MusicPlayerBloc>().add(PreviousSong(
                                  songs, songIndex ??= currentIndex));
                            }
                          },
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
                            if (state is PlayerStatePlaying) {
                              context
                                  .read<MusicPlayerBloc>()
                                  .add(PauseSong(position));
                            } else if (state is PlayerStateLoaded ||
                                state is PlayerStateCompleted) {
                              context
                                  .read<MusicPlayerBloc>()
                                  .add(const PlaySong());
                            } else if (state is PlayerStatePaused) {
                              context
                                  .read<MusicPlayerBloc>()
                                  .add(ResumeSong(position));
                            } else if (state is PlayerStateLoading) {
                              return;
                            }
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: state is PlayerStatePlaying ? 75 : 70,
                            width: state is PlayerStatePlaying ? 75 : 70,
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
                                state is PlayerStatePlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                key:
                                    ValueKey<bool>(state is PlayerStatePlaying),
                                color: Colors.brown,
                                size: 40,
                              ),
                            ), // 突出播放按钮
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (state is PlayerStatePlaying) {
                              context.read<MusicPlayerBloc>().add(NextSong(
                                  songs, songIndex ??= currentIndex,
                                  isPlayedDirectly: true));
                            } else {
                              context.read<MusicPlayerBloc>().add(
                                  NextSong(songs, songIndex ??= currentIndex));
                            }
                          },
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
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
