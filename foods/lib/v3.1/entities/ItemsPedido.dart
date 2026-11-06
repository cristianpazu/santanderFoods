import 'package:foods/v2/domain/entities/comidas_rapidas/Salsa.dart';

class ItemsPedido {
   int? id;
  String? nombre;
  dynamic descripcion;
  String? image;
  int? unidades;
  int? precio;
  int? unidadesPedir;
    List<Salsa>? salsas;

  ItemsPedido({
    this.id,
    this.nombre,
    required this.descripcion,
    this.image,
    this.unidades,
    this.precio,
    this.unidadesPedir,
   this.salsas
  });

  factory ItemsPedido.fromJson(Map<String, dynamic> json) => ItemsPedido(
    id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        image: json["image"],
        unidades: json["unidades"],
        precio: json["precio"],
        unidadesPedir: json["unidadesPedir"],
        salsas: json["salsas"] == null ? [] : List<Salsa>.from(json["salsas"]!.map((x) => Salsa.fromJson(x))),
     
      );

  Map<String, dynamic> toJson() => {
      "id":id,
        "nombre": nombre,
        "descripcion": descripcion,
        "image": image,
        "unidades": unidades,
        "precio": precio,
        "unidadesPedir": unidadesPedir,
         "salsas": salsas == null ? [] : List<dynamic>.from(salsas!.map((x) => x.toJson())),
         
      };


       ItemsPedido copyWith({
        int? id,
    String? nombre,
    dynamic descripcion,
    String? image,
    int? unidades,
    int? precio,
  
    int? unidadesPedir,
   List<String>? salsasSeleccionadas,
  }) {
    return ItemsPedido(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      descripcion: descripcion ?? this.descripcion,
      image: image ?? this.image,
      unidades: unidades ?? this.unidades,
      precio: precio ?? this.precio,

      unidadesPedir: unidadesPedir ?? this.unidadesPedir,
   salsas: salsas ?? this.salsas
    );
  }


  @override
  String toString() {
    return 'MenuDescripcion(id: $id,  nombre: $nombre, descripcion: $descripcion, image: $image, unidades: $unidades, precio: $precio, salsas: $salsas)';
  }
}
