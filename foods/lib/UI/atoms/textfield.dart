import 'package:flutter/material.dart';

class Textfields extends StatelessWidget {
  const Textfields({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      decoration: InputDecoration(
      suffixIcon:  Icon(Icons.search_rounded),
       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)) 
      ),
    );
  }
}