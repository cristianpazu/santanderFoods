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
      suffixIcon: //Image.asset('assets/buscar.png',width: 78,height: 2,fit: BoxFit.contain,),
      Icon(Icons.search_rounded, size: 40,color: Colors.grey,),
       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)) 
      ),
    );
  }
}