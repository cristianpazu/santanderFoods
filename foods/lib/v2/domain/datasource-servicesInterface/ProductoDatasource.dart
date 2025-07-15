


import 'package:foods/v2/domain/entities/restaurantes/Restaurantes.dart';

abstract class RestaurantesDatasource {
   
Future<List<Restaurantes>> getAllRestaurantes();

}