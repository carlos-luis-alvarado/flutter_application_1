import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          children: [
            Flexible(   //se define el logo
              child: Image(
                image: AssetImage(
                  'images/crearlogo.png',
                ),
                width: 100.0,
              ),
            ),
            SizedBox(height: 10.0,width: double.infinity,),//se define nombre de la app
            Text('AVJujuy',style: TextStyle(color: Colors.black,fontSize: 25.0),),
            SizedBox(
              height: 15.0,
            ),
            _userTextField(),//correo electronico
            SizedBox(
              height: 15.0,
            ),
            _passwordTextField(),//contaseña
            SizedBox(
              height: 15.0,
            ),
            _buttonLogin(),//boton ingresar
            SizedBox(
              height: 15.0,
            ),
            Text('registrarse'),
            SizedBox(
              height: 20.0,
            ),
            _redesSociales(),
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
          onPressed: () {},
          icon: Icon(
            Icons.input_outlined,
          ),
          label: Text('Ingresar'));
    });
  }

  _redesSociales() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.facebook)),
          IconButton(onPressed: () {}, icon: Icon(Icons.facebook)),
          IconButton(onPressed: () {}, icon: Icon(Icons.facebook)),
        ],
      );
    });
  }
}
