import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/src/repository/auth_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AutenticationRepositoryI implements AuthRepository{
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  User? _user;

  final Completer<void> _completer= Completer();

  AutenticationRepositoryI({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  }):_auth=firebaseAuth,
  _googleSignIn=googleSignIn{
    _init();
  }
  
  @override
  Future<User?> get user async{//de esta manera me aseguro que por lomenos una vez se llamo a listen
    _completer.future;//y se retorna el usuario
    return _user;
  }
 
  void _init()async{
    _auth.authStateChanges().listen(
      (User? user){//escucha el evento
        if(!_completer.isCompleted){
          _completer.complete();
        }
        _user=user;
      }
    );
  }

  @override
  Future<void> signOut() {
    return _auth.signOut();
  }
  //VERIFICACIÓN DE QUE EL USUARIO ESTE REGISTRADO Y NO INGRESE DATOS INCORRECTOS
  @override
  Future<SignInResponse> singInWithEmailAndPassword(String email, String password, int puntaje)async {
    try{
      final UserCredential=await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password,
      );
      final user=UserCredential.user!;
      return SignInResponse(
        user: user,
        providerId: UserCredential.credential?.providerId,
        error: null,
        );
    } on FirebaseAuthException catch(e){
       return getSignInError(e);
    }
  }

  @override
  Future<SignInResponse> singInWithGoogle()async {
    try{
      final account = await _googleSignIn.signIn();
      if(account==null){
        return SignInResponse(
         error: SingInError.unknown,
         user:  null,
         providerId: null,
           );
      }
      final googleAuth= await account.authentication;
      final OAuthCredential=GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      final userCredential=await _auth.signInWithCredential(
        OAuthCredential,
        );
    return SignInResponse(
      error: null,
      user: userCredential.user,
      providerId: userCredential.credential?.providerId,);
    } on FirebaseAuthException catch(e){
       return getSignInError(e);
    }
  }
  }