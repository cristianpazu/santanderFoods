import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/v2/domain/repositories/CategoriaRepositories.dart';
import 'package:foods/v2/infrastructure/datasource-ServiceImpl/categoria_datasource_Impl.dart';
import 'package:foods/v2/infrastructure/repository-controller/Categoria_repository_impl.dart';




final categoriaRepositoryProvider = Provider<Categoriarepositories>((ref){

final categoriaRepository = CategoriaRepositoryImpl(
CategoriaDatasourceimpl()
);

return categoriaRepository;
});


