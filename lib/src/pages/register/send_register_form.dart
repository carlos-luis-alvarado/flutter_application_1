import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/domain/imputs/sing_up.dart';
import 'package:flutter_application_1/src/navigation/routes.dart';
import 'package:flutter_application_1/src/pages/register/registro_page.dart';
import 'package:flutter_application_1/src/widgets/dialogs.dart';
import 'package:flutter_application_1/src/widgets/progress_dialog.dart';
import 'package:flutter_meedu/router.dart' as router;


Future<void> sendRegisterForm(BuildContext context) async {
 final controller = registerprovider.read;
 final isValidForm=controller.formKey.currentState!.validate();

 if(isValidForm){
   ProgressDialog.show(context);
   final response= await controller.sumit();
   //destrur el dialogo
   router.pop();
   if(response.error !=null){//verifica usuarios existentes
     late String content;
     switch(response.error){
       case SignUpError.emailAlreadyInUse:
         content="email already in use";//en uso
         break;
       case SignUpError.weakPassword:
         content="weak password";
         break;
       case SignUpError.networkRequestFailed:
          content="network RequestFailed";//en uso
         break;
       case SignUpError.unknown:
       default:
         content="unknown error";
         break;
     }
     Dialogs.alert(
       context,
       title: "ERROR",
       content: content,
    );
   }else{
     router.pushNamedAndRemoveUntil(Routes.INICIO);
   }
 }else{
   Dialogs.alert(
     context,
     title: "ERROR",
     content: "invalid fields",);
 }
}