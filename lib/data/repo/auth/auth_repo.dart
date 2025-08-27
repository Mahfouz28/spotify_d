import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/auth/creat_user_req.dart';
import 'package:spotify/data/models/auth/sign_in_user_req.dart';
import 'package:spotify/data/sources/auth/auth_firebase_serveces.dart';
import 'package:spotify/domain/repo/auth/auth_repo.dart';
import 'package:spotify/service_locator.dart';

class AuthRepoImp extends Authintcation {
  @override
  Future<Either> siginup(CreatUserReq creatUserReq) async {
    return await sl<AuthFirebaseServeces>().singUp(creatUserReq);
  }

  @override
  Future<Either> signin(SignInUserReq signInUserReq) async {
    return await sl<AuthFirebaseServeces>().singIn(signInUserReq);
  }
}
