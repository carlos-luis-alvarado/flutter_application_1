import 'package:flutter/material.dart';

abstract class Routes {
  static const SPLASH = '/SPALSH';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const INICIO = '/inicio_juego';
  static const HOME = '/home';
  static const QUIZ = '/quiz';
  static const PREMIOS = '/premios';
  static const ENTREGAPREMIOS = '/entrega';

  static Route routes(RouteSettings routesSettings) {
    switch (routesSettings.name) {
      case LOGIN:
      // return _buildRoute();
      default:
        throw Exception('no existe');
    }
  }

  static MaterialPageRoute _buildRoute(Function build) =>
      MaterialPageRoute(builder: (context) => build(context));
}
