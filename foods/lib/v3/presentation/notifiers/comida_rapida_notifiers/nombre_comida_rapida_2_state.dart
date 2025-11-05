



import 'package:foods/v2/domain/entities/comidas_rapidas/MenuComidaRapida.dart';
import 'package:foods/v3/entities/NombreComidaRapida2.dart';
import 'package:foods/v3/entities/menus.dart';

class NombreComidaRapida2State {
  final int id;
  final bool? isLoding;
 final List<NombreComidaRapida2>? nombreComidaRapida;
  final List<Menus>? menuComidaRapidas;

  NombreComidaRapida2State({
    required this.id,
    this.isLoding = false,
      this.nombreComidaRapida= const [], 
      this.menuComidaRapidas = const []
    
});

NombreComidaRapida2State copyWith({
  int? id,
  bool? isLoding,

    List<NombreComidaRapida2>? nombreComidaRapida,
    List<Menus>? menuComidaRapidas
}) => NombreComidaRapida2State(
  id: id ?? this.id,
  isLoding: isLoding ?? this.isLoding,
  
 
   nombreComidaRapida: nombreComidaRapida ?? this.nombreComidaRapida,
   menuComidaRapidas: menuComidaRapidas ?? this.menuComidaRapidas
);



}

