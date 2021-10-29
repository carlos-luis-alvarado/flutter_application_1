
import 'package:flutter_application_1/src/navigation/routes.dart';
import 'package:flutter_application_1/src/repository/auth_repository.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

class SplashController extends SimpleNotifier{
  final _authRepository=Get.i.find<AuthRepository>();
  
  String? _routeName;
  String? get routeName =>_routeName;

  SplashController(){
    _init();
  }

  void _init() async{
    final user =await _authRepository.user;
    _routeName= user !=null? Routes.INICIO: Routes.LOGIN;
   //si sesion activa, entra directamente a inicio en otro caso entra a login.
    notify();//involucra a las partes involucradas
  }

  /*@override
  void dispose(){
    print("dispose splash");
      super.dispose();
  }*/
}