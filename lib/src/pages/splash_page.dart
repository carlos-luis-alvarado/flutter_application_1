

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/splash_controller.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/router.dart'as router;
final splashProvider= SimpleProvider(
  (_)=>SplashController(),
  //autoDispose: true, //cuando se crea el splash controller
  //en ese momento se detecta la pantalla activa en la app
  //cuando es detruir se libera llama al método disposse 
  );

class SplashPage extends StatelessWidget{
  const SplashPage({Key? key}): super(key:key);
  @override
  Widget build(BuildContext context) {
    return  ProviderListener<SplashController>(
      provider: splashProvider, 
      onChange: (_,controller){
        final routeName= controller.routeName;
        if(routeName!=null){
          router.pushReplacementNamed(routeName);
          //Navigator.pushReplacementNamed(context, routeName);
        }//elimino la pagina actual del stack y navego a login o inicio....
      },
      builder: (_,__){
           return const Scaffold(
              body: Center(
                  child: CircularProgressIndicator(),
              ),
           );
      }
    );
  }
}
