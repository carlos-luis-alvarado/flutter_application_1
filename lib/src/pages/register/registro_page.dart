import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/login_page.dart';
import 'package:flutter_application_1/src/transiciones/fade_transition.dart';


class RegistroPage extends StatefulWidget {
  //const RegistroPage ({Key? key}):super(key:key);
  static String id = 'registro_page';
  @override
  _RegistroPageState createState() => _RegistroPageState();
}
//VIDEO 8 MIN 6
class _RegistroPageState extends State<RegistroPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber.shade300,
        body: Center(
        child: Column(
          children: [
            const Flexible(   //se define el logo
              child: Image(
                image: AssetImage(
                  'images/crearlogo.png',
                  
                ),
                width: 150.0,
                height: 180.0,
              ),
            ),
            const SizedBox(height: 10.0,width: double.infinity,),//se define nombre de la app
            const Text('AVJujuy',style: TextStyle(fontFamily: 'Architects Daughter', color: Colors.black,fontSize: 45.0,),),
            const SizedBox(
              height: 10.0,
            ),
            _userTextField(),//correo electronico
            const SizedBox(
              height: 20.0,
            ),
            _passwordTextField(),//contaseña
            const SizedBox(
              height: 25.0,
            ),
            _buttonRegister(),//boton registrar
            const SizedBox(
              height: 45.0,
            ),
            const Text('Ya tiene una Cuenta?'),
            _buttonLogin(),//boton ingresar
          ],
        ),
      )),
    );
  }

  Widget _userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'ejemplo@correo.com',
              labelText: 'Correo electrónico'),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _passwordTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
              icon: Icon(Icons.lock_outline),
              hintText: 'Contraseña',
              labelText: 'Contraseña'),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _buttonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).push(
              Fade_Transition(LoginPage()),
            );
          },
          icon: Icon(
            Icons.input_outlined,
          ),
          label: Text('Ingresar'),
           style: ElevatedButton.styleFrom(
            fixedSize: Size(200, 30),
            primary: Colors.green.shade500,
            shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))
          ));
    });
  }

  Widget _buttonRegister() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).push(
              Fade_Transition(RegistroPage()),
            );
          },
          icon: Icon(
            Icons.app_registration,
          ),
          label: Text('Registrarse'),
          style: ElevatedButton.styleFrom(
            fixedSize: Size(200, 30),
            primary: Colors.green.shade500,
            shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))
          )); 
    });
  }

}