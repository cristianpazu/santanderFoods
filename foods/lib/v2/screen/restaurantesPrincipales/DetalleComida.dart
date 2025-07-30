import 'package:flutter/material.dart';
import 'package:foods/Utils/tarjetasInfoMenu.dart';
import 'package:foods/widgets/TarjetainfoComida.dart';

class Detallecomida extends StatelessWidget {
   String images;
    String nombreComida;
  String descripcion;
  Widget salsas;
  String valor;
   Widget agregarComida;
  
   Detallecomida(this.images, this.nombreComida, this.descripcion, this.salsas ,this.valor,this.agregarComida);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        TarjetainfoComida(
          images,
          nombreComida,
          descripcion,
          salsas,
          valor,
          agregarComida
        )
        ],
      ),
    );
  }
}