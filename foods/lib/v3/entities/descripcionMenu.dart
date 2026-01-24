import 'package:foods/v2/domain/entities/comidas_rapidas/Salsa.dart';
import 'package:foods/v3/entities/items.dart';

class DescripcionMenu {
  int? id;
  String nombre;
  String descripcion;
  String? image;
  String precio;
  String? unidades;

  int? unidadesPedir;
   List<Salsa>? salsas;
  DescripcionMenu({
    this.id,
    required this.nombre,
    required this.descripcion,
    this.image,
    required this.precio,
    this.unidades,
    this.unidadesPedir,
      this.salsas
  });

  factory DescripcionMenu.fromJson(Map<String, dynamic> json) =>
      DescripcionMenu(
        id: json["id"],
          nombre: json["nombre"],
          descripcion: json["descripcion"],
          precio: json["precio"],
          unidades: json["unidades"],
          image: json["image"],
          unidadesPedir: json["unidadesPedir"],
                   salsas: json["salsas"] == null ? [] : List<Salsa>.from(json["salsas"]!.map((x) => Salsa.fromJson(x))),);

  Map<String, dynamic> toJson() => {
    "id":id,
        "nombre": nombre,
        "descripcion": descripcion,
        "precio": precio,
        "image": image,
        "unidades": unidades,
        "unidadesPedir": unidadesPedir,
          "salsas": salsas == null ? [] : List<dynamic>.from(salsas!.map((x) => x.toJson())),
      };


 factory DescripcionMenu.fromItems(Items item) {
  return DescripcionMenu(
    id: item.id,
    nombre: item.nombre!,
    descripcion: item.descripcion,
    image: item.image,
    unidades: item.unidades,
    precio: item.precio!,
  
    unidadesPedir: item.unidadesPedir ?? 1, // por defecto al agregar al carrito
  salsas: item.salsas
  );
}


  DescripcionMenu copyWith({
    int? id,
    String? nombre,
    dynamic descripcion,
    String? image,
    String? precio,
    String? unidades,
    int? unidadesPedir,
    List<Salsa>? salsas,
  }) {
    return DescripcionMenu(
      id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        descripcion: descripcion ?? this.descripcion,
        image: image ?? this.image,
        unidades: unidades ?? this.unidades,
        precio: precio ?? this.precio,
        unidadesPedir: unidadesPedir ?? this.unidadesPedir,
       salsas: salsas ?? this.salsas);
  }
}
