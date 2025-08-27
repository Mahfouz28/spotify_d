import 'package:get_it/get_it.dart';
import 'package:spotify/data/repo/auth/auth_repo.dart';
import 'package:spotify/data/sources/auth/auth_firebase_serveces.dart';
import 'package:spotify/domain/repo/auth/auth_repo.dart';
import 'package:spotify/domain/usecases/auth/sign_in.dart';
import 'package:spotify/domain/usecases/auth/sign_up.dart';

final sl = GetIt.instance;
Future<void> initializeDepnedecies() async {
  sl.registerSingleton<AuthFirebaseServeces>(AuthFirebaseServecesImpl());
  sl.registerSingleton<Authintcation>(AuthRepoImp());
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
}
