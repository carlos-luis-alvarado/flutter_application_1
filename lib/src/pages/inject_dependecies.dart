import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/src/data/repositori_imp/autentication_repository.dart';
import 'package:flutter_application_1/src/data/repositori_imp/sing_up_repository.dart';
import 'package:flutter_application_1/src/repository/auth_repository.dart';
import 'package:flutter_application_1/src/repository/sing_up_repository.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/meedu.dart';

void injectDependencies(){
   Get.i.lazyPut<AuthRepository>(
     ()=>AutenticationRepositoryI(FirebaseAuth.instance),
   );
   Get.i.lazyPut<SingUpRepository>(
     ()=>SingUpRepositoryImp(
       FirebaseAuth.instance),
   );
}