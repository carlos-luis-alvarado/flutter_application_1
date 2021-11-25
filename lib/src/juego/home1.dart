import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/juego/quizpage.dart';

class homepage1 extends StatelessWidget {
  const homepage1({Key? key}) : super(key: key);

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
          backgroundColor: Colors.transparent,
          appBar: AppBar(
             title: const Text('¡Pulsa una región!',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Architects Daughter',
                  fontSize: 35.0
                ),
              ),
           backgroundColor: Colors.amber.shade400,
           ),
          body:Center(
                child: Stack(
                  children:[ const Align(//UBICAR IMÁGEN
                    alignment:Alignment(0.30,-0.7),
                    child: Image(
                    image: AssetImage(
                         'images/regiones.png',
                    ),
                    width: 300,
                   ),         
                  ),
                    Align(
                      alignment:const Alignment(-0.90,-0.84),
                      child: _buttonRegion('Puna')
                      ),
                    Align(
                      alignment:const Alignment(0.75,-0.67),
                      child: _buttonRegion('Quebrada')
                    ),
                    Align(
                      alignment:const Alignment(0.90,-0.1),
                      child: _buttonRegion('Valles')
                    ),
                    Align(
                      alignment:const Alignment(-0.20,-0.05),
                      child: _buttonRegion('Yungas')
                    ),
                  ]
                ),
              ),
          ), 
  
        );
  }
  Widget _buttonRegion(String nombre) {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
          child: Text(nombre,
             style: const TextStyle(
                    color: Colors.black,
                  ),),
          onPressed: () {
             Navigator.of(context).pushReplacement(MaterialPageRoute(
             builder: (context) => getjson(nombre),
          ));
           },
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(95, 95),
              primary: Colors.green.shade500,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)))
      );
  });
  }
}