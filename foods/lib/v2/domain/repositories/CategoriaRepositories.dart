

import 'package:foods/v2/domain/entities/categorias/categoria.dart';

abstract class Categoriarepositories {


Future<List<Categoria>> getAllCategorias();

}