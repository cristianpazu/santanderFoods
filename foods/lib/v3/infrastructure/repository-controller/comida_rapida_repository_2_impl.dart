import 'package:foods/v3/domain/repositories/ComidarapidaRepositories2.dart';
import 'package:foods/v3/entities/ComidaRapidas2.dart';
import 'package:foods/v3/entities/NombreComidaRapida2.dart';
import 'package:foods/v3/infrastructure/datasource-ServiceImpl/comida_rapida_datasource_2_impl.dart';

class ComidaRapidaRepository2Impl extends ComidarapidaRepositories2{


 final ComidaRapidaDatasource2Impl comidaRapidaDatasource2Impl;

 ComidaRapidaRepository2Impl(this.comidaRapidaDatasource2Impl);


  @override
  Future<List<ComidaRapidas2>> getAllComidaRapida() {
    // TODO: implement getAllComidaRapida
    throw UnimplementedError();
  }

  @override
  Future<List<NombreComidaRapida2>> getComidaRapidaById(int Id) {
   return comidaRapidaDatasource2Impl.getComidaRapidaById(Id);
  }
  
}