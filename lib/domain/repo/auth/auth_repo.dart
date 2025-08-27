import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/auth/creat_user_req.dart';
import 'package:spotify/data/models/auth/sign_in_user_req.dart';

abstract class Authintcation {
  Future<Either> siginup(CreatUserReq creatUserReq);
  Future<Either> signin(SignInUserReq signInUserReq);
}
