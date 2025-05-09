import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foods/UI/atoms/card_widget.dart';
import 'package:foods/UI/atoms/textfield.dart';
import 'package:foods/UI/screens/gym/info_gym/gym_info.dart';
import 'package:foods/Utils/titutlos.dart';

class Comidas_rapidas extends StatefulWidget {
  const Comidas_rapidas({super.key});

  @override
  State<Comidas_rapidas> createState() => _ComidasRapidastate();
}

class _ComidasRapidastate extends State<Comidas_rapidas> {
  Future<List<dynamic>> loadJson() async {
    String jsonString = await rootBundle.loadString('assets/categoria.json');
    List<dynamic> jsonResponse = json.decode(jsonString);
    print('jsonResponse $jsonResponse');
    return jsonResponse;
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
                              'assets/gyms.jpg',
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

                    return SizedBox(
                      height: 150,
                      child: ListView.builder(
                        itemCount: nombres.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final categoria = nombres[index];
                          final categoriaInfo = categoria['nombre_categoria'];
                          final categoriaImage = categoria['image'];
                      
                          return  Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: cardWidgetCategoria(
                              colors: const Color.fromARGB(255, 255, 255, 255),
                              ancho: 85,
                              altura: 150,
                              image: Image.asset(
                              categoriaImage,
                              fit: BoxFit.cover,
                            ),
                            texto:categoriaInfo ,
                            ),
                          ); 
                        },
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
                })
          ],
        ),
      ),
    ));
  }
}
