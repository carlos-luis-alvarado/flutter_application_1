import 'package:firebase_auth/firebase_auth.dart';

class SingUpData{
  final String email, password;
  final int puntaje;
  SingUpData({
   // required this.name,
    required this.email,
    required this.password,
    required this.puntaje,
  });
}

class SingUpResponse{
  final SignUpError? error;
  final User? user;

  SingUpResponse(this.error, this.user);
}

parseStringToSignUpError(String text){
  switch(text){
    case "email-already-in-use":
      return SignUpError.emailAlreadyInUse;
    case "weak-password":
      return SignUpError.weakPassword;
    case "network-request-failed":
      return SignUpError.networkRequestFailed;
    default:
      return SignUpError.unknown;
  }
}

enum SignUpError{emailAlreadyInUse, weakPassword, unknown,networkRequestFailed}