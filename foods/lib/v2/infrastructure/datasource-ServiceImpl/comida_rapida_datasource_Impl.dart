import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foods/v2/domain/datasource-servicesInterface/ComidaRapidaDataSource.dart';
import 'package:foods/v2/domain/entities/comidas_rapidas/NombreComidaRapidas.dart';
import 'package:foods/v2/domain/entities/comidas_rapidas/comidasRapidas.dart';

class ComidaRapidaDatasourceImpl extends Comidarapidadatasource  {
  @override
  Future<List<ComidaRapidas>> getAllComidaRapida()async {
 String jsonString = await rootBundle.loadString('assets/comidasRapidas.json');
  final data = json.decode(jsonString); // Esto es una Lista dinámica (List<dynamic>)

  

  
  final comidaRapidaJson = (data[0]['nombre_comida_rapida'] ?? []) as List;

  print('restauranteJson $comidaRapidaJson');
 final List<dynamic> datas = json.decode(jsonString);
  // Convertir a List<Restaurantes>
/*List<Restaurantes> restaurantes = restauranteJson.map((item) {
  
  return Restaurantes.fromJson(item);
}).toList(); */

print('objectdatas $datas');
List<ComidaRapidas> restaurantes = datas.map((item) {
    return ComidaRapidas.fromJson(item);
  }).toList();

 print('object>>>>>>>>>> $restaurantes');



  return restaurantes;
  }

  @override
  Future<List<NombreComidaRapida>> getComidaRapidaById(int Id)async {
 String jsonString = await rootBundle.loadString('assets/comidasRapidas.json');
 
// Acceder a la lista de restaurantes
List<dynamic> jsonResponXse = json.decode(jsonString);
print('Lista jsonResponXse: $jsonResponXse');
//List<dynamic> restaurantesJson = jsonResponXse['nombre_restaurantes'];

// Mapear a objetos NombreRestaurante
List<ComidaRapidas> nombreRestauranteSs = jsonResponXse.map((item) {
  return ComidaRapidas.fromJson(item);
}).toList();

print('||||||||||||||||||||||------------||||||||||||: $nombreRestauranteSs');

// Filtrar por ID
List<NombreComidaRapida> restaurantesFiltrsadods = nombreRestauranteSs
      .expand((r) => (r.nombreComidaRapida)!.cast<NombreComidaRapida>())
    .where((rest) => rest.id == Id)
    .toList();
    print('|||||||||||||ddddddddd-||||||||||||: ${restaurantesFiltrsadods.length}');




  return restaurantesFiltrsadods;
  }




  
}