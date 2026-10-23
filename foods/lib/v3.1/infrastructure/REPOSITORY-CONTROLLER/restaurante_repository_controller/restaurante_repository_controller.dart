import 'package:foods/v3.1/domain/repositories/restaurantesRepositories/RestauratantesRepositories.dart' show Restauratantesrepositories;
import 'package:foods/v3.1/entities/Restaurantes/RestauranteCompletoResponseDTO.dart';
import 'package:foods/v3.1/entities/RestaurantesResponseDTO.dart';
import 'package:foods/v3.1/infrastructure/datasource-ServiceIMPL/resturanteImpl/RestauranteServiceImpl.dart' show Restauranteserviceimpl;

class RestauranteRepositoryController extends Restauratantesrepositories{

final Restauranteserviceimpl restauranteserviceimpl;


RestauranteRepositoryController(this.restauranteserviceimpl);

  @override
  Future<List<Restaurantesresponsedto>> consultarRestaurantes() {

 final restaurantes = restauranteserviceimpl.consultarRestaurantes();
print('Restaurantesresponsedto ${restaurantes}');
   return restaurantes;

  }

  @override
  Future<Restaurantecompletoresponsedto> consultarRestaurantesId(int id) {
     return restauranteserviceimpl.consultarRestaurantesId(id);
  }

}