import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/creat_user_req.dart';
import 'package:spotify/data/models/auth/sign_in_user_req.dart';

abstract class AuthFirebaseServeces {
  Future<Either> singUp(CreatUserReq creatUserReq);
  Future<Either> singIn(SignInUserReq siginIntUserReq);
}

class AuthFirebaseServecesImpl extends AuthFirebaseServeces {
  @override
  Future<Either> singUp(CreatUserReq creatUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: creatUserReq.email,
        password: creatUserReq.password,
      );
      return right("Sign up was succsessful");
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == "user-not-found") {
        message = "No user found for that email";
      } else if (e.code == "wrong-password") {
        message = "Wrong password provided for that user";
      } else if (e.code == "invalid-email") {
        message = "Invalid email";
      } else if (e.code == "email-already-in-use") {
        message = "Email already in use";
      }

      return left(message);
    }
  }

  @override
  Future<Either> singIn(SignInUserReq signInUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signInUserReq.email,
        password: signInUserReq.password,
      );
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == "user-not-found") {
        message = "No user found for that email";
      } else if (e.code == "invalid-credential") {
        message = "Wrong password provided ";
      } else if (e.code == "invalid-email") {
        message = "Not user found for that email";
      } else if (e.code == "email-already-in-use") {
        message = "Email already in use";
      }

      return left(message);
    }
    return right("Sign in was successful");
  }
}
