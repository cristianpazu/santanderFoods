import 'package:foods/v2/domain/entities/restaurantes/MenuDescripcion.dart';

class ItemState {
  
  final bool? isLoding;
  final int? id;
  List<MenuDescripcion> menuDescripcion;

   ItemState({
  required this.id,
       this.isLoding = false,
    this.menuDescripcion = const [], 
    });

    ItemState copyWith({
      int? id,
  bool? isLoding,
  List<MenuDescripcion>? menuDescripcion,
}) => ItemState(
id: id ?? this.id,
  isLoding: isLoding ?? this.isLoding,
  menuDescripcion: menuDescripcion ?? this.menuDescripcion
);
}