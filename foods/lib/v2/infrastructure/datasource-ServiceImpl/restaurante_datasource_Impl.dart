import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foods/v2/domain/datasource-servicesInterface/RestaurantesDatasource.dart';
import 'package:foods/v2/domain/entities/restaurantes/Informacion.dart';
import 'package:foods/v2/domain/entities/restaurantes/NombreRestaurantes.dart';
import 'package:foods/v2/domain/entities/restaurantes/Restaurantes.dart';

class RestauranteDatasourceImpl  extends RestaurantesDatasource{


  @override
  Future<List<Restaurantes>> getAllRestaurantes() async {
// Cargar el archivo JSON desde los assets
  String jsonString = await rootBundle.loadString('assets/placesrestaurante.json');
  final data = json.decode(jsonString); // Esto es una Lista dinámica (List<dynamic>)

  

  
  final restauranteJson = (data[0]['nombre_restaurantes'] ?? []) as List;

  print('restauranteJson $restauranteJson');
 final List<dynamic> datas = json.decode(jsonString);
  // Convertir a List<Restaurantes>
/*List<Restaurantes> restaurantes = restauranteJson.map((item) {
  
  return Restaurantes.fromJson(item);
}).toList(); */

print('objectdatas $datas');
List<Restaurantes> restaurantes = datas.map((item) {
    return Restaurantes.fromJson(item);
  }).toList();

 print('object>>>>>>>>>> $restaurantes');



  return restaurantes;

/*
   String jsonString = await rootBundle.loadString('assets/placesrestaurante.json');
    final data = json.decode(jsonString); // esto es List<dynamic>

 print('restaurtassssssssssss $data');
final restauranteJson = (data[0]['nombre_restaurantes'] ?? []) as List;

List<Restaurantes> restaurantes = restauranteJson
    .map((item) => Restaurantes.fromJson(item))
    .toList();

print('restaurtassssssssssss $restaurantes');
  return restaurantes; */
  }

  @override
  Future<List<NombreRestaurante>> getRestauranteById(int Id)async {
   
    String jsonString = await rootBundle.loadString('assets/placesrestaurante.json');
 /*   List<dynamic> jsonResponse = json.decode(jsonString);
    print('qqqqqqqqqqqqqqqq $Id');
 print('qqqqqqqqqqqqqqqq $jsonResponse');



  // Convertir a objetos
  List<NombreRestaurante> nombreRestaurantes = jsonResponse.map((itemS) {

   
    return NombreRestaurante.fromJson(itemS);
  }).toList();

  print('Lista completa: $nombreRestaurantes'); */

///////

// Acceder a la lista de restaurantes
List<dynamic> jsonResponXse = json.decode(jsonString);
print('Lista jsonResponXse: $jsonResponXse');
//List<dynamic> restaurantesJson = jsonResponXse['nombre_restaurantes'];

// Mapear a objetos NombreRestaurante
List<Restaurantes> nombreRestauranteSs = jsonResponXse.map((item) {
  return Restaurantes.fromJson(item);
}).toList();

print('||||||||||||||||||||||------------||||||||||||: $nombreRestauranteSs');

// Filtrar por ID
List<NombreRestaurante> restaurantesFiltrsadods = nombreRestauranteSs
      .expand((r) => (r.nombreRestaurantes)!.cast<NombreRestaurante>())
    .where((rest) => rest.id == Id)
    .toList();
    print('|||||||||||||ddddddddd-||||||||||||: ${restaurantesFiltrsadods}');







/////







/*

  // Filtrar por ID
  List<NombreRestaurante> restaurantesFiltrados = nombreRestaurantes.where((r) => r.id == Id).toList();

  print('Restaurantes filtrados por ID: $restaurantesFiltrados'); */

  return restaurantesFiltrsadods;
  }
   }
