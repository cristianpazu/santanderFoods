import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foods/UI/atoms/card_widget.dart';
import 'package:foods/UI/atoms/textfield.dart';
import 'package:foods/UI/screens/comidasRapidas/comidas_rapidas/comida_rapidas.dart';
import 'package:foods/UI/screens/gym/info_gym/gym_info.dart';
import 'package:foods/Utils/titutlos.dart';

class Comidas_rapidas_info extends StatefulWidget {
  const Comidas_rapidas_info({super.key});

  @override
  State<Comidas_rapidas_info> createState() => _ComidasRapidastate();
}

class _ComidasRapidastate extends State<Comidas_rapidas_info> {
  Future<List<dynamic>> loadJson() async {
    String jsonString = await rootBundle.loadString('assets/categoria.json');
    List<dynamic> jsonResponse = json.decode(jsonString);
    print('jsonResponse $jsonResponse');
    return jsonResponse;
  }

  Future<List<dynamic>> loadJsonComidaRapida() async {
    String jsonString =
        await rootBundle.loadString('assets/comidasRapidas.json');
    List<dynamic> jsonResponse = json.decode(jsonString);
    print('jsonResponse $jsonResponse');
    return jsonResponse;
  }

  Map<String, List<Map<String, dynamic>>> _agruparPorCategoria(
      List<dynamic> items) {
    Map<String, List<Map<String, dynamic>>> grupos = {};

    for (var item in items) {
      final idCategoria = item['CATEGORIAS']['nombre_categoria'];

      if (!grupos.containsKey(idCategoria)) {
        grupos[idCategoria] = [];
      }

      grupos[idCategoria]!.add(item as Map<String, dynamic>);
    }

    return grupos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      color: Color.fromRGBO(50, 30, 124, 5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: const Color.fromRGBO(50, 30, 124, 5),
                  child: Column(
                    children: [
                      Container(
                        height: 220,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(120),
                                bottomRight: Radius.circular(120))),
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(120),
                                bottomRight: Radius.circular(120)),
                            child: Image.asset(
                              'assets/comidasrapidaslogos.jpg',
                              fit: BoxFit.cover,
                              opacity: AlwaysStoppedAnimation(0.6),
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Textfields(
                          texto: 'Buscar comidas rapidas....',
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 30,
                    right: 190,
                    child: UiTexto(
                      texto: 'comidas rapidas',
                    ).textoRobotoLight3()),
              ],
            ),
            FutureBuilder<List<dynamic>>(
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
                        (categoria) => categoria['nombre'] == 'CATEGORIAS');
                    List<dynamic> nombres =
                        restaurantesCategoria['nombre_categoria'];

                    return Container(
                      height: 200,
                      
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: UiTexto(texto: 'Categorias')
                                  .textoRobotoLight7(),
                            ),
                          ),
                          Container(
                            
                            height: 150,
                            child: ListView.builder(
                              itemCount: nombres.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final categoria = nombres[index];
                                final categoriaInfo =
                                    categoria['nombre_categoria'];
                                final categoriaImage = categoria['image'];

                                return Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: cardWidgetCategoria(
                                    colors: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    ancho: 85,
                                    altura: 150,
                                    image: Image.asset(
                                      categoriaImage,
                                      fit: BoxFit.cover,
                                    ),
                                    texto: categoriaInfo,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                    /*GridView.builder(
                      padding: EdgeInsets.all(10),
                      shrinkWrap:
                          true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: nombres.length,
                      scrollDirection: Axis.vertical,

                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            1,
                      ),
                      itemBuilder: (context, index) {
                        final categoria = nombres[index];
                        final categoriaInfo = categoria['nombre_categoria'];
                         final categoriaImage = categoria['image'];
                   print('>>>>>>>>>>>>>> $categoriaInfo');
                      
                     
                        return cardWidgetCategoria(
                          altura: 10,
                          image: Image.asset(
                            categoriaImage,
                            fit: BoxFit.contain,
                          ),
                        );
                        /*cardWidget4(
                          colors: Color.fromARGB(255, 255, 255, 255),
                          altura: 10,
                          image: Image.asset(
                            gymImage,
                            fit: BoxFit.contain,
                          ),
                          texto: gymInfo,
                          redireccionamiento: gym_info(
                            id: idGym,
                          ),
                        ); */
                      },
                    ); */
                  }
                }),

            /////////////////////////////////

            FutureBuilder<List<dynamic>>(
                future: loadJsonComidaRapida(), // Cargamos el JSON
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData) {
                    return Center(child: Text('No hay datos disponibles'));
                  } else {
                    List<dynamic> categorias = snapshot.data!;
                    print('>>nombres>>>>>>>>nombrecategoriass>>>> $categorias');
                    var restaurantesCategoria = categorias.firstWhere(
                      (categoria) => categoria['nombre'] == 'COMIDAS RAPIDAS',
                      orElse: () => null,
                    );

                    List<dynamic> nombres =
                        restaurantesCategoria['nombre_comida_rapida'];
                    print('>>nombres>>>>>>>>nombres>>>> $nombres');
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ..._agruparPorCategoria(nombres).entries.map(
                            (entry) {
                              final idCategoria = entry.key;
                              final items = entry.value;
                              print('||||||||||||||||||||>>>>>>>>>>>>>>>>>>> ${entry.key}');
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /*Padding(
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
                                ), */
                                 SizedBox(height: 20),

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
                                        texto: '$idCategoria',
                                      ).textoRobotoLight4(),
                                    ),
                                  ),
                                ),
 SizedBox(height: 20),


/*
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: Text(
                                      'Categoría $idCategoria',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ), */



                                  Container(
                                    height: 180,
                                  
                                    child: ListView.builder(
                                      itemCount: items.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final categoria = items[index];
                                        final categoriaInfo =
                                            categoria['nombres'];
                                        final categoriaInfoREstaura =
                                            categoria['CATEGORIAS']['nombre_categoria'];
                                        final categoriaImage =
                                            categoria['image'];
                                        final idRestaurantes = categoria['id'];
                                        print(
                                            '>>>>>categoriaInfoREstaura>>>>>>>>> $categoriaInfo');

                                        return cardComidaRapidasWidget(
                                          colors: Color.fromARGB(
                                              255, 255, 255, 255),
                                          image: Image.asset(
                                            categoriaImage,
                                            fit: BoxFit.contain,
                                          ),
                                          redireccionamiento: comidas_rapidas(
                                              id: idRestaurantes),
                                          texto: categoriaInfo,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            },
                          )
                        ]);

                    /*  GridView.builder(
                      padding: EdgeInsets.all(10),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: nombres.length,
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        
                      ),
                      itemBuilder: (context, index) {
                        final categoria = nombres[index];
                        final categoriaInfo = categoria['nombres'];
                        final categoriaImage = categoria['image'];
                         final idRestaurantes = categoria['id'];
                        print('>>>>>>>>>>>>>> $idRestaurantes');

                        return cardComidaRapidasWidget(
                         
                          colors: Color.fromARGB(255, 255, 255, 255),
                          
                          image: Image.asset(
                            categoriaImage,
                            fit: BoxFit.contain,
                          ),
                          redireccionamiento: comidas_rapidas(id: idRestaurantes),
                          texto: categoriaInfo,
                        );
                      },
                    ); */
                  }
                }),
          ],
        ),
      ),
    ));
  }
}
