import 'package:foods/v2/domain/entities/comidas_rapidas/NombreComidaRapidas.dart';
import 'package:foods/v2/domain/entities/comidas_rapidas/comidasRapidas.dart';

abstract class Comidarapidarepositories {
  Future<List<ComidaRapidas>> getAllComidaRapida();

Future<List<NombreComidaRapida>> getComidaRapidaById(int Id);
}