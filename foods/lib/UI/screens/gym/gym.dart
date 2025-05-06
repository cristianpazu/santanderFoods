import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foods/UI/atoms/card_widget.dart';
import 'package:foods/UI/atoms/textfield.dart';
import 'package:foods/UI/screens/gym/info_gym/gym_info.dart';
import 'package:foods/Utils/titutlos.dart';

class Gym extends StatefulWidget {
 const Gym({super.key});

  @override
  State<Gym> createState() => _GymState();
}

class _GymState extends State<Gym> {

   Future<List<dynamic>> loadJson() async {
    String jsonString = await rootBundle.loadString('assets/gym.json');
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
                                 bottomRight: Radius.circular(120)
                                )),
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(120),
                                bottomRight: Radius.circular(120)
                                ),
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
                          texto: 'Buscar gym....',
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 30,
                    right: 190,
                    child: UiTexto(
                      texto: 'GYM',
                    ).textoRobotoLight3()),
              ],
            ),
            FutureBuilder<List<dynamic>>(
                future: loadJson(), // Cargamos el JSON
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child:
                   /* Container(
                   height: 80,
                   width: 80
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(80)),
                        child: Image.asset('assets/comer-unscreen.gif')),
                    ) */
                   CircularProgressIndicator()
                     
                     );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData) {
                    return Center(child: Text('No hay datos disponibles'));
                  } else {
                    List<dynamic> categorias = snapshot.data!;

                    var restaurantesCategoria = categorias.firstWhere(
                        (categoria) => categoria['nombre'] == 'GYM');
                    List<dynamic> nombres =
                        restaurantesCategoria['nombre_gimasios'];

                    return GridView.builder(
                      padding: EdgeInsets.all(10),
                      shrinkWrap:
                          true, // Asegura que el GridView solo ocupe el espacio necesario
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: nombres.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            2, // Número de columnas en la cuadrícula
                      ),
                      itemBuilder: (context, index) {
                        final gym = nombres[index];
                        final gymInfo = gym['nombres'];
                        final gymImage = gym['image'];
                        final idGym = gym['id'];
                      print('saddddddd $idGym');
                        return cardWidget4(
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
                        );
                      },
                    );
                  }
                })
          ],
        ),
      ),
    ));
  }
}