

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/v2/domain/repositories/ComidaRapidaRepositories.dart';
import 'package:foods/v3/domain/repositories/ComidarapidaRepositories2.dart';
import 'package:foods/v3/infrastructure/datasource-ServiceImpl/comida_rapida_datasource_2_impl.dart';
import 'package:foods/v3/infrastructure/repository-controller/comida_rapida_repository_2_impl.dart';

final comidaRapidasRepository2Provider = Provider<ComidarapidaRepositories2>((ref){

final comidaRapidasRepository = ComidaRapidaRepository2Impl(

  ComidaRapidaDatasource2Impl()
);


return comidaRapidasRepository;
});