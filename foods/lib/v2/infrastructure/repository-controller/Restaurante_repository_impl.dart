
import 'package:foods/v2/domain/datasource-servicesInterface/ProductoDatasource.dart';
import 'package:foods/v2/domain/entities/restaurantes/Restaurantes.dart';
import 'package:foods/v2/domain/repositories/RestaurantesRepositories.dart';

class RestauranteRepositoryImpl extends RestaurantesRepositories {

 final RestaurantesDatasource restaurantesDatasource;

  RestauranteRepositoryImpl(this.restaurantesDatasource);


  @override
  Future<List<Restaurantes>> consultarRestaurantes() {
   


   return restaurantesDatasource.getAllRestaurantes();
  }

}