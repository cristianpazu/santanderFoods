import 'package:foods/v2/domain/entities/comidas_rapidas/DescripcionComidaRapida.dart';

class Menu {
    String submenu;
    List<DescripcionComidaRapida> descripcion;

    Menu({
        required this.submenu,
        required this.descripcion,
    });

    factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        submenu: json["submenu"],
        descripcion: List<DescripcionComidaRapida>.from(json["descripcion"].map((x) => DescripcionComidaRapida.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "submenu": submenu,
        "descripcion": List<dynamic>.from(descripcion.map((x) => x.toJson())),
    };
}