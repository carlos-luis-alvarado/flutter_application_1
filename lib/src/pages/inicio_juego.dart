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
        return Container(
          height: MediaQuery.of(context).size.height - 200.0,
          decoration: const BoxDecoration(
          image:DecorationImage(//  PONER UNA IMÁGEN DE FONDO
                    image: AssetImage('images/fondo.jpg',),
                    fit: BoxFit.cover
                  ),
        ),
          child: Scaffold(
              appBar: AppBar(
                title: const Text(
                  '     BIENVENIDOS A JUJUY',
                  style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Architects Daughter',
                  fontSize: 25.0,
            ),
                ),
                backgroundColor: Colors.amber.shade400,
                ),
              backgroundColor: Colors.transparent,
              body:Column(
                children: <Widget>[
                  _swiperTarjetas(),
                  const SizedBox(height: 60.0,),
                  Stack(
                    children: [
                    Align(
                      alignment:const Alignment(0.60,0.8),
                      child:_buttonJuego()
                    ),
                    
                     Align(
                      alignment:const Alignment(0,-0.013),
                      child:_buttonPremios()
                    ),
                     Align(
                      alignment:const Alignment(-0.60,-0.05),
                      child:_buttonUbicaciones()
                    ),
                    ],
                    )
                ],
              ),     
          ),
        );
  }

  Widget _swiperTarjetas(){
    final _screenSize= MediaQuery.of(context).size;
    List<String> imgList = [
      "https://promociones-aereas.com.ar/wp-content/uploads/2019/09/10-lugares-en-jujuy-que-no-podes-perderte-los-colorados-cerro-7-colores-purmamarca-holding-world-1-1024x512.jpg.webp",
      "https://media.viajando.travel/p/a30dd40bd762703afe2526904b7ed794/adjuntos/255/imagenes/000/348/0000348488/jujuy-salinas-grandesjpg.jpg",
      "https://promociones-aereas.com.ar/wp-content/uploads/2019/09/10-lugares-en-jujuy-que-no-podes-perderte-en-jujuy-cerro-monta%C3%B1a-chani-1024x681.jpg.webp",
      "https://media.viajando.travel/p/5630ab283257e18d749bfc4fb0633e63/adjuntos/255/imagenes/000/348/0000348478/jujuy-laguna-pozuelosjpg.jpg",
      "https://media.viajando.travel/p/6732af207ecea5fec7733259663cbd82/adjuntos/255/imagenes/000/348/0000348458/jujuy-barrancasjpg.jpg",
      "https://www.patagonline.com/wp-content/uploads/2020/10/Screenshot-2020-10-20-at-14.46.48.jpg",
      "https://viajerosocultos.com/wp-content/uploads/2021/05/20210515_113848_HDR-scaled.jpg",
      "https://www.periodicolea.com.ar/wp-content/uploads/2019/02/pag-1-Jueves-de-Compadres.jpg",
      "https://www.nordic-travel.com.ar/es/wp-content/uploads/2020/06/humahuaca-galeria-5.jpg",
      "https://www.quebradadehumahuaca.com/info-gral/imagenes/quebrada-de-humahuaca-pucara-tilcara.jpg",
      "https://tripin.travel/wp-content/uploads/2020/05/Purmamarca-Jujuy.jpg",
      "https://somosjujuy-wordpress.s3.amazonaws.com/wp-content/uploads/2021/01/06171110/carnaval.jpg",
      "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/f6/70/ea/inca-cueva.jpg?w=1200&h=-1&s=1",
      "https://media.todojujuy.com/p/677000a117e3dc0611d6550112cbc802/adjuntos/227/imagenes/003/194/0003194169/quebrada-las-senoritas-foto-porafuerita.png?2021-10-06-11-09-29",
    ];
    
    return CardSwiper(lugares:imgList);
  }

  Widget _buttonJuego() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return FloatingActionButton(
        child: const Image(
          image: AssetImage(
              'images/juego.png',
          ),
        ),
        onPressed: () => router.pushNamed(Routes.HOME1),
        
        );
    }
    );
  }
  Widget _buttonPremios() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return FloatingActionButton(
        child: const Image(
          image: AssetImage(
              'images/trofeo.png',
          ),
        ),
        onPressed: () => router.pushNamed(Routes.PREMIOS),
        );
    }
    );
  }
  Widget _buttonUbicaciones() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return FloatingActionButton(
        child: const Image(
          image: AssetImage(
              'images/patas.png',
          ),
        ),
        onPressed: (){ },
        );
    }
    );
  }
}
