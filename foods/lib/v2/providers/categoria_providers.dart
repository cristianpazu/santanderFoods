import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/v2/domain/entities/categoria.dart';


final categoriaProvider = StateNotifierProvider<CategoriaNotifier, List<Categoria>>((ref){
return CategoriaNotifier();
});


class CategoriaNotifier extends StateNotifier<List<Categoria>>{
 CategoriaNotifier() : super([]);

Future <List<Categoria>> consultarCategorias()async{

return 
}
  
}