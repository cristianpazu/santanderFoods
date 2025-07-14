import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foods/v2/domain/datasource-servicesInterface/CategoriaDatasource.dart';
import 'package:foods/v2/domain/entities/categoria.dart';


class CategoriaDatasourceimpl extends CategoriaDatasourceInterface {
/*
Future<List<dynamic>> loadJson() async {
    String jsonString = await rootBundle.loadString('assets/categoria.json');
    List<dynamic> jsonResponse = json.decode(jsonString);
    print('jsonResponse $jsonResponse');
    return jsonResponse;
  } 
   Future<List<dynamic>> loadJson() async {
    String jsonString = await rootBundle.loadString('assets/categoria.json');
    List<dynamic> jsonResponse = json.decode(jsonString);
    print('jsonResponse $jsonResponse');
    return jsonResponse;
  }
  
  */


  @override
  Future<List<Categoria>> getAllCategorias() async{
  String jsonString = await rootBundle.loadString('assets/categoria.json');
    final data = json.decode(jsonString); // esto es List<dynamic>

 
  final List<dynamic> categoriasJson = data[0]["nombre_categoria"];


  List<Categoria> categorias = categoriasJson.map((item) => Categoria.fromJson(item)).toList();
print('categoriascategoriascategorias $categorias');
  return categorias;
  }

  
}