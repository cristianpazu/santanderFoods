import 'package:foods/v2/domain/entities/categoria.dart';

abstract class RestaurantesInterface{

  Future<List<Categoria>> getAllCategorias();



}