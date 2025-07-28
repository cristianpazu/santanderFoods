import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/v2/domain/repositories/ComidaRapidaRepositories.dart';
import 'package:foods/v2/domain/repositories/RestaurantesRepositories.dart';
import 'package:foods/v2/infrastructure/datasource-ServiceImpl/comida_rapida_datasource_Impl.dart';
import 'package:foods/v2/infrastructure/repository-controller/Comida_rapida_repository_impl.dart';

final comidaRapidasRepositoryProvider = Provider<Comidarapidarepositories>((ref){

final comidaRapidasRepository = ComidaRapidaRepositoryImpl(

  ComidaRapidaDatasourceImpl()
);


return comidaRapidasRepository;
});