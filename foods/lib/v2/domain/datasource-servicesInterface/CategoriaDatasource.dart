import 'package:foods/v2/domain/entities/categoria.dart';
//Interface
abstract class CategoriaDatasourceInterface{

  Future<List<Categoria>> getAllCategorias();



}