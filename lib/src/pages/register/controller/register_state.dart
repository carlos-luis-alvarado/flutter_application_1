import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_state.freezed.dart';//si queremos agregar
//una nueva propiedad, eliminar el archivo y volver a correr el comando: flutter pub run build_runner build
@freezed
class RegisterState with _$RegisterState{

  factory RegisterState({
    @ Default('')String email,
    @ Default('')String password, //contraseña
    @ Default('')String Vpassword,//confirmación de contraseña
    @ Default('')String name,
    @ Default(0)int puntaje,
    @ Default(false)bool termsOk,

  }) =_RegisterState;


  static RegisterState get initialState => RegisterState();
}