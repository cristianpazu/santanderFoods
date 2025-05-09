import 'package:flutter/material.dart';
import 'package:foods/UI/atoms/show_dialog.dart';
import 'package:foods/UI/screens/menu/menu.dart';
import 'package:foods/UI/screens/restaurantes/restaurantes.dart';
import 'package:foods/Utils/ConstantesColor.dart';
import 'package:foods/Utils/titutlos.dart';

class cardWidget extends StatelessWidget {
  Image? image;
  String? texto;
  double? ancho;
  double? altura;
  Color? colors;
  Widget? redireccionamiento;

  cardWidget(
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
                builder: (context) => redireccionamiento ?? Menu(),
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
  String? subTexto;
  double? ancho;
  double? altura;
  Color? colors;
  Widget? redireccionamiento;

  cardWidget3(
      {super.key,
      this.image,
      this.texto,
      this.subTexto,
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
                      height: 100,
                      width: 112,
                      color: Colors.white,
                      child: image),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.amber,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: UiTexto(
                                  texto: 'nombre: $texto',
                                  maxLines: 2,
                                  tamanioTexto: 'md')
                              .textoRobotoLight2(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: UiTexto(
                                  texto: 'precio: $subTexto',
                                  maxLines: 2,
                                  tamanioTexto: 'md')
                              .textoRobotoLight2(),
                        ),
                      ],
                    ),
                  ),
                ),
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
                  child:
                      UiTexto(texto: '$texto', maxLines: 2, tamanioTexto: 'md')
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

//restaurantes
//comidass
class cardWidgetRestaurant extends StatelessWidget {
  String? image;
  String? texto;
  String? subtexto;
  String? precio;
  String? descripcion;
  double? ancho;
  double? altura;
  Color? colors;
  Widget? icons;

  cardWidgetRestaurant(
      {super.key,
      this.image,
      this.texto,
      this.subtexto,
      this.precio,
      this.descripcion,
      this.ancho,
      this.altura,
      this.colors,
      this.icons});

  @override
  Widget build(BuildContext context) {
    print('||||||||||||||||||||||||||||||||||| ${image == "null"} ');
    print('|||||||||||||||||||<<<<<<<<<<<<<<<<<<<<<|| ${image} ');
    return Card(
      elevation: 15,
      shadowColor: const Color.fromARGB(255, 170, 141, 53),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomModal2(
                nombre: texto,
                decripcion: descripcion,
                precio: precio,
                image: image,
              );
            },
          );
        },
        child: Container(
          width: ancho,
          height: altura,
          decoration: BoxDecoration(
              color: colors,
              borderRadius: BorderRadius.all(Radius.circular(19))),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 5.5,
                ),
                Padding(
                  padding: EdgeInsets.all(1.5),
                  child: Container(
                    height: 110,
                    width: 112,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: image != "null" && image!.isNotEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                            child: Image.asset(image!),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                            child: Image.asset(
                              'assets/proximamente.jpg',
                              fit: BoxFit.contain,
                            )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 110,
                      child: UiTexto(
                              texto: texto,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              tamanioTexto: 'md')
                          .textoRobotoLight4()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: UiTexto(
                              texto: subtexto, maxLines: 2, tamanioTexto: 'md')
                          .textoRobotoLight2()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//

//
class CustomModal extends StatelessWidget {
  String? nombre;
  String? decripcion;
  String? precio;
  String? image;

  CustomModal(
      {super.key, this.image, this.nombre, this.decripcion, this.precio});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: 350,
        height: 450,
        child: Container(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 450,
                  width: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Column(
                    children: [
                      /* Text('$nombre'),
                      Text('$decripcion'),
                      Text('$precio'),*/
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(50, 30, 124, 5),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 100, left: 115),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(80))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(80)),
                    child: image != null && image!.isNotEmpty
                        ? //ClipRRect(
                        // borderRadius: BorderRadius.all(Radius.circular(80)),
                        //child:
                        Image.asset(image!)
                        // )
                        : Image.asset(
                            'assets/proximamente.jpg',
                            fit: BoxFit.contain,
                          ),
                  ),
                ),
              ),
              //
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 50),
                child: UiTexto(
                  texto: '$nombre',
                ).textoRobotoLight3(),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 200, right: 50, left: 50),
                child: Container(
                  child: UiTexto(
                    texto: '$decripcion',
                  ).textoRobotoLight4(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 300, right: 50, left: 50),
                child: Container(
                  child: UiTexto(
                    texto: '$precio',
                  ).textoRobotoLight4(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Card de GYM
class cardWidgetGym extends StatelessWidget {
  String? image;
  String? texto;
  String? subtexto;
  String? precio;
  String? descripcion;
  double? ancho;
  double? altura;
  Color? colors;
  Widget? icons;

  cardWidgetGym(
      {super.key,
      this.image,
      this.texto,
      this.subtexto,
      this.precio,
      this.descripcion,
      this.ancho,
      this.altura,
      this.colors,
      this.icons});

  @override
  Widget build(BuildContext context) {
    print('||||||||||||||||||||||||||||||||||| ${image == "null"} ');
    print('|||||||||||||||||||<<<<<<<<<<<<<<<<<<<<<|| ${image} ');
    return Card(
      elevation: 15,
      shadowColor: const Color.fromARGB(255, 170, 141, 53),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              print('entre aquiiiiiiiiiiiiii');
              return CustomModal(
                nombre: texto,
                decripcion: descripcion,
                precio: precio,
                image: image,
              );
            },
          );
        },
        child: Container(
          width: ancho,
          height: altura,
          decoration: BoxDecoration(
              color: colors,
              borderRadius: BorderRadius.all(Radius.circular(19))),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(1.5),
                  child: Container(
                    height: 110,
                    width: 112,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: image != "null" && image!.isNotEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                            child: Image.asset(image!),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                            child: Image.asset(
                              'assets/proximamente.jpg',
                              fit: BoxFit.contain,
                            )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 110,
                      child: UiTexto(
                              texto: texto,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              tamanioTexto: 'md')
                          .textoRobotoLight4()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: UiTexto(
                              texto: subtexto, maxLines: 2, tamanioTexto: 'md')
                          .textoRobotoLight2()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomModal2 extends StatelessWidget {
  String? nombre;
  String? decripcion;
  String? precio;
  String? image;

  CustomModal2(
      {super.key, this.image, this.nombre, this.decripcion, this.precio});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: 350,
        height: 450,
        child: Container(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 450,
                  width: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 200, right: 50, left: 50),
                        child: Container(
                          child: UiTexto(
                            texto: '$decripcion',
                          ).textoRobotoLight4(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: UiTexto(
                          texto: '$precio',
                        ).textoRobotoLight4(),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  width: 320,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(249, 73, 59, 121),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40))),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UiTexto(
                        texto: '$nombre',
                      ).textoRobotoLight3(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 115),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(80))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(80)),
                    child: image != null && image!.isNotEmpty
                        ? //ClipRRect(
                        // borderRadius: BorderRadius.all(Radius.circular(80)),
                        //child:
                        Image.asset(image!)
                        // )
                        : Image.asset(
                            'assets/proximamente.jpg',
                            fit: BoxFit.contain,
                          ),
                  ),
                ),
              ),
              /* Padding(
                padding: const EdgeInsets.only(top: 200, right: 50, left: 50),
                child: Container(
                  child: UiTexto(
                    texto: '$decripcion',
                  ).textoRobotoLight4(),
                ),
              ), 
              Padding(
                padding: const EdgeInsets.only(top: 300, right: 50, left: 50),
                child: Container(
                  child: UiTexto(
                    texto: '$precio',
                  ).textoRobotoLight4(),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}

// card de infor categoria
class cardWidgetCategoria extends StatelessWidget {
  Image? image;
  String? texto;
  String? subtexto;
  String? precio;
  String? descripcion;
  double? ancho;
  double? altura;
  Color? colors;
  Widget? icons;

  cardWidgetCategoria(
      {super.key,
      this.image,
      this.texto,
      this.subtexto,
      this.precio,
      this.descripcion,
      this.ancho,
      this.altura,
      this.colors,
      this.icons});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(30), // Bordes redondeados (opcional)
      ),
      elevation: 15,
      
      child: InkWell(
        onTap: () {},
        child: Container(
          width: ancho,
          height: altura,
          decoration: BoxDecoration(
              color: colors,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.5),
                  child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(80)),
                        child: image,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                      width: 110,
                      child: UiTexto(
                              texto: texto,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              tamanioTexto: 'md')
                          .textoRobotoLight4()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: UiTexto(
                              texto: subtexto, maxLines: 2, tamanioTexto: 'md')
                          .textoRobotoLight2()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
