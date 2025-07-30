import 'package:foods/v2/domain/entities/comidas_rapidas/DescripcionComidaRapida.dart';

class MenuComidaRapidas {
    String submenu;
    List<DescripcionComidaRapida> descripcion;

    MenuComidaRapidas({
        required this.submenu,
        required this.descripcion,
    });

    factory MenuComidaRapidas.fromJson(Map<String, dynamic> json) => MenuComidaRapidas(
        submenu: json["submenu"],
        descripcion: List<DescripcionComidaRapida>.from(json["descripcion"].map((x) => DescripcionComidaRapida.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "submenu": submenu,
        "descripcion": List<dynamic>.from(descripcion.map((x) => x.toJson())),
    };
}