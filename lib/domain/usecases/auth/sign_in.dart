import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/auth/sign_in_user_req.dart';
import 'package:spotify/domain/repo/auth/auth_repo.dart';
import 'package:spotify/domain/usecases/usecases.dart';
import 'package:spotify/service_locator.dart';

class SignInUseCase implements Usecases<Either, SignInUserReq> {
  @override
  Future<Either> call({SignInUserReq? params}) {
    return sl<Authintcation>().signin(params!);
  }
}
