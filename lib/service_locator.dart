import 'package:get_it/get_it.dart';
import 'package:spotify/data/repo/auth/auth_repo.dart';
import 'package:spotify/data/repo/songs/songs_repo_imp.dart';
import 'package:spotify/data/sources/auth/auth_firebase_serveces.dart';
import 'package:spotify/data/sources/song_subabase_servces.dart';
import 'package:spotify/domain/repo/auth/auth_repo.dart';
import 'package:spotify/domain/repo/songs/songs_repo.dart';
import 'package:spotify/domain/usecases/auth/sign_in.dart';
import 'package:spotify/domain/usecases/auth/sign_up.dart';
import 'package:spotify/domain/usecases/songs/get_news_songs.dart';

final sl = GetIt.instance;
Future<void> initializeDepnedecies() async {
  sl.registerSingleton<AuthFirebaseServeces>(AuthFirebaseServecesImpl());
  sl.registerSingleton<Authintcation>(AuthRepoImp());
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<SongSubaBaseService>(SongSubaServiceimpl());
  sl.registerSingleton<SongsRepo>(SongsRepoImpl());
  sl.registerSingleton<SongsUseCase>(SongsUseCase());
}
