import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/v2/domain/repositories/RestaurantesRepositories.dart';
import 'package:foods/v2/infrastructure/repository-controller/Restaurante_repository_impl.dart';
import 'package:foods/v2/presentation/notifiers/Restaurante_notifiers/resturante_state.dart';
import 'package:foods/v2/presentation/providers/restaurante_repository_provider.dart';



final restauranteProvider = StateNotifierProvider<RestauranteNotifier, ResturanteState>((ref){

final  restauranterepository = ref.watch(restaurantesRepositoryProvider);

return RestauranteNotifier(
restaurantesRepositories: restauranterepository
);

});




class RestauranteNotifier extends StateNotifier<ResturanteState>{ 

final RestaurantesRepositories restaurantesRepositories;

  RestauranteNotifier({
required this.restaurantesRepositories
  }):super(ResturanteState()){
   // loadRestaurante();
  //  loadRestauranteId( Id);
  }


 Future loadRestaurante() async {
    if (state.isLoding == true) return;

    state = state.copyWith(isLoding: true);

    await Future.delayed(Duration(seconds: 5));  
    final restaurantes = await restaurantesRepositories.consultarRestaurantes();
   
    if (restaurantes.isEmpty) {
      state = state.copyWith(isLoding: false);
      return;
    }

    state = state.copyWith(
        isLoding: false, restaurante: [...state.restaurante, ...restaurantes]);
  }
  //

  /* Future loadRestauranteId(int id) async {
    if (state.isLoding == true) return;

    state = state.copyWith(isLoding: true);

    final restaurantes2 = await restaurantesRepositories.getRestauranteById(id);
   
    if (restaurantes2.isEmpty) {
      state = state.copyWith(isLoding: false);
      return;
    }

    state = state.copyWith(
        isLoding: false, restaurante: [...state.restaurantes!, ...restaurantes2]);
  } */

}