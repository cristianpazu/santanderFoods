import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foods/v2/domain/datasource-servicesInterface/ProductoDatasource.dart';
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


 }