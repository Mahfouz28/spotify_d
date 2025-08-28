// lib/data/models/auth/songs/songs_model.dart
import 'package:spotify/domain/entities/songs_entities/songs_entities.dart';

class SongsModel {
  final String? title;
  final String? artist;
  final num? duration;
  final DateTime? releaseDate;

  SongsModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
  });

  factory SongsModel.fromJson(Map<String, dynamic> data) {
    return SongsModel(
      title: data['title'] as String?,
      artist: data['artist'] as String?,
      duration: data['duration'] as num?,
      releaseDate:
          data['release_date'] != null
              ? DateTime.parse(data['release_date'].toString())
              : null,
    );
  }
}

// Extension يوفر الميثود المطلوبة في الكيوبت
extension SongsModelX on SongsModel {
  SongsEntities toEntity() {
    return SongsEntities(
      title: title ?? '',
      artist: artist ?? '',
      duration: duration ?? 0,
      releaseDate: releaseDate ?? DateTime.now(),
    );
  }
}
