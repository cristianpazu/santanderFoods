import 'package:flutter/material.dart';
import 'package:foods/UI/atoms/show_dialog.dart';
import 'package:foods/UI/screens/restaurantes/restaurantes.dart';
import 'package:foods/Utils/titutlos.dart';

class cardWidget extends StatelessWidget {
  Image? image;
  String? texto;
  double? ancho;
  double? altura;
  Color? colors;

  cardWidget(
      {super.key,
      this.image,
      this.texto,
      this.ancho,
      this.altura,
      this.colors});

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
  Widget? icon2;
  double? ancho;
  double? altura;
  Color? colors;
  Widget? redireccionamiento;

  cardWidget2(
      {super.key,
      this.image,
      this.texto,
      this.icon2,
      this.ancho,
      this.altura,
      this.colors,
      this.redireccionamiento});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => redireccionamiento!,
              ));
        },
        child: Container(
          width: ancho,
          height: altura,
          decoration: BoxDecoration(
              color: colors,
              borderRadius: BorderRadius.all(Radius.circular(9))),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                      height: 110,
                      width: 112,
                      color: Colors.white,
                      child: image),
                ),
                UiTexto(texto: 'nombre: $texto', tamanioTexto: 'md')
                    .textoRobotoLight2(),
                IconButton(onPressed: () {}, icon: icon2 ?? Icon(Icons.abc))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// COMIDA

class cardWidget3 extends StatelessWidget {
  Image? image;
  String? texto;

  double? ancho;
  double? altura;
  Color? colors;
  Widget? redireccionamiento;

  cardWidget3(
      {super.key,
      this.image,
      this.texto,
      this.ancho,
      this.altura,
      this.colors,
      this.redireccionamiento});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => redireccionamiento!,
              ));
        },
        child: Container(
          width: ancho,
          height: altura,
          decoration: BoxDecoration(
              color: colors,
              borderRadius: BorderRadius.all(Radius.circular(9))),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                      height: 110,
                      width: 112,
                      color: Colors.white,
                      child: image),
                ),
                UiTexto(texto: 'nombre: $texto', tamanioTexto: 'md')
                    .textoRobotoLight2(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//comidass
class cardWidget4 extends StatelessWidget {
  Image? image;
  String? texto;

  double? ancho;
  double? altura;
  Color? colors;
  Widget? redireccionamiento;

  cardWidget4(
      {super.key,
      this.image,
      this.texto,
      this.ancho,
      this.altura,
      this.colors,
      this.redireccionamiento});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => redireccionamiento!,
              ));
        },
        child: Container(
          width: ancho,
          height: altura,
          decoration: BoxDecoration(
              color: colors,
              borderRadius: BorderRadius.all(Radius.circular(9))),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                      height: 110,
                      width: 112,
                      color: Colors.white,
                      child: image),
                ),
                Container(
                  
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: UiTexto(texto: 'nombre: $texto', maxLines: 2,tamanioTexto: 'md')
                      .textoRobotoLight2(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
