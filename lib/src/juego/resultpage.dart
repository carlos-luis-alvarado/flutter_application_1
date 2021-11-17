import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/juego/home.dart';

class resultpage extends StatefulWidget {
  int marks = 0;
  resultpage({Key? key, required this.marks})
      : super(key: key); //cambiar required por @required
  @override
  _resultpageState createState() => _resultpageState(marks);
}

class _resultpageState extends State<resultpage> {
  List<String> images = [
    "images/puntos_altos.png",
    "images/puntos_bajos.png",
    "images/puntos_medios.png"
  ];

  String message;
  String image;

  @override
  void initState() {
    if (marks < 10) {
      image = images[1];
      message = "Deberías esforzarte..\n" + "Puntos Obtenidos $marks";
    } else if (marks < 20) {
      image = images[2];
      message = "Esta mal, pero no tan mal..\n" + "Puntos Obtenidos $marks";
    } else {
      image = images[0];
      message = "Lo hiciste muy bien..\n" + "Puntos Obtenidos $marks";
    }
    super.initState();
  }

  int marks;
  _resultpageState(this.marks,
      [this.image = "images/good.png", this.message = 'bien hecho']); //cambios

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Column(
        children: <Widget>[
          // ENCABEZADO

          Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "RESULTADO",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 48.0,
                    fontFamily: "Ceviche One",
                  ),
                ),
              )),

          // PARTE CENTRAL

          Expanded(
            flex: 8,
            child: Material(
              elevation: 10.0,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      child: Container(
                        width: 300.0,
                        height: 300.0,
                        child: ClipRect(
                          child: ElasticIn(
                            child: Image(
                              image: AssetImage(
                                image,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 3.0,
                          horizontal: 15.0,
                        ),
                        child: Center(
                          child: ElasticInUp(
                            child: Text(
                              message,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 60.0,
                                fontFamily: "Road Rage",
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),

          // parte final

          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlinedButton(
                  // botón continuar

                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.teal,
                    shadowColor: Colors.red,
                    elevation: 10,
                  ),

                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => homepage(),
                    ));
                  },
                  child: Text(
                    "VOLVER A JUGAR",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
