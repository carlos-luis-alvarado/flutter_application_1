import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/data/estado_global/session_controller.dart';
import 'package:flutter_application_1/src/pages/register/controller/register_state.dart';
import 'package:flutter_application_1/src/pages/register/email_validator.dart';
import 'package:flutter_application_1/src/pages/register/register_controller.dart';
import 'package:flutter_application_1/src/pages/register/send_register_form.dart';
import 'package:flutter_application_1/src/widgets/custom_input_field.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/meedu.dart';

//INSTALAR EN EXTENCIONES MEEDU
final registerprovider = StateProvider<registerController, RegisterState>(
  (_) => registerController(sessionProvider.read),
);

class RegistroPage extends StatelessWidget {
  const RegistroPage ({Key? key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return ProviderListener<registerController>(
      provider:registerprovider, 
      builder:(_,controller){
        return SafeArea(
        child: Scaffold(
        backgroundColor: Colors.amber.shade300,
        body: Center(
        child:Form(
          key:controller.formKey,
          child: ListView(
            padding: const EdgeInsets.all(15),
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
            const Text('      AVJujuy',
            style: TextStyle(fontFamily: 'Architects Daughter', color: Colors.black,fontSize: 45.0,),),
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
                return isValidEmail(text!)?null: "invalid email";
              },
              ),
            //_userTextField(),//correo electronico
            const SizedBox(
              height: 20.0,
            ),
            CustomInputField(
              label1: 'Contraseña',
              label2: 'Contraseña',
              inputType: TextInputType.emailAddress,
              incono: const Icon(Icons.lock_outline),
              onChanged:controller.onPasswordChanged,
              isPassword: true,
              validator: (text){
                if(text!.trim().length>=5){
                  return null;
                }
                return "invalid password";
              },
              ),
             const SizedBox(
              height: 20.0,
            ),
            Consumer(
              builder: (_, watch, __) {
                watch(registerprovider.select((_) => _.password));//redibuja los datos del campo vpassword
                return CustomInputField(
                  label1: 'verificación password',
                  label2: 'verificación password',
                  inputType: TextInputType.emailAddress,
                  incono: const Icon(Icons.lock_outline),
                  onChanged: controller.onVPasswordChanged,
                  isPassword: true,
                  validator: (text){//se escucha el campo de password 
                    if(controller.state.password!=text){
                      return "password no coinciden";
                    }
                    if(text!.trim().length>=5){
                      return null;
                    }
                    return "invalid password";
                  },
                ); 
              }
              ),
            //_passwordTextField(),//contaseña
            const SizedBox(
              height: 25.0,
            ),
            _buttonRegister(),//boton registrar
          ],
        ),
      
          ) 
        )),
    );
      }
    ); 
  }

  Widget _buttonRegister() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton.icon(
          onPressed: ()=>sendRegisterForm(context),
          icon: const Icon(
            Icons.app_registration,
          ),
          label: const Text('Registrarse'),
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(10, 30),
            primary: Colors.green.shade500,
            shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))
          )); 
    });
  }
}

