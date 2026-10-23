import 'package:foods/v3.1/entities/Restaurantes/RestauranteCompletoResponseDTO.dart' show Restaurantecompletoresponsedto;
import 'package:foods/v3.1/entities/RestaurantesResponseDTO.dart' show Restaurantesresponsedto;

class RestauranteState {
final bool? isLoding;
final List<Restaurantesresponsedto>? restaurantesresponsedto;
final Restaurantecompletoresponsedto? restaurantecompletoresponsedto;


RestauranteState({this.isLoding,this.restaurantesresponsedto, this.restaurantecompletoresponsedto});

RestauranteState copyWith({
  bool? isLoding,
  List<Restaurantesresponsedto>? restaurantesresponsedto,
  Restaurantecompletoresponsedto? restaurantecompletoresponsedto
}) => RestauranteState(
  isLoding: isLoding ?? this.isLoding,
  restaurantesresponsedto: restaurantesresponsedto ?? this.restaurantesresponsedto,
  restaurantecompletoresponsedto: restaurantecompletoresponsedto ?? this.restaurantecompletoresponsedto
  );

}