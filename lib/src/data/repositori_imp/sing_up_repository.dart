

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/src/domain/imputs/sing_up.dart';
import 'package:flutter_application_1/src/repository/sing_up_repository.dart';

class SingUpRepositoryImp implements SingUpRepository{
  final FirebaseAuth _auth;

  SingUpRepositoryImp(this._auth);
  @override
  Future<SingUpResponse> register(SingUpData data) async {
    try{
      final UserCredential=await _auth.createUserWithEmailAndPassword(
      email: data.email, 
      password:data.password,
      );
      UserCredential.user!.updateDisplayName(
        "${data.name}${data.lastname}",
        );
      return SingUpResponse(null, UserCredential.user!);
    }on FirebaseException catch(e){
      return SingUpResponse(e.code,null);
    }
    
  }

}