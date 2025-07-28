import 'package:foods/v2/domain/entities/categorias/categoria.dart';
import 'package:foods/v2/domain/entities/restaurantes/Horario.dart';
import 'package:foods/v2/domain/entities/restaurantes/Menu.dart';

class NombreComidaRapida {
    int id;
    String? nombres;
    String image;
    String direccion;
    String contacto;
    Categoria categorias;
    List<Horario> horario;
    List<Menu> menu;
    String? nombre;

    NombreComidaRapida({
        required this.id,
        this.nombres,
        required this.image,
        required this.direccion,
        required this.contacto,
        required this.categorias,
        required this.horario,
        required this.menu,
        this.nombre,
    });

    


factory NombreComidaRapida.fromJson(Map<String, dynamic> json) => NombreComidaRapida(
    id: json["id"],
    nombres: json["nombres"],
    image: json["image"],
    direccion: json["direccion"],
    contacto: json["contacto"],
    categorias: Categoria.fromJson(json["CATEGORIAS"]),
    horario: json["horario"] != null
        ? List<Horario>.from(json["horario"].map((x) => Horario.fromJson(x)))
        : [],
    menu: json["menu"] != null
        ? List<Menu>.from(json["menu"].map((x) => Menu.fromJson(x)))
        : [],
    nombre: json["nombre"],
);












    Map<String, dynamic> toJson() => {
        "id": id,
        "nombres": nombres,
        "image": image,
        "direccion": direccion,
        "contacto": contacto,
        "CATEGORIAS": categorias.toJson(),
        "horario": List<dynamic>.from(horario.map((x) => x.toJson())),
        "menu": List<dynamic>.from(menu.map((x) => x.toJson())),
        "nombre": nombre,
    };
}