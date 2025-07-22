import 'package:flutter/material.dart';
import 'package:foods/Utils/titutlos.dart';
import 'package:foods/widgets/appbarComidasDetalles.dart';
import 'package:foods/widgets/appbars.dart';

class TarjetainfoComida extends StatelessWidget {
  String nombreComida;
  String descripcion;
  String valor;
  String images;
  Widget agregarComida;
  TarjetainfoComida(
      this.images, this.nombreComida, this.descripcion, this.valor, this.agregarComida);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Appbarcomidasdetalles(images),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        width: 290,
                        child: UiTexto(texto: nombreComida, maxLines: 2)
                            .textoRobotoLight5()),
                    
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: 290,
                        child: UiTexto(texto: descripcion, maxLines: 8)
                            .textoRobotoLightText()),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiTexto(texto: 'Total a pagar').textoRobotoLightTextLight(),
                      
                    Row(
                      children: [
                        UiTexto(texto: valor).textoRobotoLight5(),
                        SizedBox(
                          width: 90,
                        ),
                        //  UiTexto(texto: 'sadsa').textoRobotoLight5(),
                       agregarComida
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
