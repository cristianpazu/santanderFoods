import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/v2/domain/entities/item/items.dart';
import 'package:foods/v2/domain/entities/restaurantes/MenuDescripcion.dart';
import 'package:foods/v2/presentation/notifiers/items_notifiers/item_state.dart';


final itemsStateNotifier = StateNotifierProvider<ItemStateNotifiers, List<ItemState>>(
   (ref) => ItemStateNotifiers(),
);


class ItemStateNotifiers extends StateNotifier<List<ItemState>> { 

ItemStateNotifiers(): super([]);

void agregarItems(Items item){
print('dsadasdas $item');
state = [
  ...state,
 ItemState(
  //id: item.id!
 isLoding: false, menuDescripcion:_convertirAMenuDescripcion(item) )
];

 
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
      )
    ];
  }

 }