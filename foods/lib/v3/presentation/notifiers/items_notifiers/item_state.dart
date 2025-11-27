
import 'package:foods/v3/entities/descripcionMenu.dart';

class ItemState {
  
  final bool? isLoding;
  final int? id;
  List<DescripcionMenu> descripcionMenu;

   ItemState({
  required this.id,
       this.isLoding = false,
    this.descripcionMenu = const [], 
    });

    ItemState copyWith({
      int? id,
  bool? isLoding,
  List<DescripcionMenu>? descripcionMenu,
}) => ItemState(
id: id ?? this.id,
  isLoding: isLoding ?? this.isLoding,
  descripcionMenu: descripcionMenu ?? this.descripcionMenu
);
}