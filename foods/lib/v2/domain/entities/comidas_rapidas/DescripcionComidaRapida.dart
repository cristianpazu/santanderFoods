import 'package:foods/v2/domain/entities/comidas_rapidas/Salsa.dart';

class DescripcionComidaRapida {
    String nombre;
    String descripcion;
    String? image;
    String precio;
    List<Salsa>? salsas;

    DescripcionComidaRapida({
        required this.nombre,
        required this.descripcion,
        this.image,
        required this.precio,
        this.salsas,
    });

    factory DescripcionComidaRapida.fromJson(Map<String, dynamic> json) => DescripcionComidaRapida(
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        image: json["image"],
        salsas: json["salsas"] == null ? [] : List<Salsa>.from(json["salsas"]!.map((x) => Salsa.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "descripcion": descripcion,
        "precio": precio,
        "image":image,
        "salsas": salsas == null ? [] : List<dynamic>.from(salsas!.map((x) => x.toJson())),
    };
}