//MÉTODOS PARA MANEJO DE LA BASE DE DATOS
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final firestoreInstance = FirebaseFirestore.instance;

void Anadir_firebase (){
        firestoreInstance.collection("Puntos_users").add({
        "correo" : "john",
         "Puntos" : 50,
    }).then((value){
       print(value.id);
    });
}
