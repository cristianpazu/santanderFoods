import 'package:foods/v2/domain/entities/comidas_rapidas/NombreComidaRapidas.dart';
import 'package:foods/v2/domain/entities/comidas_rapidas/comidasRapidas.dart';

class ComidaRapidaState {
    final bool isLoding;
  final List<ComidaRapidas> comidaRapida;


  ComidaRapidaState({
    this.isLoding = false,
    this.comidaRapida = const [], 
});

ComidaRapidaState copyWith({
  bool? isLoding,
  List<ComidaRapidas>? comidaRapida,
}) => ComidaRapidaState(
  isLoding: isLoding ?? this.isLoding,
  comidaRapida: comidaRapida ?? this.comidaRapida 
);


}