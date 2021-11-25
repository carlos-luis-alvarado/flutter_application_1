import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/src/data/estado_global/session_controller.dart';
import 'package:flutter_application_1/src/domain/imputs/sing_up.dart';
import 'package:flutter_application_1/src/pages/register/controller/register_state.dart';
import 'package:flutter_application_1/src/repository/sing_up_repository.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

class registerController extends StateNotifier<RegisterState>{
  final SessionController _sessionController;
  registerController(this._sessionController) : super(RegisterState.initialState);
  final GlobalKey<FormState>formKey=GlobalKey();
  final _signUpRepository=Get.i.find<SingUpRepository>();

  Future<SingUpResponse> sumit() async {//cuando se toca el boton registrar se consume este método
    final response= await _signUpRepository.register(
      SingUpData(
        email: state.email,
        password: state.password, 
        puntaje: 0, 
        ),
      );
      if(response.error==null){
         _sessionController.setUser(response.user!);
      }
      return response;
  }
  //GUARDAMOS LOS ESTADOS
  void onEmailChanged(String text){
    state =state.copyWith(email:text);
  }
  void onPasswordChanged(String text){
    state =state.copyWith(password:text);
  }
  void onVPasswordChanged(String text){
    state =state.copyWith(Vpassword:text);
  }
}