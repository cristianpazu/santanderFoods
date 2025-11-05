import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/v2/domain/repositories/ComidaRapidaRepositories.dart';
import 'package:foods/v2/domain/repositories/RestaurantesRepositories.dart';
import 'package:foods/v2/presentation/notifiers/Comida_rapida_notifiers/nombre_comida_rapida_state.dart';
import 'package:foods/v2/presentation/notifiers/Restaurante_notifiers/nombre_restaurante_state.dart';
import 'package:foods/v2/presentation/notifiers/Restaurante_notifiers/resturante_state.dart';
import 'package:foods/v2/presentation/providers/comida_rapida_repository_providers.dart';
import 'package:foods/v2/presentation/providers/restaurante_repository_provider.dart';
import 'package:foods/v3/domain/repositories/ComidarapidaRepositories2.dart';
import 'package:foods/v3/presentation/notifiers/comida_rapida_notifiers/nombre_comida_rapida_2_state.dart';
import 'package:foods/v3/presentation/providers/comida_rapida_repository_2_providers.dart';

final nombreComidaRapidaRestaurante2Provider = StateNotifierProvider.autoDispose.family<NombreComidaRapida2Notifier, NombreComidaRapida2State, int>(
  (ref, idResturant){

final  comidaRapidarepository = ref.watch(comidaRapidasRepository2Provider);

return NombreComidaRapida2Notifier(
comidarapidarepositories2: comidaRapidarepository,
 idRestaurante: idResturant,
);

});




class NombreComidaRapida2Notifier extends StateNotifier<NombreComidaRapida2State>{ 

final ComidarapidaRepositories2 comidarapidarepositories2;

  NombreComidaRapida2Notifier({
required this.comidarapidarepositories2,
required int idRestaurante,
  }):super(NombreComidaRapida2State(id: idRestaurante)){
    loadComidaRapidaId();
  //  loadRestauranteId( Id);
  }


 Future loadComidaRapidaId() async {
    if (state.isLoding == true) return;

    state = state.copyWith(isLoding: true);

    final nombreComidaRapida = await comidarapidarepositories2.getComidaRapidaById(state.id);
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