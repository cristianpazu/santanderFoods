import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/v2/domain/entities/item/items.dart';
import 'package:foods/v2/domain/entities/restaurantes/MenuDescripcion.dart';
import 'package:foods/v2/presentation/notifiers/items_notifiers/item_state.dart';

final itemsStateNotifier =
    StateNotifierProvider<ItemStateNotifiers, List<ItemState>>(
  (ref) => ItemStateNotifiers(),
);

class ItemStateNotifiers extends StateNotifier<List<ItemState>> {
  ItemStateNotifiers() : super([]);


bool agregarItems(Items nuevoItem, int restauranteId) {
  if (state.isNotEmpty && state.first.id != restauranteId) {
    // No se puede agregar
    return false;
  }

  // Revisar si ya está agregado
  bool existe = state.any((item) => item.menuDescripcion.first.nombre == nuevoItem.nombre);
  if (existe) return false;

  final nuevoEstado = ItemState(
    id: restauranteId,
    menuDescripcion: [MenuDescripcion.fromItems(nuevoItem)],
  );

  state = [...state, nuevoEstado];
  return true;
}

/*
  bool agregarItems(Items item) {
    final yaExiste = state.any((itemState) => itemState.menuDescripcion.any(
        (menu) =>
            menu.nombre?.toLowerCase().trim() ==
            item.nombre?.toLowerCase().trim()));

    if (yaExiste) {
      return false; // Ya existe, no lo agrega
    }

    state = [
      ...state,
      ItemState(
          //id: item.id!
          isLoding: false,
          menuDescripcion: _convertirAMenuDescripcion(item))
    ];
    print('item.salsasSeleccionadas ${item}');
    return true;
  } */
//

  void incrementarUnidades(String nombre) {
    state = state.map((itemState) {
      final updatedMenuDescripcion = itemState.menuDescripcion.map((menuItem) {
        if (menuItem.nombre == nombre) {
          return menuItem.copyWith(
            unidadesPedir: (menuItem.unidadesPedir ?? 0) + 1,
          );
        }
        return menuItem;
      }).toList();

      return itemState.copyWith(menuDescripcion: updatedMenuDescripcion);
    }).toList();
  }

  void decrementarUnidades(String nombre) {
    state = state.map((itemState) {
      final updatedMenuDescripcion = itemState.menuDescripcion.map((menuItem) {
        if (menuItem.nombre == nombre) {
          final nuevasUnidades = (menuItem.unidadesPedir ?? 1) - 1;
          if (nuevasUnidades <= 0) return menuItem; // Evita ir a negativo
          return menuItem.copyWith(unidadesPedir: nuevasUnidades);
        }
        return menuItem;
      }).toList();

      return itemState.copyWith(menuDescripcion: updatedMenuDescripcion);
    }).toList();
  }

//

  void actualizarValor() {}

  void limpiarCarrito() {
    state = [];
  }

//
  void eliminarItems(MenuDescripcion item) {
    state = state
        .map((itemState) {
          // Filtra el producto dentro de `menuDescripcion`
          final updatedMenuDescripcion =
              itemState.menuDescripcion.where((menuItem) {
            print('Comparando: ${menuItem.nombre} != ${item.nombre}');
            return menuItem.nombre != item.nombre;
          }).toList();

          // Si la lista `menuDescripcion` está vacía, eliminamos este `ItemState` de la lista.
          if (updatedMenuDescripcion.isEmpty) {
            return null; // Devolvemos `null` para eliminar este ItemState.
          }

          // Retorna un nuevo ItemState con la lista de productos actualizada
          return itemState.copyWith(menuDescripcion: updatedMenuDescripcion);
        })
        .whereType<
            ItemState>() // Filtra los `null`, eliminando los `ItemState` vacíos
        .toList();
  }

  // Contar el número de artículos en el carrito
  int get cantidadTotal {
    return state.length;
  }

/* void cambiarEstado(int id, bool isLoading) {
    state = [
      for (final itemState in state)
        if (itemState.id == id)
          itemState.copyWith(isLoding: isLoading)
        else
          itemState
    ];
} */
  List<MenuDescripcion> _convertirAMenuDescripcion(Items item) {
    return [
      MenuDescripcion(
          nombre: item.nombre,
          descripcion: item.descripcion,
          image: item.image,
          unidades: item.unidades,
          precio: item.precio,
          submenu: null, // O lo que sea relevante aquí
          salsasSeleccionadas: item.salsasSeleccionadas)
    ];
  }
}
