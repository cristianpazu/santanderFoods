


import 'package:foods/v2/domain/entities/restaurantes/Informacion.dart';
import 'package:foods/v2/domain/entities/restaurantes/Restaurantes.dart';

abstract class RestaurantesDatasource {
   
Future<List<Restaurantes>> getAllRestaurantes();

Future<Informacion> getRestauranteById(int Id);

}