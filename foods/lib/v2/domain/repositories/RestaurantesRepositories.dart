

import 'package:foods/v2/domain/entities/restaurantes/Informacion.dart';
import 'package:foods/v2/domain/entities/restaurantes/Restaurantes.dart';

abstract class RestaurantesRepositories {

Future<List<Restaurantes>> consultarRestaurantes();

Future<Informacion> getRestauranteById(int Id);

}