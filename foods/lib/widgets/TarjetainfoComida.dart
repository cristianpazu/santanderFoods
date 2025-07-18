import 'package:flutter/material.dart';
import 'package:foods/Utils/titutlos.dart';
import 'package:foods/widgets/appbarComidasDetalles.dart';
import 'package:foods/widgets/appbars.dart';

class TarjetainfoComida extends StatelessWidget {
  const TarjetainfoComida({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Appbarcomidasdetalles(
          'assets/proximamente.jpg',
        ),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    UiTexto(texto: 'sadsa').textoRobotoLight5(),
                    SizedBox(
                      width: 150,
                    ),
                    Container(
                      height: 10,
                      width: 10,
                      color: Colors.green,
                    )
                  ],
                ),


                 Row(
                  children: [
                    UiTexto(texto: 'sadsa').textoRobotoLight5(),
                    SizedBox(
                      width: 150,
                    ),
                  
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     UiTexto(texto: 'sadsa').textoRobotoLight5(),
                    Row(
                      children: [
                        UiTexto(texto: 'sadsa').textoRobotoLight5(),
                        SizedBox(
                          width: 150,
                        ),
                       UiTexto(texto: 'sadsa').textoRobotoLight5(),
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
