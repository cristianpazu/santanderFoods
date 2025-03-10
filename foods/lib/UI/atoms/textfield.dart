import 'package:flutter/material.dart';

class Textfields extends StatelessWidget {

   String? texto;

   Textfields({super.key, this.texto});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      decoration: InputDecoration(
        hintText: texto,
         filled: true,
         fillColor: Colors.white,
      suffixIcon: Image.asset('/buscar.png',width: 58,height: 5,fit: BoxFit.contain,),//Icon(Icons.search_rounded),
       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)) 
      ),
    );
  }
}