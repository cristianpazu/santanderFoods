import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/v3.1/entities/RestaurantesResponseDTO.dart';
import 'package:foods/v3.1/notifiers/resturanteNotifiers/Resturante_notifiers.dart';
final searchTextPageProvider = StateProvider<String>((ref) => '');

final filteredRestaurantesProvider =
    Provider<List<Restaurantesresponsedto>>((ref) {
  final state = ref.watch(resturantesStateNotifierProvider);

  final searchText =
      ref.watch(searchTextPageProvider).trim().toLowerCase();

  if (state.isLoding == true) return [];

  final restaurantes = state.restaurantesresponsedto ?? [];

  if (searchText.isEmpty) return restaurantes;

  return restaurantes.where((restaurante) {
    final nombre = restaurante.nombre?.toLowerCase() ?? '';

    return nombre.contains(searchText);
  }).toList();
});