

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/v2/domain/repositories/RestaurantesRepositories.dart';
import 'package:foods/v2/infrastructure/datasource-ServiceImpl/restaurante_datasource_Impl.dart';
import 'package:foods/v2/infrastructure/repository-controller/Restaurante_repository_impl.dart';
final restaurantesRepositoryProvider = Provider<RestaurantesRepositories>((ref){

final restaurtantesRepository = RestauranteRepositoryImpl(

  RestauranteDatasourceImpl()
);


return restaurtantesRepository;
});