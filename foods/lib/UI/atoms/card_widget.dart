import 'package:flutter/material.dart';
import 'package:foods/Utils/titutlos.dart';

class cardWidget extends StatelessWidget {
  Image? image;
  String? texto;
  double? ancho;
  double? altura;

  cardWidget({super.key, this.image, this.texto, this.ancho, this.altura});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 626,
      height: 167,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          ClipRRect(
            
            borderRadius: BorderRadius.circular(10), child: image),
          UiTexto(texto: texto, tamanioTexto: 'md').textoRobotoLight(),
        ],
      ),
    );
  }
}
