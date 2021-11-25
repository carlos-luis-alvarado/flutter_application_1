import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository{
  Future<User?> get user; //si retorna nulo no hay sesión activa
  Future<void> signOut();
  Future<SignInResponse> singInWithEmailAndPassword(
    String email, 
    String password,
    int puntaje,
    );
  Future<SignInResponse> singInWithGoogle();
}

class SignInResponse{
  final SingInError? error;
  final User? user;
  final String? providerId;

  SignInResponse({
   required this.error, 
    required this.user, 
    required this.providerId}
    );

}

enum SingInError{
  networkRequestFailed,
  userDisabled, 
  userNotFound,
  wrongPassword,
  unknown, 
  accountExistsWithDifferentCredential,
}

SignInResponse getSignInError(FirebaseAuthException e){
  late SingInError error;
  switch (e.code){
    case "user-disabled":
      error= SingInError.userDisabled;
      break;
    case "user-not-found":
      error= SingInError.userNotFound;
      break;
    case "network-request-failed":
      error= SingInError.networkRequestFailed;
      break;
    case "wrong-password":
      error= SingInError.wrongPassword;
      break;
    case "account-exists-with-different-credential":
       error= SingInError.accountExistsWithDifferentCredential;
       break; 
    default:
       error= SingInError.unknown;
  }
  return SignInResponse(error: error, user: null, providerId:e.credential?.providerId,);
}