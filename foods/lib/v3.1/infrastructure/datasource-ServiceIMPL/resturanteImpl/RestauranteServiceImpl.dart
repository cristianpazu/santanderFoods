import 'package:foods/v2/infrastructure/datasource-ServiceImpl/restaurante_datasource_Impl.dart';
import 'package:foods/v3.1/domain/datasource-serviceIntergace/RestauranteInterface/RestauranteDatasource.dart' show Restaurantedatasource;
import 'package:foods/v3.1/entities/RestaurantesResponseDTO.dart';

class Restauranteserviceimpl extends Restaurantedatasource {
  @override
  Future<List<Restaurantesresponsedto>> consultarRestaurantes() {
    // TODO: implement consultarEstadoPedido
    throw UnimplementedError();
  }

}