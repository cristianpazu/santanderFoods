
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/v3/entities/descripcionMenu.dart';
import 'package:foods/v3/entities/items.dart';
import 'package:foods/v3/presentation/notifiers/items_notifiers/item_state.dart';

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
  bool existe = state.any((item) => item.descripcionMenu.first.nombre == nuevoItem.nombre);
  if (existe) return false;

  final nuevoEstado = ItemState(
    id: restauranteId,
    descripcionMenu: [DescripcionMenu.fromItems(nuevoItem)],
  );

  state = [...state, nuevoEstado];
  return true;
}


  void incrementarUnidades(String nombre) {
    state = state.map((itemState) {
      final updatedMenuDescripcion = itemState.descripcionMenu.map((menuItem) {
        if (menuItem.nombre == nombre) {
          return menuItem.copyWith(
            unidadesPedir: (menuItem.unidadesPedir ?? 0) + 1,
          );
        }
        return menuItem;
      }).toList();

      return itemState.copyWith(descripcionMenu: updatedMenuDescripcion);
    }).toList();
  }

  void decrementarUnidades(String nombre) {
    state = state.map((itemState) {
      final updatedMenuDescripcion = itemState.descripcionMenu.map((menuItem) {
        if (menuItem.nombre == nombre) {
          final nuevasUnidades = (menuItem.unidadesPedir ?? 1) - 1;
          if (nuevasUnidades <= 0) return menuItem; // Evita ir a negativo
          return menuItem.copyWith(unidadesPedir: nuevasUnidades);
        }
        return menuItem;
      }).toList();

      return itemState.copyWith(descripcionMenu: updatedMenuDescripcion);
    }).toList();
  }

//

void incrementarUnidades3(String nombre) {

  state = state.map((itemState) {
    return itemState.copyWith(
      descripcionMenu: itemState.descripcionMenu.map((menuItem) {
        if (menuItem.nombre == nombre) {
          final actual = menuItem.unidadesPedir ?? 0;

          return menuItem.copyWith(
            unidadesPedir: actual + 1,
          );
        }
        return menuItem;
      }).toList(),
    );
  }).toList();
}


void decrementarUnidades3(String nombre) {

  print('0||| $nombre');
  state = state.map((itemState) {
  print('0||| entre aqui');

    return itemState.copyWith(
      descripcionMenu: itemState.descripcionMenu.map((menuItem) {
        if (menuItem.nombre == nombre) {
          final actual = menuItem.unidadesPedir ?? 1;

          return menuItem.copyWith(
            unidadesPedir: actual > 1 ? actual - 1 : 1,
          );
        }
        return menuItem;
      }).toList(),
    );
  }).toList();
}

  void actualizarValor() {}

  void limpiarCarrito() {
    state = [];
  }

//
  void eliminarItems(DescripcionMenu item) {
    state = state
        .map((itemState) {
          // Filtra el producto dentro de `menuDescripcion`
          final updatedMenuDescripcion =
              itemState.descripcionMenu.where((menuItem) {
            print('Comparando: ${menuItem.nombre} != ${item.nombre}');
            return menuItem.nombre != item.nombre;
          }).toList();

          // Si la lista `menuDescripcion` está vacía, eliminamos este `ItemState` de la lista.
          if (updatedMenuDescripcion.isEmpty) {
            return null; // Devolvemos `null` para eliminar este ItemState.
          }

          // Retorna un nuevo ItemState con la lista de productos actualizada
          return itemState.copyWith(descripcionMenu: updatedMenuDescripcion);
        })
        .whereType<
            ItemState>() // Filtra los `null`, eliminando los `ItemState` vacíos
        .toList();
  }

  // Contar el número de artículos en el carrito
  int get cantidadTotal {
    return state.length;
  }

  List<DescripcionMenu> _convertirAMenuDescripcion(Items item) {
    return [
      DescripcionMenu(
          nombre: item.nombre!,
          descripcion: item.descripcion,
          image: item.image,
          unidades: item.unidades,
          precio: item.precio!,
       )
    ];
  }
  //

  
  void incrementarUnidades2(int id) {
    if (state.isEmpty) {
    print('⚠️ state vacío, no se puede incrementar');
    return;
  }
    state = state.map((itemState) {
          print('asdasda $itemState');
      final updatedMenuDescripcion = itemState.descripcionMenu.map((menuItem) {
           print('asdasda ${menuItem.id}');
        if (menuItem.id == id) {
           print('asdasdazzzzzzzzzz ${menuItem.id}');
          return menuItem.copyWith(
            unidadesPedir: (menuItem.unidadesPedir ?? 0) + 1,
          );
        }  print('asdasda ${state}');
        return menuItem;
      }).toList();

      return itemState.copyWith(descripcionMenu: updatedMenuDescripcion);
    }).toList();
  }

  void decrementarUnidades2(int id) {
    state = state.map((itemState) {
      final updatedMenuDescripcion = itemState.descripcionMenu.map((menuItem) {
        if (menuItem.id == id) {
          final nuevasUnidades = (menuItem.unidadesPedir ?? 1) - 1;
          if (nuevasUnidades <= 0) return menuItem; // Evita ir a negativo
          return menuItem.copyWith(unidadesPedir: nuevasUnidades);
        }
        return menuItem;
      }).toList();

      return itemState.copyWith(descripcionMenu: updatedMenuDescripcion);
    }).toList();
  }
}