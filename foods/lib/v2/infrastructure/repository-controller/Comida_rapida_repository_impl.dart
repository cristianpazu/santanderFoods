import 'package:foods/v2/domain/entities/comidas_rapidas/NombreComidaRapidas.dart';
import 'package:foods/v2/domain/entities/comidas_rapidas/comidasRapidas.dart';
import 'package:foods/v2/domain/repositories/ComidaRapidaRepositories.dart';
import 'package:foods/v2/infrastructure/datasource-ServiceImpl/comida_rapida_datasource_Impl.dart';

class ComidaRapidaRepositoryImpl extends  Comidarapidarepositories {

 final ComidaRapidaDatasourceImpl comidaRapidaDatasourceImpl;

  ComidaRapidaRepositoryImpl(this.comidaRapidaDatasourceImpl);


  @override
  Future<List<ComidaRapidas>> getAllComidaRapida() {
  return comidaRapidaDatasourceImpl.getAllComidaRapida();
  }

  @override
  Future<List<NombreComidaRapida>> getComidaRapidaById(int Id) {
    // TODO: implement getComidaRapidaById
    throw UnimplementedError();
  }
}