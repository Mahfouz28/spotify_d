import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/auth/songs/songs_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SongSubaBaseService {
  Future<Either<String, List<SongsModel>>> fetchNewsSongs();
}

class SongSubaServiceImpl extends SongSubaBaseService {
  @override
  Future<Either<String, List<SongsModel>>> fetchNewsSongs() async {
    try {
      final data = await Supabase.instance.client
          .from('songs') // ✅ تأكد إن الجدول اسمه بالظبط كده
          .select()
          .limit(3);

      print("Songs data from supabase: $data");

      // Supabase بيرجع List<dynamic> بالفعل
      final List<dynamic> raw = data as List<dynamic>;
      final songs = raw.map((e) => SongsModel.fromJson(e)).toList();

      return Right(songs);
    } catch (e) {
      print("Error fetching songs: $e");
      return Left('An error occurred, please try again');
    }
  }
}
