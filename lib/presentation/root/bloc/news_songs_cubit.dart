import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/data/sources/song_subabase_servces.dart';
import 'package:spotify/domain/entities/songs_entities/songs_entities.dart';
import 'package:spotify/presentation/root/bloc/news_songs_state.dart';
import 'package:spotify/data/models/auth/songs/songs_model.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  final SongSubaBaseService songService;

  NewsSongsCubit(this.songService) : super(NewsSongsLoading());

  Future<void> fetchNewsSongs() async {
    emit(NewsSongsLoading());

    final result = await songService.featchNewsSongs();

    result.fold(
      (failureMessage) {
        // لو حصل Error
        emit(NewsSongsLoadFailure());
      },
      (songs) {
        // songs هنا List<SongsModel>
        final entities = songs.map((e) => e.toEntity()).toList();
        emit(NewsSongsLoaded(songs: entities));
      },
    );
  }
}
