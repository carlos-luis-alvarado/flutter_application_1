import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/data/estado_global/session_controller.dart';
import 'package:flutter_application_1/src/navigation/routes.dart';
import 'package:flutter_application_1/src/pages/register/email_validator.dart';
import 'package:flutter_application_1/src/pages/register/login_controller.dart';
import 'package:flutter_application_1/src/pages/register/send_login_form.dart';
import 'package:flutter_application_1/src/widgets/custom_input_field.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/state.dart';
import 'package:sign_button/sign_button.dart';
import 'package:flutter_meedu/router.dart' as router;

final loginProvider= SimpleProvider(
  (_)=> LoginController(sessionProvider.read),
);

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {

    return ProviderListener<LoginController>(
      provider: loginProvider,
      builder: (_,controller){
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.amber.shade300, //COLOR DE FONDO
            body: Center(
            child:GestureDetector(
              onTap: ()=>FocusScope.of(context).unfocus(),
              child:Container(
                color: Colors.transparent,
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                child:Form(
                  key:controller.formKey,
                  child: Column(
                  children: [
                    const Flexible(//se define el logo
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
                CustomInputField(
                    label1: 'ejemplo@correo.com',
                    label2: 'Correo electrónico',
                    inputType: TextInputType.emailAddress,
                    incono: const Icon(Icons.email),
                    onChanged: controller.onEmailChanged,
                    validator: (text){
                      if(isValidEmail(text!)){
                        return null;
                      }
                      return "Invalid email";
                    },
                ),

                const SizedBox(
                  height: 20.0,
                ),
                CustomInputField(
                    label1: 'Contraseña',
                    label2: 'Contraseña',
                    inputType: TextInputType.emailAddress,
                    incono: const Icon(Icons.lock_outline),
                    onChanged: controller.onPasswordChanged,
                    isPassword: true,
                    validator: (text){
                      if(text!.trim().length>=6){
                        return null;
                      }
                      return"Invalid pasword";
                    },
                ),
                
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
            ) ,
          ) ,
        )
        
      );
    },
  );
}

  Widget _buttonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton.icon(
          onPressed: ()=> sendLoginForm(context),
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
          icon: const Icon(
            Icons.app_registration,
          ),
          label: const Text('Registrarse'),
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(200, 30),
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
