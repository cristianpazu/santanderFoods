

import 'package:foods/v2/domain/entities/restaurantes/Restaurantes.dart';

abstract class RestaurantesRepositories {

Future<List<Restaurantes>> consultarRestaurantes();

}