import 'package:equatable/equatable.dart';

class Song extends Equatable {
  final String songName;
  final String artistName;
  final String albumArtImagePath;
  final String audioPath;

  const Song({
    required this.songName,
    required this.artistName,
    required this.albumArtImagePath,
    required this.audioPath,
  });

  static const empty = Song(
      songName: '',
      artistName: '',
      albumArtImagePath: '',
      audioPath: ''
  );

  @override
  List<Object?> get props =>
      [songName, artistName, albumArtImagePath, audioPath];

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      songName: json['songName'] as String,
      artistName: json['artistName'] as String,
      albumArtImagePath: json['albumArtImagePath'] as String,
      audioPath: json['audioPath'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'songName': songName,
      'artistName': artistName,
      'albumArtImagePath': albumArtImagePath,
      'audioPath': audioPath,
    };
  }
}
