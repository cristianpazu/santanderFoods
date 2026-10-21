import 'package:foods/v3.1/entities/RestaurantesResponseDTO.dart' show Restaurantesresponsedto;

abstract class Restaurantedatasource {

Future<List<Restaurantesresponsedto>> consultarRestaurantes();

  
}