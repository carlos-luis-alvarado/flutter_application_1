import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/navigation/routes.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:flutter_application_1/src/widgets/card_swiper.dart';

class InicioJuego extends StatefulWidget {
  static String id = 'inicia_juego';
  @override
  _InciaPageState createState() => _InciaPageState();
}

class _InciaPageState extends State<InicioJuego> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BIENVENIDOS A JUJUY'),
        backgroundColor: Colors.amber.shade900,
      ),
      backgroundColor: Colors.amber.shade300,
      body: Container(
        child: Column(
          children: <Widget>[
            _swiperTarjetas(),
            const SizedBox(
              height: 50.0,
            ),
            _buttonLogin(), //boton ingresar
          ],
        ),
      ),
    );
  }

  Widget _swiperTarjetas() {
    final _screenSize = MediaQuery.of(context).size;
    List<String> images = [
      "https://www.patagonline.com/wp-content/uploads/2020/10/Screenshot-2020-10-20-at-14.46.48.jpg",
      "https://viajerosocultos.com/wp-content/uploads/2021/05/20210515_113848_HDR-scaled.jpg",
      "https://www.periodicolea.com.ar/wp-content/uploads/2019/02/pag-1-Jueves-de-Compadres.jpg",
      "https://www.nordic-travel.com.ar/es/wp-content/uploads/2020/06/humahuaca-galeria-5.jpg",
      "https://www.quebradadehumahuaca.com/info-gral/imagenes/quebrada-de-humahuaca-pucara-tilcara.jpg",
      "https://tripin.travel/wp-content/uploads/2020/05/Purmamarca-Jujuy.jpg",
      "https://somosjujuy-wordpress.s3.amazonaws.com/wp-content/uploads/2021/01/06171110/carnaval.jpg",
    ];

    return CardSwiper(lugares: images);
  }

  Widget _buttonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Column(
        children: <Widget>[
          ElevatedButton.icon(
              onPressed: () => router.pushNamed(Routes.HOME),
              icon: const Icon(
                Icons.input_outlined,
              ),
              label: const Text('jugar'),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 30),
                  primary: Colors.green.shade500,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)))),
          ElevatedButton.icon(
              onPressed: () => router.pushNamed(Routes.PREMIOS),
              icon: const Icon(
                Icons.input_outlined,
              ),
              label: const Text('Premios'),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 30),
                  primary: Colors.blue.shade500,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)))),
        ],
      );
    });
  }
}
