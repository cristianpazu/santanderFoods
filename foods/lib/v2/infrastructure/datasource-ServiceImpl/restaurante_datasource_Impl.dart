import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foods/v2/domain/datasource-servicesInterface/ProductoDatasource.dart';
import 'package:foods/v2/domain/entities/restaurantes/Restaurantes.dart';

class RestauranteDatasourceImpl  extends RestaurantesDatasource{


  @override
  Future<List<Restaurantes>> getAllRestaurantes() async {

   String jsonString = await rootBundle.loadString('assets/placesrestaurante.json');
    final data = json.decode(jsonString); // esto es List<dynamic>

 print('restaurtassssssssssss $data');
final restauranteJson = data[0]['nombre_restaurantes'] as List;
  List<Restaurantes> restaurantes = restauranteJson.map((item) => Restaurantes.fromJson(item)).toList();

print('restaurtassssssssssss $restaurantes');
  return restaurantes;
  }


 }