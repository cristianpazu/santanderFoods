import 'package:flutter/material.dart';
import 'package:foods/Utils/ConstantesColor.dart';
import 'package:foods/Utils/titutlos.dart';

class chipAll extends StatelessWidget {
  
  final String? text;
 final VoidCallback? onTap;
   chipAll(this.text, this.onTap,{super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        backgroundColor: Color(ConstantesColorTema.fondoColorAppbar),
        label: 
      UiTexto(texto: text ?? '').textoRobotoLight2()
      ),
    );
  }
}