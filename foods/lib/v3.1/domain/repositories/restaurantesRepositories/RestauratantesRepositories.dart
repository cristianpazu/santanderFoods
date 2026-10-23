import 'package:foods/v3.1/entities/Restaurantes/RestauranteCompletoResponseDTO.dart' show Restaurantecompletoresponsedto;
import 'package:foods/v3.1/entities/RestaurantesResponseDTO.dart' show Restaurantesresponsedto;

abstract class Restauratantesrepositories {

 Future<List<Restaurantesresponsedto>> consultarRestaurantes();

 Future<Restaurantecompletoresponsedto> consultarRestaurantesId(int id);

}