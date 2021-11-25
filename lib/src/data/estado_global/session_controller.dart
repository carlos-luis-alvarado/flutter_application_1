import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/src/repository/auth_repository.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

//SE PUEDE USAR PARA MODIFICAR LOS ATRIBUTOS DEL USUARIO
class SessionController extends SimpleNotifier{
  User? _user;
  User? get user => _user;

  final _auth =Get.i.find<AuthRepository>();

  void setUser(User user){
    _user=user;
    notify();
  }

  Future<void>signOut() async{
    await _auth.signOut();
    _user=null;
  }

}
final sessionProvider=SimpleProvider(
  (_)=>SessionController(),
  autoDispose: false,
);