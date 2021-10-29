import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/src/repository/auth_repository.dart';

class AutenticationRepositoryI implements AuthRepository{
  final FirebaseAuth _auth;
  User? _user;

  final Completer<void> _completer= Completer();

  AutenticationRepositoryI(this._auth){
    _init();
  }
  
  @override
  // TODO: implement user
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
  }