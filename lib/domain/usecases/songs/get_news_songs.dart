import 'package:dartz/dartz.dart';
import 'package:spotify/data/repo/songs/songs_repo_imp.dart';
import 'package:spotify/domain/usecases/usecases.dart';
import 'package:spotify/service_locator.dart';

class SongsUseCase implements Usecases<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongsRepoImpl>().featchNewsData();
  }
}
