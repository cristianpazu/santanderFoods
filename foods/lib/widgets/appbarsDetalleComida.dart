import 'package:flutter/material.dart';
import 'package:foods/Utils/ConstantesColor.dart';

class appBarHomeComida extends StatelessWidget {

Widget child;

  appBarHomeComida(this.child); 
 

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)
            
            
            ),
        color: Color(ConstantesColorTema.fondoColorAppbar),
      ),
      width: double.infinity,
      height: 250,
      child: child,
     
    );
  }
}
