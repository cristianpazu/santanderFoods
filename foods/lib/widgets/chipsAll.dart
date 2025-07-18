import 'package:flutter/material.dart';
import 'package:foods/Utils/ConstantesColor.dart';
import 'package:foods/Utils/titutlos.dart';

class chipAll extends StatelessWidget {
  
  final String? text;

   chipAll(this.text);

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Color(ConstantesColorTema.fondoColorAppbar),
      label: 
UiTexto(texto: text ?? '').textoRobotoLight2()
    );
  }
}