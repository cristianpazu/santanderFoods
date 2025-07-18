import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/v2/domain/repositories/RestaurantesRepositories.dart';
import 'package:foods/v2/presentation/notifiers/Restaurante_notifiers/nombre_restaurante_state.dart';
import 'package:foods/v2/presentation/notifiers/Restaurante_notifiers/resturante_state.dart';
import 'package:foods/v2/presentation/providers/restaurante_repository_provider.dart';

final nombrerestauranteProvider = StateNotifierProvider.autoDispose.family<NombreRestauranteNotifier, NombreRestauranteState, int>(
  (ref, idResturant){

final  restauranterepository = ref.watch(restaurantesRepositoryProvider);

return NombreRestauranteNotifier(
restaurantesRepositories: restauranterepository,
 idRestaurante: idResturant,
);

});




class NombreRestauranteNotifier extends StateNotifier<NombreRestauranteState>{ 

final RestaurantesRepositories restaurantesRepositories;

  NombreRestauranteNotifier({
required this.restaurantesRepositories,
required int idRestaurante,
  }):super(NombreRestauranteState(id: idRestaurante)){
    loadRestauranteId();
  //  loadRestauranteId( Id);
  }


 Future loadRestauranteId() async {
    if (state.isLoding == true) return;

    state = state.copyWith(isLoding: true);

    final nombreRestaurantes = await restaurantesRepositories.getRestauranteById(state.id);
   print('-------------------------|||||||| $nombreRestaurantes');
    if (nombreRestaurantes.isEmpty) {
      state = state.copyWith(isLoding: false);
      return;
    }
     final restaurante = nombreRestaurantes.first;

    final informacion = restaurante.informacion.isNotEmpty
        ? restaurante.informacion.first
        : null;

        print('objectinformacion $informacion');

    state = state.copyWith(
        isLoding: false, nombrerestuarante: [...state.nombrerestuarante!, ...nombreRestaurantes],
        informacion: informacion);
  }
   }