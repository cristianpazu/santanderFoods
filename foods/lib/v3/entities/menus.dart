import 'package:foods/v3/entities/descripcionMenu.dart';

class Menus {
    String? submenu;
    List<DescripcionMenu>? descripcion;
    

    Menus({
        this.submenu,
        this.descripcion,
    });

    factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        submenu: json["submenu"],
         descripcion: json["descripcion"] == null
      ? []
      : List<DescripcionMenu>.from(json["descripcion"]!.map((x) => DescripcionMenu.fromJson(x))),
);

    Map<String, dynamic> toJson() => {
        "submenu": submenu,
        "descripcion": descripcion == null ? [] : List<dynamic>.from(descripcion!.map((x) => x.toJson())),
        
    };
      @override
  String toString() {
    return 'Menu(submenu: $submenu, descripcion: $descripcion)';
  }
}