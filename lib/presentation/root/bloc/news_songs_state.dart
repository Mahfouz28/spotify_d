import 'package:spotify/domain/entities/songs_entities/songs_entities.dart';

abstract class NewsSongsState {}

class NewsSongsLoading extends NewsSongsState {}

class NewsSongsLoaded extends NewsSongsState {
  final List<SongsEntities> songs;

  NewsSongsLoaded({required this.songs});
}

class NewsSongsLoadFailure extends NewsSongsState {}
