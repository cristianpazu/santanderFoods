
import 'package:foods/v3.1/entities/descripcionPedidoMenu.dart' show DescripcionPedidoMenu;
import 'package:foods/v3/entities/descripcionMenu.dart';

class ItemPedidoState {
  
  final bool? isLoding;
  final int? id;
  List<DescripcionPedidoMenu> descripcionMenu;

   ItemPedidoState({
  required this.id,
       this.isLoding = false,
    this.descripcionMenu = const [], 
    });

    ItemPedidoState copyWith({
      int? id,
  bool? isLoding,
  List<DescripcionPedidoMenu>? descripcionMenu,
}) => ItemPedidoState(
id: id ?? this.id,
  isLoding: isLoding ?? this.isLoding,
  descripcionMenu: descripcionMenu ?? this.descripcionMenu
);
}