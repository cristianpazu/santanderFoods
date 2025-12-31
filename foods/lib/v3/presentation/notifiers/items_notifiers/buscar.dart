import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/v3/entities/descripcionMenu.dart';
import 'package:foods/v3/presentation/notifiers/comida_rapida_notifiers/nombre_comida_2_notifiers.dart';

final searchTextProvider = StateProvider<String>((ref) => '');

final filteredMenuProvider = Provider.family<List<Map<String, dynamic>>, int>((ref, idRestaurante) {
  final productState =
      ref.watch(nombreComidaRapidaRestaurante2Provider(idRestaurante));

  final searchText = ref.watch(searchTextProvider);

  if (productState.isLoding!) return [];

  final restaurantes = productState.nombreComidaRapida ?? [];

  final allItems = restaurantes.expand((restaurante) {
    return restaurante.menu.expand((menu) {
      return (menu.descripcion ?? []).map((item) => {
            'restaurante': restaurante,
            'submenu': menu.submenu,
            'item': item,
          });
    });
  }).toList();

  if (searchText.isEmpty) return allItems;

  return allItems.where((e) {
    final item = e['item'] as DescripcionMenu;
    return item.nombre!.toLowerCase().contains(searchText) ||
           item.descripcion!.toLowerCase().contains(searchText);
  }).toList();
});
