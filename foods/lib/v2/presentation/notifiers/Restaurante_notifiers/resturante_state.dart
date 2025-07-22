import 'package:foods/UI/screens/restaurantes/restaurantess.dart';
import 'package:foods/v2/domain/entities/restaurantes/Restaurantes.dart';



class ResturanteState {
  final bool isLoding;
  final List<Restaurantes> restaurante;


  ResturanteState({
    this.isLoding = false,
    this.restaurante = const [], 
});

ResturanteState copyWith({
  bool? isLoding,
  List<Restaurantes>? restaurante,
}) => ResturanteState(
  isLoding: isLoding ?? this.isLoding,
  restaurante: restaurante ?? this.restaurante
);



}

