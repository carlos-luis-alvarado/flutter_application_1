import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/src/juego/home1.dart';
import 'package:flutter_application_1/src/navigation/routes.dart';
import 'package:flutter_application_1/src/pages/entrega.dart';
import 'package:flutter_application_1/src/pages/inicio_juego.dart';
import 'package:flutter_application_1/src/pages/login_page.dart';
import 'package:flutter_application_1/src/pages/premios.dart';
import 'package:flutter_application_1/src/pages/register/registro_page.dart';
import 'package:flutter_application_1/src/pages/splash_page.dart';
import 'package:flutter_application_1/src/pages/premios.dart';
import 'package:flutter_application_1/src/pages/entrega.dart';

Map<String, Widget Function(BuildContext)> get appRoutes =>{
  Routes.SPLASH:(_) => const SplashPage(),
  Routes.LOGIN:(_)=>  const LoginPage(),
  Routes.INICIO:(_)=> InicioJuego(),
  Routes.REGISTER:(_)=> const RegistroPage(),
  Routes.PREMIOS: (_) => premios(),
  Routes.ENTREGAPREMIOS:(_) => const entrega(),
  Routes.HOME1: (_) => const homepage1(),

};
