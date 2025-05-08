import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foods/UI/atoms/card_widget.dart';
import 'package:foods/UI/atoms/show_dialog.dart';
import 'package:foods/Utils/titutlos.dart';

class gym_info extends StatefulWidget {
  final int id;

  const gym_info({Key? key, required this.id}) : super(key: key);

  @override
  State<gym_info> createState() => _gym_infoState();
}

class _gym_infoState extends State<gym_info> {
  Future<List<dynamic>> loadJson() async {
    String jsonString = await rootBundle.loadString('assets/gym.json');
    List<dynamic> jsonResponse = json.decode(jsonString);
    return jsonResponse;
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

                var gymCategoria = categorias.firstWhere(
                  (categoria) => categoria['nombre'] == 'GYM',
                  orElse: () => null,
                );
                if (gymCategoria == null) {
                  return Center(child: Text('Categoría GYM no encontrada'));
                }

                var gyms = gymCategoria['nombre_gimasios'].firstWhere(
                  (gymnasio) => gymnasio['id'] == widget.id,
                  orElse: () => null,
                );

                if (gyms == null) {
                  return Center(child: Text('Gimnasio con id 1 no encontrado'));
                }

                // Access the restaurant's details
                var nombre = gyms['nombres'];
                var id = gyms['id'];
                var imageRestaurant = gyms['image'];
                var informacion = gyms['informacion'];

                // Now you can access the specific restaurant details like "El Solar"
                var direccion = informacion[0]['direccion'];
                var contacto = informacion[0]['contacto'];
                var horario = informacion[0]['horario'];

                var menu = gyms['informacion'][0]['tarifas'];

                Map<String, String> horarios = {
                  for (var dia in informacion[0]['horario']) ...dia
                };
                /*     if (!hasShownModal) {
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
                  }); */

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
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: Image.asset(
                              'assets/lugar.jpg',
                              fit: BoxFit.cover,
                              opacity: AlwaysStoppedAnimation(0.6),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 155, left: 125),
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
                                  child: //Container()
                                      Image.asset(
                                    imageRestaurant,
                                    fit: BoxFit.contain,
                                  )),
                            ),
                          ),
                          //
                          Padding(
                            padding: const EdgeInsets.only(top: 320, left: 125),
                            child: Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(80)),
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(80)),
                                  child: Center(
                                    child: Text('PLANES'),
                                  )),
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
                            return Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20, left: 20),
                                    child: Card(
                                        child: ExpansionTile(
                                      title: Text(submenuName),
                                      children: <Widget>[
                                        ...descripcionList.map<Widget>((plato) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 250,
                                                  decoration: BoxDecoration(
                                                      color: Color.fromRGBO(
                                                          50, 30, 124, 5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Column(
                                                    children: [
                                                      UiTexto(
                                                              texto:
                                                                  '${plato['nombre']}',
                                                              maxLines: 2,
                                                              tamanioTexto:
                                                                  'md')
                                                          .textoRobotoLight6(),
                                                      UiTexto(
                                                              texto:
                                                                  '${plato['descripcion']}',
                                                              maxLines: 2,
                                                              tamanioTexto:
                                                                  'md')
                                                          .textoRobotoLight6(),
                                                      UiTexto(
                                                              texto:
                                                                  '${plato['precio']}',
                                                              maxLines: 2,
                                                              tamanioTexto:
                                                                  'md')
                                                          .textoRobotoLight6(),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                )
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                      ],
                                    ))),
                                SizedBox(height: 40),
                                SizedBox(height: 20),
                              ],
                            );
                          }).toList(),
                          // Asegúrate de llamar a toList() para que se convierta en una lista de widgets
                        ),
                      )
                    ])));
              }
            }));
  }
}
