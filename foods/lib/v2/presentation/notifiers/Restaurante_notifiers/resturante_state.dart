import 'package:foods/UI/screens/restaurantes/restaurantess.dart';
import 'package:foods/v2/domain/entities/restaurantes/Restaurantes.dart';



class ResturanteState {
  final bool? isLoding;
  final List<Restaurantes>? restaurantes;


  ResturanteState({
    this.isLoding = false,
    this.restaurantes = const [], 
});

ResturanteState copyWith({
  bool? isLoding,
  List<Restaurantes>? restaurante,
}) => ResturanteState(
  isLoding: isLoding ?? this.isLoding,
  restaurantes: restaurante ?? this.restaurantes
);



}

