import 'package:foods/v2/domain/entities/comidas_rapidas/Salsa.dart';

class DescripcionComidaRapida {
    String nombre;
    String descripcion;
    String? image;
    String precio;
     String? unidades;
    List<Salsa>? salsas;
   int? unidadesPedir;


    DescripcionComidaRapida({
        required this.nombre,
        required this.descripcion,
        this.image,
        required this.precio,
        this.salsas,
             this.unidades,
this.unidadesPedir,
    });

    factory DescripcionComidaRapida.fromJson(Map<String, dynamic> json) => DescripcionComidaRapida(
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        precio: json["precio"],
         unidades: json["unidades"],
        image: json["image"],
        salsas: json["salsas"] == null ? [] : List<Salsa>.from(json["salsas"]!.map((x) => Salsa.fromJson(x))),
         unidadesPedir: json["unidadesPedir"]
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "descripcion": descripcion,
        "precio": precio,
        "image":image,
        "unidades": unidades,
        "salsas": salsas == null ? [] : List<dynamic>.from(salsas!.map((x) => x.toJson())),
          "unidadesPedir": unidadesPedir
    };


      DescripcionComidaRapida copyWith({
String? nombre,
    dynamic descripcion,
    String? image,
    String? precio,
    String? unidades,
 
    List<Salsa>? salsas,
    int? unidadesPedir,
    }) {
return DescripcionComidaRapida(
   nombre: nombre ?? this.nombre,
        descripcion: descripcion ?? this.descripcion,
        image: image ?? this.image,
        unidades: unidades ?? this.unidades,
        precio: precio ?? this.precio,
        salsas: salsas ?? this.salsas,
        unidadesPedir: unidadesPedir ?? this.unidadesPedir
);
    }
}