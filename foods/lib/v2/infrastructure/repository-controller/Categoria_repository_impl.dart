import 'package:foods/v2/domain/datasource-servicesInterface/CategoriaDatasource.dart';
import 'package:foods/v2/domain/entities/categorias/categoria.dart';
import 'package:foods/v2/domain/entities/restaurantes/Informacion.dart';
import 'package:foods/v2/domain/repositories/CategoriaRepositories.dart';
import 'package:foods/v2/infrastructure/datasource-ServiceImpl/categoria_datasource_Impl.dart';
//controller

class CategoriaRepositoryImpl  extends Categoriarepositories{



final CategoriaDatasourceInterface categoriaDatasourceimpl;

CategoriaRepositoryImpl(this.categoriaDatasourceimpl);


  @override
  Future<List<Categoria>> getAllCategorias() {
    return categoriaDatasourceimpl.getAllCategorias();
  }

  


}