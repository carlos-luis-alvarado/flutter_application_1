import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';

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
                width: 150.0,
                height: 180.0,
              ),
            ),
            SizedBox(height: 10.0,width: double.infinity,),//se define nombre de la app
            Text('AVJujuy',style: TextStyle(fontFamily: 'Architects Daughter', color: Colors.black,fontSize: 45.0,),),
            SizedBox(
              height: 10.0,
            ),
            _userTextField(),//correo electronico
            SizedBox(
              height: 20.0,
            ),
            _passwordTextField(),//contaseña
            SizedBox(
              height: 25.0,
            ),
            _buttonLogin(),//boton ingresar
            SizedBox(
              height: 15.0,
            ),
            Text('ingresar con'),
            _redesSociales(),
            SizedBox(
              height: 30.0,
            ),
            Text('Aún no esta Registrado?'),
            _buttonRegister(),//boton ingresar
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
          onPressed: () {},
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
