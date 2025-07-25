import 'package:foods/v2/domain/entities/restaurantes/MenuDescripcion.dart';

class ItemState {
  
  final bool? isLoding;
  List<MenuDescripcion> menuDescripcion;

   ItemState({
   
       this.isLoding = false,
    this.menuDescripcion = const [], 
    });

    ItemState copyWith({
  bool? isLoding,
  List<MenuDescripcion>? menuDescripcion,
}) => ItemState(

  isLoding: isLoding ?? this.isLoding,
  menuDescripcion: menuDescripcion ?? this.menuDescripcion
);
}