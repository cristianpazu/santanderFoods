import 'package:flutter/material.dart';
import 'package:foods/UI/screens/restaurantes/restaurantes.dart';
import 'package:foods/Utils/titutlos.dart';

class cardWidget extends StatelessWidget {
  Image? image;
  String? texto;
  double? ancho;
  double? altura;
  Color? colors;

  cardWidget({super.key, this.image, this.texto, this.ancho, this.altura, this.colors});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Restaurantes(),
              ));
        },
        child: Container(
          width: ancho,
          height: altura,
          decoration: BoxDecoration(
              color: colors,
              borderRadius: BorderRadius.all(Radius.circular(9))),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                    height: 110, width: 112, color: Colors.white, child: image),
              ),
              UiTexto(texto: texto, tamanioTexto: 'md').textoRobotoLight2(),
            ],
          ),
        ),
      ),
    );
  }
}

//RESTAURANT

class cardWidget2 extends StatelessWidget {
  Image? image;
  String? texto;
  Icon? icon2;
  double? ancho;
  double? altura;
  Color? colors;

  cardWidget2({super.key, this.image, this.texto, this.icon2 ,this.ancho, this.altura, this.colors});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Restaurantes(),
              ));
        },
        child: Container(
          width: ancho,
          height: altura,
          decoration: BoxDecoration(
              color: colors,
              borderRadius: BorderRadius.all(Radius.circular(9))),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                    height: 110, width: 112, color: Colors.white, child: image),
              ),
              UiTexto(texto:'nombre: $texto', tamanioTexto: 'md').textoRobotoLight2(),
            icon2 ?? Icon(Icons.calendar_month_outlined)
            ],
          ),
        ),
      ),
    );
  }
}
