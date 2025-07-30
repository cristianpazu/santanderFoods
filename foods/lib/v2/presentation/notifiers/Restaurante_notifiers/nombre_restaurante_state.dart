
import 'package:foods/v2/domain/entities/restaurantes/Informacion.dart';
import 'package:foods/v2/domain/entities/restaurantes/NombreRestaurantes.dart';



class NombreRestauranteState {
  final int id;
  final bool? isLoding;
  final List<NombreRestaurante>? nombrerestuarante;
 final Informacion? informacion;

  NombreRestauranteState({
    required this.id,
    this.isLoding = false,
    this.nombrerestuarante = const [], 
      this.informacion,
});

NombreRestauranteState copyWith({
  int? id,
  bool? isLoding,
  List<NombreRestaurante>? nombrerestuarante,
     Informacion? informacion,
}) => NombreRestauranteState(
  id: id ?? this.id,
  isLoding: isLoding ?? this.isLoding,
  nombrerestuarante: nombrerestuarante ?? this.nombrerestuarante,
   informacion: informacion ?? this.informacion,
);



}

