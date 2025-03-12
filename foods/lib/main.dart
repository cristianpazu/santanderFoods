import 'package:flutter/material.dart';
import 'package:foods/UI/screens/comidas_rapidas/comida_rapidas.dart';
import 'package:foods/UI/screens/menu/menu.dart';
import 'package:foods/UI/screens/restaurantes/restaurantes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    
      home: const Menu(),
    );
  }
}

