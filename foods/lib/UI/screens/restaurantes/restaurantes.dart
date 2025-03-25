import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foods/UI/atoms/card_widget.dart';
import 'package:foods/UI/atoms/show_dialog.dart';
import 'package:foods/UI/atoms/textfield.dart';
import 'package:foods/UI/screens/restaurantes/menu_restaurantes/menu_restaurtantes.dart';
import 'package:foods/Utils/titutlos.dart';

class Restaurantes extends StatelessWidget {
  const Restaurantes({super.key});
/*
  Future<Map<String, dynamic>> loadJson() async {
   String jsonString = await rootBundle.loadString('assets/places3.json');
    Map<String, dynamic> jsonResponse = json.decode(jsonString);
    return jsonResponse;
  } */

  Future<List<dynamic>> loadJson() async {
    String jsonString = await rootBundle.loadString('assets/places2.json');
    List<dynamic> jsonResponse = json.decode(jsonString);
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
                                bottomLeft: Radius.circular(120))),
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(120)),
                            child: Image.asset(
                              'assets/resta.jpeg',
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
                          texto: 'Buscar restaurantes....',
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 30,
                    right: 190,
                    child: UiTexto(
                      texto: 'RESTAURANTES',
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
                        (categoria) => categoria['nombre'] == 'RESTAURANTES');
                    List<dynamic> nombres =
                        restaurantesCategoria['nombre_restaurantes'];

                      
 
                    return GridView.builder(
                      padding: EdgeInsets.all(10),
                      shrinkWrap:
                          true, // Asegura que el GridView solo ocupe el espacio necesario
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: nombres.length,
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            2, // Número de columnas en la cuadrícula
                      ),
                      itemBuilder: (context, index) {
                        final restaurant = nombres[index];
                        final restaurantInfo =
                            restaurant['nombres'];
                            final restaurantImage =
                            restaurant['image'];
                    print(restaurantInfo);
                        return cardWidget4(
                          colors: Color.fromARGB(255, 255, 255, 255),
                          altura: 10,
                             redireccionamiento:Menu_restaurantes(),
                          image: Image.asset(
                           restaurantImage,
                            fit: BoxFit.contain,
                          ),
                          texto: restaurantInfo,
                        );
                    
                        /* ListView.builder(
                      shrinkWrap: true,
                      itemCount: nombres.length,
                      itemBuilder: (context, index) {
                        var restaurante = nombres[index];
                        return Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(children: [
                                cardWidget3(
                                  colors: Color.fromARGB(255, 145, 2, 2),
                                  altura: 210,
                                  image: Image.asset(
                                    'assets/coctel-cuba-libre.jpg',
                                    fit: BoxFit.contain,
                                  ),
                                  texto: restaurante['nombres'],
                                )
                              ]),
                            ),
                          ],
                        ); */
                        /*Card(
                            margin: EdgeInsets.all(10),
                            elevation: 5,
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  restaurante['nombres'],
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                )));*/
                      },
                    );

                    /* Column(
                children: [
                  SingleChildScrollView(
                     scrollDirection: Axis.horizontal,
                    child: Row(
                      children: data.map((item){
                        return cardWidget3(
                      colors: Color(0xFFF6F6),
                      altura: 210,
                      image: Image.asset(
                        'assets/coctel-cuba-libre.jpg',
                        fit: BoxFit.contain,
                      ),
                      texto: item['nombre'],
                    );

                      }).toList()
                    ),
                  ),
                ],
                  
              ); */
                  }
                })
          ],
        ),
      ),
    )

        /*
        
        
        cardWidget3(
                        colors: Color(0xFFF6F6),
                        altura: 210,
                        image: Image.asset(
                          'assets/coctel-cuba-libre.jpg',
                          fit: BoxFit.contain,
                        ),
                        texto: item[],
                      ),
        
        
        
        
        
        
        
        
        
        
        Container(
        color: Color.fromRGBO(50, 30, 124, 5),
        child: Column(
          children: [
            Container(
              height: 210,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(120))),
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
                  texto: 'Buscar restaurantes....',
                ),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      cardWidget2(
                       redireccionamiento:Menu_restaurantes(),
                        colors: Color(0xFFF6F6),
                        altura: 210,
                        image: Image.asset(
                          'assets/solar.jpeg',
                          fit: BoxFit.contain,
                        ),
                        texto: 'SOLAR',
                        icon2: IconButton(onPressed: (){
                          
                          Dialogs('HORARIOS','Cerrado' ,'	11:30 a.m a 10p. m' ,' 11:30a.m. a 10p. m' ,'	11:30a.m a 10p.m','	11:30 a.m a 10p.m','	11:30a.m a 10p.m','	11:30a.m a 10p.m').calendarios(context);
                        }, icon: Icon(Icons.calendar_month_outlined)),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      cardWidget2(
                        colors: Color(0xFFF6F6),
                        altura: 210,
                        image: Image.asset(
                          'assets/casape.png',
                          fit: BoxFit.contain,
                        ),
                        texto: 'C. de \n Pedro',
                        icon2: IconButton(onPressed: (){}, icon: Icon(Icons.calendar_month_outlined)),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),*/
        );
  }
}
