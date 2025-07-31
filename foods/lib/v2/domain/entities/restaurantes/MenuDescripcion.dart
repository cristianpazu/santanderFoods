import 'package:foods/v2/domain/entities/item/items.dart';

class MenuDescripcion {
  int? id;
  String? nombre;
  dynamic descripcion;
  String? image;
  String? unidades;
  String? precio;

  String? submenu;
  int? unidadesPedir;
  List<String>? salsasSeleccionadas;

  MenuDescripcion(
      {this.id,
      this.nombre,
      required this.descripcion,
      this.image,
      this.unidades,
      this.precio,
      this.submenu,
      this.unidadesPedir,
      this.salsasSeleccionadas});

  factory MenuDescripcion.fromJson(Map<String, dynamic> json) =>
      MenuDescripcion(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        image: json["image"],
        unidades: json["unidades"],
        precio: json["precio"],
        submenu: json["submenu"],
        unidadesPedir: json["unidadesPedir"],
        salsasSeleccionadas: json["salsasSeleccionadas"] == null
            ? null
            : List<String>.from(json["salsasSeleccionadas"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "image": image,
        "unidades": unidades,
        "precio": precio,
        "submenu": submenu,
        "unidadesPedir": unidadesPedir,
        "salsasSeleccionadas": salsasSeleccionadas,
      };

      factory MenuDescripcion.fromItems(Items item) {
  return MenuDescripcion(
    nombre: item.nombre,
    descripcion: item.descripcion,
    image: item.image,
    unidades: item.unidades,
    precio: item.precio,
    submenu: null, // o item.submenu si existe
    unidadesPedir: 1, // por defecto al agregar al carrito
    salsasSeleccionadas: item.salsasSeleccionadas ?? [],
  );
}

  MenuDescripcion copyWith({
    int? id,
    String? nombre,
    dynamic descripcion,
    String? image,
    String? unidades,
    String? precio,
    String? submenu,
    int? unidadesPedir,
    List<String>? salsasSeleccionadas,
  }) {
    return MenuDescripcion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      descripcion: descripcion ?? this.descripcion,
      image: image ?? this.image,
      unidades: unidades ?? this.unidades,
      precio: precio ?? this.precio,
      submenu: submenu ?? this.submenu,
      unidadesPedir: unidadesPedir ?? this.unidadesPedir,
      salsasSeleccionadas: salsasSeleccionadas ?? this.salsasSeleccionadas,
    );
  }

  @override
  String toString() {
    return 'MenuDescripcion(nombre: $nombre, descripcion: $descripcion, image: $image, unidades: $unidades, precio: $precio, submenu: $submenu, salsasSeleccionadas: $salsasSeleccionadas)';
  }
}
