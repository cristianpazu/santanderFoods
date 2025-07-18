import 'package:flutter/material.dart';
import 'package:foods/Utils/tarjetasInfoMenu.dart';
import 'package:foods/widgets/TarjetainfoComida.dart';

class Detallecomida extends StatelessWidget {
  const Detallecomida({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        TarjetainfoComida(
          
        )
        ],
      ),
    );
  }
}