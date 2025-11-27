import 'package:foods/v3/entities/items.dart';

class DescripcionMenu {
  int? id;
  String nombre;
  String descripcion;
  String? image;
  String precio;
  String? unidades;

  int? unidadesPedir;

  DescripcionMenu({
    this.id,
    required this.nombre,
    required this.descripcion,
    this.image,
    required this.precio,
    this.unidades,
    this.unidadesPedir,
  });

  factory DescripcionMenu.fromJson(Map<String, dynamic> json) =>
      DescripcionMenu(
        id: json["id"],
          nombre: json["nombre"],
          descripcion: json["descripcion"],
          precio: json["precio"],
          unidades: json["unidades"],
          image: json["image"],
          unidadesPedir: json["unidadesPedir"]);

  Map<String, dynamic> toJson() => {
    "id":id,
        "nombre": nombre,
        "descripcion": descripcion,
        "precio": precio,
        "image": image,
        "unidades": unidades,
        "unidadesPedir": unidadesPedir
      };


 factory DescripcionMenu.fromItems(Items item) {
  return DescripcionMenu(
    id: item.id,
    nombre: item.nombre!,
    descripcion: item.descripcion,
    image: item.image,
    unidades: item.unidades,
    precio: item.precio!,
  
    unidadesPedir: 1, // por defecto al agregar al carrito
  
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
  }) {
    return DescripcionMenu(
      id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        descripcion: descripcion ?? this.descripcion,
        image: image ?? this.image,
        unidades: unidades ?? this.unidades,
        precio: precio ?? this.precio,
        unidadesPedir: unidadesPedir ?? this.unidadesPedir);
  }
}
