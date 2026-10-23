
import 'package:flutter_riverpod/flutter_riverpod.dart' show StateNotifierProvider, StateNotifier;
import 'package:foods/v2/domain/repositories/RestaurantesRepositories.dart';
import 'package:foods/v3.1/domain/repositories/restaurantesRepositories/RestauratantesRepositories.dart' show Restauratantesrepositories;
import 'package:foods/v3.1/entities/Restaurantes/RestauranteCompletoResponseDTO.dart' show Restaurantecompletoresponsedto;
import 'package:foods/v3.1/entities/RestaurantesResponseDTO.dart' show Restaurantesresponsedto;
import 'package:foods/v3.1/notifiers/resturanteNotifiers/Restaurante_State.dart' show RestauranteState;
import 'package:foods/v3.1/provider/RestauranteProvider.dart' show restauranteProvider;

final resturantesStateNotifierProvider =
    StateNotifierProvider<ResturanteNotifiers, RestauranteState>((ref) {
  final pedidoResposityController = ref.watch(restauranteProvider);

  return ResturanteNotifiers( restaurantesRepositories: pedidoResposityController);
});

class ResturanteNotifiers extends StateNotifier<RestauranteState> {
final Restauratantesrepositories restaurantesRepositories;

ResturanteNotifiers({required this.restaurantesRepositories}) : super(RestauranteState()) {
 
     consultarResturantes();
   
  }


  Future consultarResturantes() async {
if (state.isLoding == true) {
  print('🔴 NO HAGO PETICIÓN PORQUE ESTÁ CARGANDO');
  return;
}

    state = state.copyWith(isLoding: true);
    try{
      final List<Restaurantesresponsedto> restaurantes =
        await restaurantesRepositories.consultarRestaurantes();

    print('>>>>>>>>>>>>>>>>< $restaurantes');

    state = state.copyWith(
        isLoding: false,
        restaurantesresponsedto: [...?state.restaurantesresponsedto, ...restaurantes]);

    }catch(_){
    state = state.copyWith(isLoding: false);
    }

  }


  Future consultarRestauranteId(id) async {
    if (state.isLoding == true) return;

    state = state.copyWith(isLoding: true);
  try {

    final Restaurantecompletoresponsedto restaurantecompletoresponsedto =
        await restaurantesRepositories.consultarRestaurantesId(id);

   

    state = state.copyWith(
        isLoding: false,
       restaurantecompletoresponsedto: restaurantecompletoresponsedto
       );

  } catch (e, stackTrace) {
    print('❌ ERROR ConsultarPedidosActuales: $e');
    print('STACKTRACE: $stackTrace');

    state = state.copyWith(isLoding: false);
  }
}


}