import 'package:flutter/material.dart';

class Textfields2 extends StatelessWidget {

   String? texto;
   final TextEditingController controller;
  final ValueChanged<String> onChanged;

   Textfields2({super.key, this.texto,  required this.controller,
    required this.onChanged,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
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