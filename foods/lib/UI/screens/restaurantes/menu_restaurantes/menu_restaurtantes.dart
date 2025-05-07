import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foods/UI/atoms/card_widget.dart';
import 'package:foods/UI/atoms/show_dialog.dart';
import 'package:foods/UI/atoms/show_dialog.dart';
import 'package:foods/UI/atoms/textfield.dart';
import 'package:foods/Utils/titutlos.dart';

class Menu_restaurantes extends StatefulWidget {
  final int id;

  const Menu_restaurantes({Key? key, required this.id}) : super(key: key);

  @override
  State<Menu_restaurantes> createState() => _Menu_restaurantesState();
}

class _Menu_restaurantesState extends State<Menu_restaurantes> {
  bool hasShownModal = false;
  Future<List<dynamic>> loadJson() async {
    String jsonString = await rootBundle.loadString('assets/places2.json');
    List<dynamic> jsonResponse = json.decode(jsonString);
    print('jsonResponse $jsonResponse');
    return jsonResponse;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<dynamic>>(
            future: loadJson(), // Cargamos el JSON
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData) {
                return Center(child: Text('No hay datos disponibles'));
              } else {
                List<dynamic> categorias = snapshot.data!;

                var restaurantesCategoria = categorias.firstWhere(
                  (categoria) => categoria['nombre'] == 'RESTAURANTES',
                  orElse: () => null,
                );

                if (restaurantesCategoria == null) {
                  return Center(
                      child: Text('Categoría RESTAURANTES no encontrada'));
                }

                var restaurante =
                    restaurantesCategoria['nombre_restaurantes'].firstWhere(
                  (restaurante) => restaurante['id'] == widget.id,
                  orElse: () => null,
                );

                if (restaurante == null) {
                  return Center(
                      child: Text('Restaurante con id 1 no encontrado'));
                }

                // Access the restaurant's details
                var nombre = restaurante['nombres'];
                var id = restaurante['id'];
                var imageRestaurant = restaurante['image'];
                var informacion = restaurante['informacion'];

                // Now you can access the specific restaurant details like "El Solar"
                var direccion = informacion[0]['direccion'];
                var contacto = informacion[0]['contacto'];
                var horario = informacion[0]['horario'];

                var menu = restaurante['informacion'][0]['menu'];

                Map<String, String> horarios = {
                  for (var dia in informacion[0]['horario']) ...dia
                };

                var image = restaurante['informacion'][0]['menu'][0];

                print('imagess $image');

                if (!hasShownModal) {
                  WidgetsBinding.instance?.addPostFrameCallback((_) {
                    setState(() {
                      hasShownModal = true; // Marca que ya se mostró el modal
                    });

                    // Verifica si alguna de las imágenes está vacía y muestra el modal si es necesario
                    var hasImage = menu.any((submenu) {
                      var descripcionList = submenu['descripcion'];
                      List<String> imagesFood = [];

                      for (var i = 0; i < descripcionList.length; i++) {
                        var image = descripcionList[i]['image'];

                        if (image != null && image.isNotEmpty) {
                          imagesFood.add(image);
                        }
                      }

                      return imagesFood.isNotEmpty;
                    });

                    if (!hasImage) {
                      showImageModal(
                          context); // Si no hay imágenes, muestra el modal
                    }
                  });
                }

                return Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Color.fromRGBO(50, 30, 124, 5),
                    child: SingleChildScrollView(
                        child: Column(children: [
                      Stack(
                        children: [
                          Container(
                            height: 220,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                            child: Image.asset(
                              'assets/lugar.jpg',
                              fit: BoxFit.cover,
                              opacity: AlwaysStoppedAnimation(0.6),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 155, left: 30),
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(80)),
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(80)),
                                  child: Image.asset(
                                    imageRestaurant,
                                    fit: BoxFit.contain,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 225, left: 300),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(80)),
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    InformacionDialogos(
                                            nombre, direccion, contacto)
                                        .informacion(context);
                                  },
                                  icon: Icon(Icons.info_outline)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 225, left: 200),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(80)),
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    Dialogs(horarios).calendarios(context);
                                  },
                                  icon: Icon(Icons.calendar_month_outlined)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Column(
                          children: menu.map<Widget>((submenu) {
                            var submenuName = submenu['submenu'];
                            var descripcionList = submenu['descripcion'];
                            var image = submenu['image'];

                            print("imageimage ${image}");

                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 260),
                                  child: Container(
                                    height: 50,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(80),
                                        bottomRight: Radius.circular(80),
                                      ),
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 3.0, top: 10.0),
                                      child: UiTexto(
                                        texto: '$submenuName',
                                      ).textoRobotoLight4(),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 40),

                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children:
                                        descripcionList.map<Widget>((plato) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            cardWidgetRestaurant(
                                              colors: Colors.white,
                                              altura: 230,
                                              texto:      '${plato['nombre']}',
                                              descripcion:'${plato['descripcion']}',
                                              precio:     '${plato['precio']}  ',
                                              image:      '${plato['image']}',
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(), // Convertimos la lista de descripciones en una lista de widgets
                                  ),
                                ),
                                // Convertimos la lista de descripciones en una lista de widgets
                                SizedBox(height: 20),
                              ],
                            );
                          }).toList(), // Asegúrate de llamar a toList() para que se convierta en una lista de widgets
                        ),
                      )
                    ])));
              }
            }));
  }

  void showImageModal(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Información'),
          content: Text(
              'Por el momento no hay imágenes de referencia del producto.'),
          actions: <Widget>[
            TextButton(
              child: Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

                     
                  
               



    /*Scaffold(
      body: Container(
        color: Color(0xC4411DDB),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            //BorderRadius.only(bottomLeft: Radius.circular(90))
                            BorderRadius.only(
                                bottomLeft: Radius.circular(90),
                                bottomRight: Radius.circular(90))),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0, 4),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Textfields(
                    texto: 'Buscar comida....',
                  ),
                ),
              ),
              //
            Padding(
              padding: const EdgeInsets.only(left: 1, right: 220),
              child: Container(
              
                width: 210,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.amber,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20))
                ),
                child: UiTexto(texto: 'Cocteles').textoRobotoLight2(),
              ),
            ),
          
              //
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    cardWidget3(
                      colors: Color(0xFFF6F6),
                      altura: 210,
                      image: Image.asset(
                        'assets/coctel-cuba-libre.jpg',
                        fit: BoxFit.contain,
                      ),
                      texto: 'Coctel',
                    ),
                    cardWidget3(
                      colors: Color(0xFFF6F6),
                      altura: 210,
                      image: Image.asset(
                        'assets/coctel-daiquiri.jpg',
                        fit: BoxFit.contain,
                      ),
                      texto: 'Coctel',
                    ),
                     cardWidget3(
                      colors: Color(0xFFF6F6),
                      altura: 210,
                      image: Image.asset(
                        'assets/coctel-el-solar.jpg',
                        fit: BoxFit.contain,
                      ),
                      texto: 'Coctel',
                    ),
                     cardWidget3(
                      colors: Color(0xFFF6F6),
                      altura: 210,
                      image: Image.asset(
                        'assets/coctel-margarita-maracuya.jpg',
                        fit: BoxFit.contain,
                      ),
                      texto: 'Coctel',
                    ),
                     cardWidget3(
                      colors: Color(0xFFF6F6),
                      altura: 210,
                      image: Image.asset(
                        'assets/coctel-sex-on-the-beach.jpg',
                        fit: BoxFit.contain,
                      ),
                      texto: 'Coctel',
                    ),
                  ],
                ),
              ),
              //
 Padding(
              padding: const EdgeInsets.only(left: 1, right: 220),
              child: Container(
              
                width: 210,
                height: 30,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 193, 7, 1),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20))
                ),
                child: UiTexto(texto: 'Almuerzos').textoRobotoLight2(),
              ),
            ),
              //
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    cardWidget3(
                      colors: Color(0xFFF6F6),
                      altura: 210,
                      image: Image.asset(
                        'assets/triologia-de-carnes.jpg',
                        fit: BoxFit.contain,
                      ),
                      texto: 'Coctel',
                    ),
                    cardWidget3(
                      colors: Color(0xFFF6F6),
                      altura: 210,
                      image: Image.asset(
                        'assets/delicioso-lomo-viche.jpg',
                        fit: BoxFit.contain,
                      ),
                      texto: 'Coctel',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ); */

