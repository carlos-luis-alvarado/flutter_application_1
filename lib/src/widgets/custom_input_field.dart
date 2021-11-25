// CREAMOS UN WIDGET ESPECÍCICAMENTE PARA LOS TEXTFIELD 
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget{
  final void Function(String)? onChanged;
  final String label1;
  final String label2;
  final TextInputType? inputType;
  final Icon? incono;
  final bool isPassword;
  final String? Function(String?)? validator;
  const CustomInputField({Key? key, this.onChanged, required this.label1, 
  required this.label2, this.inputType, 
  this.incono, this.isPassword=false, this.validator}): super(key:key);
  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField>{
  late bool _obscureText;
  @override
  void initState(){
    super.initState();
    _obscureText=widget.isPassword;
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: FormField<String>(
          validator: widget.validator,
          initialValue: '',
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder:(State){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
              onChanged:(text){
                if(widget.validator !=null){
                  State.validate();
                  // ignore: invalid_use_of_protected_member
                  State.setValue(text);
                }
                if(widget.onChanged != null){
                  widget.onChanged!(text);
                }
              },//captura datos
              keyboardType: widget.inputType,
              obscureText: _obscureText,
              decoration:InputDecoration(
                  icon: widget.incono,
                  hintText:widget.label1,//'ejemplo@correo.com'
                  labelText:widget.label2,//'Correo electrónico'
                  suffixIcon: widget.isPassword? CupertinoButton(
                    child: Icon(_obscureText? Icons.visibility:Icons.visibility_off),
                    onPressed: (){
                      _obscureText= !_obscureText;
                    },
                    ):Container(
                      width: 0,
                    ),
                  ),
        ),
            if(State.hasError)Text(
              State.errorText!,
              style: const TextStyle(color: Colors.redAccent),
            )
            ],
          );
        })
      );
    });
  }
}