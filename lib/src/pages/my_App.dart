import 'package:flutter/material.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:flutter_application_1/src/navigation/app_routes.dart';
import 'package:flutter_application_1/src/navigation/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      navigatorKey: router.navigatorKey,
      initialRoute: Routes.SPLASH,
      navigatorObservers: [
          router.observer,// va poder detectar el stack de páginas a cambiado
      ],
      routes: appRoutes,

      //home: Scaffold(body: LoginPage()),
     // routes: <String, WidgetBuilder>{
     //   '/login': (BuildContext context) => LoginPage(),
     //   '/registro': (BuildContext context) => RegistroPage(),
     //   '/juego': (BuildContext context) => InicioJuego(),
      //},
    );
  }
}