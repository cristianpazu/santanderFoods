
import 'package:flutter_riverpod/flutter_riverpod.dart' show Provider;
import 'package:foods/v3.1/domain/repositories/restaurantesRepositories/RestauratantesRepositories.dart' show Restauratantesrepositories;
import 'package:foods/v3.1/infrastructure/REPOSITORY-CONTROLLER/restaurante_repository_controller/restaurante_repository_controller.dart' show RestauranteRepositoryController;
import 'package:foods/v3.1/infrastructure/datasource-ServiceIMPL/resturanteImpl/RestauranteServiceImpl.dart' show Restauranteserviceimpl;

final restauranteProvider = Provider<Restauratantesrepositories>((ref) {
  final pedidoRepository = RestauranteRepositoryController(Restauranteserviceimpl());

  return pedidoRepository;
});