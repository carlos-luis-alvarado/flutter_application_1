import 'package:flutter/widgets.dart'show GlobalKey,FormState;
import 'package:flutter_application_1/src/data/estado_global/session_controller.dart';
import 'package:flutter_application_1/src/repository/auth_repository.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

class LoginController extends SimpleNotifier{
  final SessionController _sessionController;//para tener en cuenta los datos de la bd
  String _email='',_password='';
  int _puntaje= 0;
  final _AuthRepository=Get.i.find<AuthRepository>();

  final GlobalKey<FormState> formKey=GlobalKey();

  LoginController(this._sessionController);


  void onEmailChanged(String text){
    _email=text;
  }
  void onPasswordChanged(String text){
    _password=text;
  }

  Future<SignInResponse>signInWithEmailAndPassword() async {
    final response= await _AuthRepository.singInWithEmailAndPassword(
      _email, 
      _password,
      _puntaje
    );
    //si proceso de autenticación es correcto guardamos los dtos
    //en sessión controller
    if(response.error==null){
      _sessionController.setUser(response.user!);
    }
    return response;
  }

  Future<SignInResponse> signInWithGoogle() async{
   return  _AuthRepository.singInWithGoogle();

  }

}