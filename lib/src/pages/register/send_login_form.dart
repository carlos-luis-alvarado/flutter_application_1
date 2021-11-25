import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/navigation/routes.dart';
import 'package:flutter_application_1/src/pages/login_page.dart' show loginProvider;
import 'package:flutter_application_1/src/repository/auth_repository.dart';
import 'package:flutter_application_1/src/widgets/dialogs.dart';
import 'package:flutter_application_1/src/widgets/progress_dialog.dart';
import 'package:flutter_meedu/router.dart' as router;
Future<void> sendLoginForm(BuildContext context)async{
   final controller= loginProvider.read;
   final isValidForm=controller.formKey.currentState!.validate();
   if(isValidForm){
      ProgressDialog.show(context);
      final response= await controller.signInWithEmailAndPassword();
      router.pop();
      if(response.error !=null){
        String errorMessage="";
        switch(response.error){
          case SingInError.networkRequestFailed:
            errorMessage="network RequestFailed";
            break;
          case SingInError.userDisabled:
            errorMessage="user Disabled";
            break;
          case SingInError.userNotFound:
            errorMessage="user Not Found";
            break;
          case SingInError.wrongPassword:
            errorMessage="wrong Password";
            break;
          case SingInError.accountExistsWithDifferentCredential:
            errorMessage=response.providerId??"Invalid auth method";
            break;
          case SingInError.unknown:
          default:
            errorMessage="unknown";
            break;
        }
        Dialogs.alert(
          context,
          title: "ERROR",
          content: errorMessage,
        );
      }else{
        router.pushReplacementNamed(
        Routes.INICIO,
        );
      }
   }
}