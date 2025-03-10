import 'package:flutter/material.dart';
import 'package:foods/UI/atoms/textfield.dart';
import 'package:foods/Utils/titutlos.dart';

class comidas_rapidas extends StatelessWidget {
  const comidas_rapidas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: UiTexto(texto: 'Comidas rapidas').textoRobotoBold(),),
      body: Column(
        children: [
          SizedBox(height: 10,),
         Textfields(),
          SizedBox(height: 10,),
          Container()


        ],
      ),
    );
  }
}