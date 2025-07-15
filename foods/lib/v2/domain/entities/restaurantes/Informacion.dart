

import 'package:foods/v2/domain/entities/restaurantes/Horario.dart';
import 'package:foods/v2/domain/entities/restaurantes/Menu.dart';

class Informacion {
    String nombre;
    String direccion;
    String contacto;
    List<Horario> horario;
    List<Menu> menu;

    Informacion({
        required this.nombre,
        required this.direccion,
        required this.contacto,
        required this.horario,
        required this.menu,
    });

    factory Informacion.fromJson(Map<String, dynamic> json) => Informacion(
        nombre: json["nombre"],
        direccion: json["direccion"],
        contacto: json["contacto"],
        horario: List<Horario>.from(json["horario"].map((x) => Horario.fromJson(x))),
        menu: List<Menu>.from(json["menu"].map((x) => Menu.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "direccion": direccion,
        "contacto": contacto,
        "horario": List<dynamic>.from(horario.map((x) => x.toJson())),
        "menu": List<dynamic>.from(menu.map((x) => x.toJson())),
    };
}