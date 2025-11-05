import 'package:foods/v3/entities/ComidaRapidas2.dart';
import 'package:foods/v3/entities/NombreComidaRapida2.dart';

abstract class ComidarapidaRepositories2 {

Future<List<ComidaRapidas2>> getAllComidaRapida();

Future<List<NombreComidaRapida2>> getComidaRapidaById(int Id);

}