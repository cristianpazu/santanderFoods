import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/v2/domain/repositories/ComidaRapidaRepositories.dart';
import 'package:foods/v2/domain/repositories/RestaurantesRepositories.dart';
import 'package:foods/v2/infrastructure/repository-controller/Restaurante_repository_impl.dart';
import 'package:foods/v2/presentation/notifiers/Comida_rapida_notifiers/comida_rapida_state.dart';
import 'package:foods/v2/presentation/notifiers/Restaurante_notifiers/resturante_state.dart';
import 'package:foods/v2/presentation/providers/comida_rapida_repository_providers.dart';
import 'package:foods/v2/presentation/providers/restaurante_repository_provider.dart';



final comidaRapidaProvider = StateNotifierProvider<ComidaRapidaNotifier, ComidaRapidaState>((ref){

final  comidaRapidarepository = ref.watch(comidaRapidasRepositoryProvider);

return ComidaRapidaNotifier(
comidarapidarepositories: comidaRapidarepository
);

});




class ComidaRapidaNotifier extends StateNotifier<ComidaRapidaState>{ 

final Comidarapidarepositories comidarapidarepositories;

  ComidaRapidaNotifier({
required this.comidarapidarepositories
  }):super(ComidaRapidaState()){
   // loadRestaurante();
  //  loadRestauranteId( Id);
  }


 Future loadComidaRapidas() async {
    if (state.isLoding == true) return;

    state = state.copyWith(isLoding: true);

    await Future.delayed(Duration(seconds: 5));  
    final comidaRapidas = await comidarapidarepositories.getAllComidaRapida();
   print('||||||||||||||||||||comidaRapidas $comidaRapidas');
    if (comidaRapidas.isEmpty) {
      state = state.copyWith(isLoding: false);
      return;
    }

    state = state.copyWith(
        isLoding: false, comidaRapida: [...state.comidaRapida, ...comidaRapidas]);
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