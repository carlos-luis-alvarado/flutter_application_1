import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/navigation/routes.dart';
import 'package:flutter_application_1/src/pages/Inicio_juego.dart';
import 'package:flutter_application_1/src/transiciones/fade_transition.dart';
import 'package:sign_button/sign_button.dart';
import 'package:flutter_meedu/router.dart' as router;

class LoginPage extends StatefulWidget {
  //const LoginPage({Key? key}): super(key:key);
  static String id = 'login_page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.amber.shade300, //COLOR DE FONDO
          body: Center(
            child: Column(
              children: [
                const Flexible(
                  //se define el logo
                  child: Image(
                    image: AssetImage(
                      'images/crearlogo.png',
                    ),
                    width: 150.0,
                    height: 180.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                  width: double.infinity,
                ), //se define nombre de la app
                const Text(
                  'AVJujuy',
                  style: TextStyle(
                    fontFamily: 'Architects Daughter',
                    color: Colors.black,
                    fontSize: 45.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                _userTextField(), //correo electronico
                const SizedBox(
                  height: 20.0,
                ),
                _passwordTextField(), //contaseña
                const SizedBox(
                  height: 25.0,
                ),
                _buttonLogin(), //boton ingresar
                const SizedBox(
                  height: 15.0,
                ),
                const Text('ingresar con'),
                _redesSociales(),
                const SizedBox(
                  height: 30.0,
                ),
                const Text('Aún no esta Registrado?'),
                _buttonRegister(), //boton ingresar
              ],
            ),
          )),
    );
  }

  Widget _userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: const InputDecoration(
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
              Fade_Transition(InicioJuego()),
            );
          },
          icon: const Icon(
            Icons.input_outlined,
          ),
          label: const Text('Ingresar'),
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(200, 30),
              primary: Colors.green.shade500,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))));
    });
  }

  Widget _buttonRegister() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton.icon(
          onPressed: () =>router.pushNamed(Routes.REGISTER),
            
           /* Navigator.of(context).push(
              Fade_Transition(RegistroPage()),
            );
          },*/
          icon: const Icon(
            Icons.app_registration,
          ),
          label: const Text('Registrarse'),
          style: ElevatedButton.styleFrom(
              fixedSize: Size(200, 30),
              primary: Colors.green.shade500,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))));
    });
  }

  _redesSociales() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //IconButton(onPressed: () {}, icon: Icon(Icons.facebook)),
          SignInButton.mini(
            buttonType: ButtonType.facebook,
            onPressed: () {},
          ),
          SignInButton.mini(
            buttonType: ButtonType.google,
            onPressed: () {},
          ),
          SignInButton.mini(
            buttonType: ButtonType.instagram,
            onPressed: () {},
          ),
        ],
      );
    });
  }
}
