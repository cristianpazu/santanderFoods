import 'package:foods/UI/screens/restaurantes/restaurantess.dart';
import 'package:foods/v2/domain/entities/comidas_rapidas/MenuComidaRapida.dart';
import 'package:foods/v2/domain/entities/comidas_rapidas/NombreComidaRapidas.dart';
import 'package:foods/v2/domain/entities/restaurantes/Informacion.dart';
import 'package:foods/v2/domain/entities/restaurantes/NombreRestaurantes.dart';
import 'package:foods/v2/domain/entities/restaurantes/Restaurantes.dart';



class NombreComidaRapidaState {
  final int id;
  final bool? isLoding;
 final List<NombreComidaRapida>? nombreComidaRapida;
 final List<MenuComidaRapidas>? menuComidaRapidas;

  NombreComidaRapidaState({
    required this.id,
    this.isLoding = false,
      this.nombreComidaRapida= const [], 
      this.menuComidaRapidas = const []
});

NombreComidaRapidaState copyWith({
  int? id,
  bool? isLoding,

    List<NombreComidaRapida>? nombreComidaRapida,
      List<MenuComidaRapidas>? menuComidaRapidas
}) => NombreComidaRapidaState(
  id: id ?? this.id,
  isLoding: isLoding ?? this.isLoding,
  
 
   nombreComidaRapida: nombreComidaRapida ?? this.nombreComidaRapida,
   menuComidaRapidas: menuComidaRapidas ?? this.menuComidaRapidas
);



}

