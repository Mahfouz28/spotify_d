// lib/data/models/auth/songs/songs_model.dart
import 'package:spotify/domain/entities/songs_entities/songs_entities.dart';

class SongsModel {
  final String? titel;
  final String? artist;
  final num? duration;
  final DateTime? releasDate;

  SongsModel({
    required this.titel,
    required this.artist,
    required this.duration,
    required this.releasDate,
  });

  factory SongsModel.fromJson(Map<String, dynamic> data) {
    return SongsModel(
      titel: data['titel'] as String?,
      artist: data['artist'] as String?,
      duration: data['duration'] as num?,
      // اسم العمود عندك "releasDate" حسب الجدول
      releasDate:
          data['releasDate'] != null
              ? DateTime.parse(data['releasDate'].toString())
              : null,
    );
  }
}

// Extension يوفر الميثود المطلوبة في الكيوبت
extension SongsModelX on SongsModel {
  SongsEntities toEntity() {
    return SongsEntities(
      titel: titel ?? '',
      artist: artist ?? '',
      duration: duration ?? 0,
      releasDate: releasDate ?? DateTime.now(),
    );
  }
}
