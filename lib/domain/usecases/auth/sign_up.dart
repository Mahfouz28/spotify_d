import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/auth/creat_user_req.dart';
import 'package:spotify/domain/repo/auth/auth_repo.dart';
import 'package:spotify/domain/usecases/usecases.dart';
import 'package:spotify/service_locator.dart';

class SignupUseCase implements Usecases<Either, CreatUserReq> {
  @override
  Future<Either> call({CreatUserReq? params}) {
    return sl<Authintcation>().siginup(params!);
  }
}
