import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/v2/domain/repositories/ComidaRapidaRepositories.dart';
import 'package:foods/v2/domain/repositories/RestaurantesRepositories.dart';
import 'package:foods/v2/presentation/notifiers/Comida_rapida_notifiers/nombre_comida_rapida_state.dart';
import 'package:foods/v2/presentation/notifiers/Restaurante_notifiers/nombre_restaurante_state.dart';
import 'package:foods/v2/presentation/notifiers/Restaurante_notifiers/resturante_state.dart';
import 'package:foods/v2/presentation/providers/comida_rapida_repository_providers.dart';
import 'package:foods/v2/presentation/providers/restaurante_repository_provider.dart';

final nombreComidaRapidaRestauranteProvider = StateNotifierProvider.autoDispose.family<NombreComidaRapidaNotifier, NombreComidaRapidaState, int>(
  (ref, idResturant){

final  comidaRapidarepository = ref.watch(comidaRapidasRepositoryProvider);

return NombreComidaRapidaNotifier(
comidarapidarepositories: comidaRapidarepository,
 idRestaurante: idResturant,
);

});




class NombreComidaRapidaNotifier extends StateNotifier<NombreComidaRapidaState>{ 

final Comidarapidarepositories comidarapidarepositories;

  NombreComidaRapidaNotifier({
required this.comidarapidarepositories,
required int idRestaurante,
  }):super(NombreComidaRapidaState(id: idRestaurante)){
    loadComidaRapidaId();
  //  loadRestauranteId( Id);
  }


 Future loadComidaRapidaId() async {
    if (state.isLoding == true) return;

    state = state.copyWith(isLoding: true);

    final nombreComidaRapida = await comidarapidarepositories.getComidaRapidaById(state.id);
   print('-------------------------|||||||| $nombreComidaRapida');
    if (nombreComidaRapida.isEmpty) {
      state = state.copyWith(isLoding: false);
      return;
    }
     final restaurante = nombreComidaRapida.first;
final menu = restaurante.menu;

    state = state.copyWith(
        isLoding: false, nombreComidaRapida: [...state.nombreComidaRapida!, ...nombreComidaRapida],
        menuComidaRapidas: menu);
  }
   }