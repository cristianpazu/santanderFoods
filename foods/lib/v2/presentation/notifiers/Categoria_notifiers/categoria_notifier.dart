import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/v2/domain/entities/categorias/categoria.dart';
import 'package:foods/v2/domain/repositories/CategoriaRepositories.dart';
import 'package:foods/v2/infrastructure/repository-controller/Categoria_repository_impl.dart';
import 'package:foods/v2/presentation/notifiers/Categoria_notifiers/categoria_state.dart';
import 'package:foods/v2/presentation/providers/categoria_repository_providers.dart';

final categoriaProvider =
    StateNotifierProvider<CategoriaNotifier, CategoriaState>((ref) {
  final categoriarepositories = ref.watch(categoriaRepositoryProvider);
  print('c>>>>>>>>>>>>>>>>>>>>>>>>>> $categoriarepositories');
  return CategoriaNotifier(categoriarepositories: categoriarepositories);
});

class CategoriaNotifier extends StateNotifier<CategoriaState> {
  final Categoriarepositories categoriarepositories;

  CategoriaNotifier({required this.categoriarepositories})
      : super(CategoriaState()) {
    loadCategoria();
  }

  Future loadCategoria() async {
    if (state.isLoding == true) return;

    state = state.copyWith(isLoding: true);

    final categoria = await categoriarepositories.getAllCategorias();
    print('categoria|||||||||||| $categoria');
    if (categoria.isEmpty) {
      state = state.copyWith(isLoding: false);
      return;
    }

    state = state.copyWith(
        isLoding: false, categoria: [...state.categorias, ...categoria]);
  }
}

/*
final categoriaProvider = StateNotifierProvider<CategoriaNotifier, List<Categoria>>((ref){
return CategoriaNotifier();
});


class CategoriaNotifier extends StateNotifier<List<Categoria>>{
 CategoriaNotifier() : super([]);

Future <List<Categoria>> consultarCategorias()async{

return null;
}
  
} */