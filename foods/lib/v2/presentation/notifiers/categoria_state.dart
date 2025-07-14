import 'package:foods/v2/domain/entities/categoria.dart';

class CategoriaState {
  final bool isLoding;
  final List<Categoria> categorias;


CategoriaState( {

 this.isLoding = false, 
 this.categorias = const [], 
});

CategoriaState copyWith({
  bool? isLoding,
  List<Categoria>? categoria,
}) => CategoriaState(
  isLoding: isLoding ?? this.isLoding,
  categorias: categorias ?? this.categorias
);



}