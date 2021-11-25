import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/inject_dependecies.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:flutter_application_1/src/navigation/app_routes.dart';
import 'package:flutter_application_1/src/navigation/routes.dart';

void main() async {
  //SystemChrome.setEnabledSystemUIOverlays([]);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  injectDependencies();
  runApp(MyApp(),);
}
class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

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

    );
  }
}


