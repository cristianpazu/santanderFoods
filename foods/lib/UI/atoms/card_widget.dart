import 'package:flutter/material.dart';
import 'package:foods/UI/atoms/show_dialog.dart';
import 'package:foods/UI/screens/menu/menu.dart';
import 'package:foods/UI/screens/restaurantes/restaurantess.dart';
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
class cardMenuRestauranteWidget4 extends StatelessWidget {
  Image? image;
  String? texto;

  double? ancho;
  double? altura;
  Color? colors;
  Widget? redireccionamiento;

  cardMenuRestauranteWidget4(
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
class cardRestaurantesWidget extends StatelessWidget {
  String? image;
  String? texto;
  String? subtexto;
  String? precio;
  String? descripcion;
  double? ancho;
  double? altura;
  Color? colors;
  Widget? icons;

  cardRestaurantesWidget(
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

              //
                 Padding(
                 padding: const EdgeInsets.only(
                            top: 380, right: 40, left: 50),
                  child: InkWell(
                    onTap: () {
                      
                    },
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration( 
                          color: const Color.fromARGB(249, 73, 59, 121),
                        borderRadius: BorderRadius.circular(30)),
                    
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 190.0, top: 3),
                              child: Container(
                                width: 45,
                                height:45,
                             
                                decoration: BoxDecoration(
                                     color: Colors.white,
                                  borderRadius: BorderRadius.circular(60)
                                ),
                              ),
                            ),
                            Center(
                              child: UiTexto(
                                      texto: 'ADD CART', maxLines: 2, tamanioTexto: 'md')
                                  .textoRobotoLight4(),
                            ),

                            Padding(
                                  padding: const EdgeInsets.only(left: 203.0, top: 13),
                              child: Icon(Icons.add_shopping_cart_outlined),
                            )
                          ],
                        )),
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
  Widget? redireccionamiento;

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
      this.icons,
      this.redireccionamiento});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(30), // Bordes redondeados (opcional)
      ),
      elevation: 15,
      child: InkWell(
        onTap: () {
          redireccionamiento!;  Navigator.push(
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

//comidas rapidas
class cardComidaRapidasWidget extends StatelessWidget {
  Image? image;
  String? texto;

  double? ancho;
  double? altura;
  Color? colors;
  Widget? redireccionamiento;

  cardComidaRapidasWidget(
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
      color: Colors.blue,
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
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.all(Radius.circular(9))),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(80)),
                    child: Container(
                        height: 110,
                        width: 112,
                        color: Colors.white,
                        child: image),
                  ),
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

// card comida de testaurane
class cardWidgetComidasRapidas extends StatefulWidget {
  String? image;
  String? texto;
  String? subtexto;
  String? precio;
  String? descripcion;
  double? ancho;
  double? altura;
  Color? colors;
  Widget? icons;
  final List<Map<String, dynamic>>? checkboxs;
String? keyItem;
  cardWidgetComidasRapidas(
      {super.key,
      this.image,
      this.texto,
      this.subtexto,
      this.precio,
      this.descripcion,
      this.ancho,
      this.altura,
      this.colors,
      this.icons,
      this.checkboxs,
      this.keyItem,});

  @override
  State<cardWidgetComidasRapidas> createState() => _cardWidgetComidasRapidasState();
}

class _cardWidgetComidasRapidasState extends State<cardWidgetComidasRapidas> {

     Map<String, bool> checkboxStates = {}; //

 
  @override
  void initState() {
    super.initState();
    // Inicializamos los estados de los checkboxes
    widget.checkboxs?.forEach((salsa) {
      String key = '${widget.keyItem}_${salsa['nombre']}';
      checkboxStates[key] = false; // Estado inicial es desmarcado
    });
  }

  @override
  Widget build(BuildContext context) {
    print('||||||||||||||||||||||||||||||||||| ${widget.image == "null"} ');
    print('|||||||||||||||||||<<<<<<<<<<<<<<<<<<<<<|| ${widget.image} ');
    return Card(
      elevation: 15,
      shadowColor: const Color.fromARGB(255, 170, 141, 53),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomModal3(
                nombre: widget.texto,
                decripcion: widget.descripcion,
                precio: widget.precio,
                image: widget.image,
                check: widget.checkboxs,
                keyItem: widget.keyItem,
                /*!= null
                    ? SingleChildScrollView(
                      child: Column(
                          children: widget.checkboxs!.map((salsa) {
                              String key = '${widget.keyItem}_${salsa['nombre']}';
                            return CheckboxListTile(
                              title: Text(salsa['nombre']),
                              value:  checkboxStates[key] ?? false,
                              onChanged: (bool? value) {
                                setState(() {
                                   checkboxStates[key] = value!;
                                });
                              },
                            );
                          }).toList(),
                        ),
                    )
                    : null, */
              );
            },
          );
        },
        child: Container(
          width: widget.ancho,
          height: widget.altura,
          decoration: BoxDecoration(
              color: widget.colors,
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
                    child: widget.image != "null" && widget.image!.isNotEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                            child: Image.asset(widget.image!),
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
                              texto: widget.texto,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              tamanioTexto: 'md')
                          .textoRobotoLight4()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: UiTexto(
                              texto: widget.subtexto, maxLines: 2, tamanioTexto: 'md')
                          .textoRobotoLight2()),
                ),

                /* Checkbox(
                        tristate: true, // Example with tristate
                        value: true,
                        onChanged: (bool? newValue) {
                          
                        },
                      ), */
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// comidas rapidas
class CustomModal3 extends StatefulWidget {
  String? nombre;
  String? decripcion;
  String? precio;
  String? image;
    final List<Map<String, dynamic>>? check;
      final String? keyItem;

  CustomModal3(
      {super.key,
      this.image,
      this.nombre,
      this.decripcion,
      this.precio,
      this.check,
      this.keyItem});

  @override
  State<CustomModal3> createState() => _CustomModal3State();
}

class _CustomModal3State extends State<CustomModal3> {


Map<String, bool> checkboxStates = {};

 @override
  void initState() {
    super.initState();
    widget.check?.forEach((salsa) {
      String key = '${widget.keyItem}_${salsa['nombre']}';
      checkboxStates[key] = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
      
        width: 350,
        height: 500,
        child: Container(
          
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 500,
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
                            texto: '${widget.decripcion}',
                          ).textoRobotoLight4(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: UiTexto(
                          texto: '${widget.precio}',
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
                        texto: '${widget.nombre}',
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
                    child: Image.asset(
                      'assets/proximamente.jpg',
                      fit: BoxFit.contain,
                    ), /* image != null && image!.isNotEmpty
                        ? //ClipRRect(
                        // borderRadius: BorderRadius.all(Radius.circular(80)),
                        //child:
                        Image.asset(image!)
                        // )
                        : Image.asset(
                            'assets/proximamente.jpg',
                            fit: BoxFit.contain,
                          ), */
                  ),
                ),
              ),
             // if (widget.check != null && widget.check is! Container)
               Padding(
              padding: const EdgeInsets.only(top: 285, left: 15, right: 15),
              child: Container(
                height: 150,
                width: 305,
                child: widget.check != null
                    ? SingleChildScrollView(
                        child: Column(
                          children: widget.check!.map((salsa) {
                            String key = '${widget.keyItem}_${salsa['nombre']}';
                            return CheckboxListTile(
                              title: Text(salsa['nombre']),
                              value: checkboxStates[key] ?? false,
                              onChanged: (bool? value) {
                                setState(() {
                                  checkboxStates[key] = value!;
                                });
                              },
                            );
                          }).toList(),
                        ),
                      )
                    : Container(),
              ),
            ), 
            Padding(
              padding: const EdgeInsets.only(left: 40,top:440),
              child: Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration( 
                            color: const Color.fromARGB(249, 73, 59, 121),
                          borderRadius: BorderRadius.circular(30)),
                      
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 190.0, top: 3),
                                child: Container(
                                  width: 45,
                                  height:45,
                               
                                  decoration: BoxDecoration(
                                       color: Colors.white,
                                    borderRadius: BorderRadius.circular(60)
                                  ),
                                ),
                              ),
                              Center(
                                child: UiTexto(
                                        texto: 'ADD CART', maxLines: 2, tamanioTexto: 'md')
                                    .textoRobotoLight4(),
                              ),
              
                              Padding(
                                    padding: const EdgeInsets.only(left: 203.0, top: 13),
                                child: Icon(Icons.add_shopping_cart_outlined),
                              )
                            ],
                          )),
            ),
                  
             /* Padding(
                padding: const EdgeInsets.only(top: 285, left: 15, right: 15),
                child: Container(
                  height: 150,
                  width: 305,
                  child: widget.check,
                ),
              ) */
              //if (check != null) check!,
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

// comidas rapidas v2
class CustomModal4 extends StatelessWidget {
  String? nombre;
  String? decripcion;
  String? precio;
  String? image;
  Widget? check;

  CustomModal4(
      {super.key,
      this.image,
      this.nombre,
      this.decripcion,
      this.precio,
      this.check});
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
        child: Column(
          children: [
            Container(
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
                        child: Image.asset(
                          'assets/proximamente.jpg',
                          fit: BoxFit.contain,
                        ), /* image != null && image!.isNotEmpty
                            ? //ClipRRect(
                            // borderRadius: BorderRadius.all(Radius.circular(80)),
                            //child:
                            Image.asset(image!)
                            // )
                            : Image.asset(
                                'assets/proximamente.jpg',
                                fit: BoxFit.contain,
                              ), */
                      ),
                    ),
                  ),
                   ]
                  )
            ),
                  Container(
                    color: Colors.amber,
                    height: 250,
                    width: 350,
                    child: check,
                  )
                  //if (check != null) check!,
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
    );
  }
}
