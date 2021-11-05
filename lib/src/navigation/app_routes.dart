import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/src/juego/home.dart';
import 'package:flutter_application_1/src/juego/quizpage.dart';
import 'package:flutter_application_1/src/navigation/routes.dart';
import 'package:flutter_application_1/src/pages/inicio_juego.dart';
import 'package:flutter_application_1/src/pages/login_page.dart';
import 'package:flutter_application_1/src/pages/register/registro_page.dart';
import 'package:flutter_application_1/src/pages/splash_page.dart';
import 'package:flutter_application_1/src/pages/premios.dart';
import 'package:flutter_application_1/src/pages/entrega.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
      Routes.SPLASH: (_) => const SplashPage(),
      Routes.LOGIN: (_) => LoginPage(),
      Routes.INICIO: (_) => InicioJuego(),
      Routes.REGISTER: (_) => RegistroPage(),
      Routes.HOME: (_) => homepage(),
      Routes.PREMIOS: (_) => premios(),
      Routes.ENTREGAPREMIOS: (_) => entrega(),
      //Routes.QUIZ:(_)=> getjson(langname),
    };
