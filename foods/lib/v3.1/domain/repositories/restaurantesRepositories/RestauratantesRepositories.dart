import 'package:foods/v3.1/entities/RestaurantesResponseDTO.dart' show Restaurantesresponsedto;

abstract class Restauratantesrepositories {

 Future<List<Restaurantesresponsedto>> consultarRestaurantes();

}