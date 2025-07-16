
import 'package:foods/v2/domain/entities/restaurantes/MenuDescripcion.dart';

class Menu {
    String? submenu;
    List<MenuDescripcion>? descripcion;
    

    Menu({
        this.submenu,
        this.descripcion,
    });

    factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        submenu: json["submenu"],
         descripcion: json["descripcion"] == null
      ? []
      : List<MenuDescripcion>.from(json["descripcion"]!.map((x) => MenuDescripcion.fromJson(x))),
);

    Map<String, dynamic> toJson() => {
        "submenu": submenu,
        "descripcion": descripcion == null ? [] : List<dynamic>.from(descripcion!.map((x) => x.toJson())),
        
    };
}