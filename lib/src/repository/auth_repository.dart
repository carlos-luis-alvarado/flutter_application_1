//import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository{
  Future<User?> get user; //si retorna nulo no hay sesión activa
}
//class AuthUser extends Equatable{
 // final String uid;
 // final String? email;

//  AuthUser(this.uid, this.email);
//  @override
  // TODO: implement props
//  List<Object?> props() =>[uid];
    
//}

//abstract class AuthRepositoryBase{
//   Stream<AuthUser> get onInAuthStateChanged;
//   Future<AuthUser?> signInAnonymously();
//   Future<void> signOut();
//}