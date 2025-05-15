import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foods/UI/atoms/card_widget.dart';
import 'package:foods/UI/atoms/textfield.dart';
import 'package:foods/UI/screens/comidasRapidas/comidas_rapidas/comida_rapidas.dart';
import 'package:foods/UI/screens/gym/info_gym/gym_info.dart';
import 'package:foods/Utils/titutlos.dart';

class Comidasrapidasinfocategoria extends StatefulWidget {
   final int id;
  const Comidasrapidasinfocategoria({super.key, required this.id});

  @override
  State<Comidasrapidasinfocategoria> createState() => _Comidasrapidasinfocategoriastate();
}

class _Comidasrapidasinfocategoriastate extends State<Comidasrapidasinfocategoria> {
  Future<List<dynamic>> loadJsonComidaRapida() async {
  String jsonString =
      await rootBundle.loadString('assets/comidasRapidas.json');
  List<dynamic> jsonResponse = json.decode(jsonString);
  print('jsonResponse $jsonResponse');
  return jsonResponse;
}

  
 Future<List<dynamic>> obtenerProductosPorCategoria(int categoriaId) async {
  List<dynamic> categorias = await loadJsonComidaRapida();

  // Filtrar los productos que corresponden a la categoría seleccionada
  var categoriaSeleccionada = categorias.firstWhere(
    (categoria) => categoria['nombre'] == 'COMIDAS RAPIDAS',
    orElse: () => null,
  );

  List<dynamic> productosCategoria = [];
  
  if (categoriaSeleccionada != null) {
    var productos = categoriaSeleccionada['nombre_comida_rapida'];
    productosCategoria = productos.where((producto) {
      return producto['CATEGORIAS']['id'] == categoriaId;
    }).toList();
  }
  print('>>nombres>>>>>>>>nomasddddddddddddd');
  return productosCategoria;
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
            FutureBuilder<List<dynamic>>(
              future: obtenerProductosPorCategoria(widget.id), // Usamos el ID de la categoría seleccionada
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No hay productos disponibles'));
                } else {
                  List<dynamic> productos = snapshot.data!;

                  return Column(
                    children: [
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Productos de la categoría ${widget.id}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Aquí mostramos los productos
                      Container(
                        height: 180,
                        child: ListView.builder(
                          itemCount: productos.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final producto = productos[index];
                            final nombreProducto = producto['nombres'];
                            final categoriaImage = producto['image'];
                            final idProducto = producto['id'];
                            
                            return Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: cardComidaRapidasWidget(
                                colors: Color.fromARGB(255, 255, 255, 255),
                                image: Image.asset(
                                  categoriaImage,
                                  fit: BoxFit.contain,
                                ),
                                redireccionamiento: comidas_rapidas(id: idProducto),
                                texto: nombreProducto,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    ),
  );
}
}
