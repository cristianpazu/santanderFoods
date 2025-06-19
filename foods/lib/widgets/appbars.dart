import 'package:flutter/material.dart';
import 'package:foods/Utils/ConstantesColor.dart';

class appBarHomeMenu extends StatelessWidget {

 

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
        color: Color(ConstantesColorTema.fondoColorAppbar),
      ),
      width: double.infinity,
      height: 250,
     
    );
  }
}
