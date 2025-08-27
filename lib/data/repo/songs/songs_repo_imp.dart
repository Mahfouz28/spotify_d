import 'package:dartz/dartz.dart';
import 'package:spotify/data/sources/song_subabase_servces.dart';
import 'package:spotify/domain/repo/songs/songs_repo.dart';
import 'package:spotify/service_locator.dart';

class SongsRepoImpl extends SongsRepo {
  @override
  Future<Either> featchNewsData() async {
    return await sl<SongSubaBaseService>().featchNewsSongs();
  }
}
