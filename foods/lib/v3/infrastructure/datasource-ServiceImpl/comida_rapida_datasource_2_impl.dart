import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foods/v3/domain/repositories/ComidarapidaRepositories2.dart';
import 'package:foods/v3/entities/ComidaRapidas2.dart';
import 'package:foods/v3/entities/NombreComidaRapida2.dart';

class ComidaRapidaDatasource2Impl extends ComidarapidaRepositories2 {
  @override
  Future<List<ComidaRapidas2>> getAllComidaRapida() {
    // TODO: implement getAllComidaRapida
    throw UnimplementedError();
  }

  @override
  Future<List<NombreComidaRapida2>> getComidaRapidaById(int Id) async{
    String jsonString = await rootBundle.loadString('assets/postres.json');
 
  // Decodificar
  final Map<String, dynamic> data = json.decode(jsonString);

  // Acceder a la lista dentro de menu → descripcion
 final restaurante = NombreComidaRapida2.fromJson(data);

  // 3️⃣ Verificar si el id coincide
  if (restaurante.id == Id) {
    return [restaurante];
  } else {
    return [];
  }
  }
}