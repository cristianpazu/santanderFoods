
import 'package:foods/v2/domain/datasource-servicesInterface/RestaurantesDatasource.dart';
import 'package:foods/v2/domain/entities/restaurantes/Informacion.dart';
import 'package:foods/v2/domain/entities/restaurantes/NombreRestaurantes.dart';
import 'package:foods/v2/domain/entities/restaurantes/Restaurantes.dart';
import 'package:foods/v2/domain/repositories/RestaurantesRepositories.dart';

class RestauranteRepositoryImpl extends RestaurantesRepositories {

 final RestaurantesDatasource restaurantesDatasource;

  RestauranteRepositoryImpl(this.restaurantesDatasource);


  @override
  Future<List<Restaurantes>> consultarRestaurantes() {



   return restaurantesDatasource.getAllRestaurantes();
  }
 @override
  Future<List<NombreRestaurante>> getRestauranteById(int Id) {
    return restaurantesDatasource.getRestauranteById(Id);
  }
}