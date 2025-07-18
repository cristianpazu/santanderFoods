

import 'package:foods/v2/domain/entities/restaurantes/Informacion.dart';
import 'package:foods/v2/domain/entities/restaurantes/NombreRestaurantes.dart';
import 'package:foods/v2/domain/entities/restaurantes/Restaurantes.dart';

abstract class RestaurantesRepositories {

Future<List<Restaurantes>> consultarRestaurantes();

Future<List<NombreRestaurante>> getRestauranteById(int Id);

}