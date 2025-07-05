import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foods/v2/domain/entities/categoria.dart';
import 'package:foods/v2/domain/servicesInterface/consultarRestaurantesService.dart';

class Categoriaimpl extends RestaurantesInterface {
/*
Future<List<dynamic>> loadJson() async {
    String jsonString = await rootBundle.loadString('assets/categoria.json');
    List<dynamic> jsonResponse = json.decode(jsonString);
    print('jsonResponse $jsonResponse');
    return jsonResponse;
  } */


  @override
  Future<List<Categoria>> getAllCategorias() async{
  String jsonString = await rootBundle.loadString('assets/categoria.json');
    List<Categoria> jsonResponse = json.decode(jsonString);
    print('jsonResponse $jsonResponse');
    return jsonResponse;
  }

  
}