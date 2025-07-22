class MenuDescripcion {
    String? nombre;
    dynamic descripcion;
    String? image;
    String? unidades;
    String? precio;
 
    String? submenu;
    int? unidadesPedir;

    MenuDescripcion({
        this.nombre,
        required this.descripcion,
        this.image,
        this.unidades,
        this.precio,
   
        this.submenu,
        this.unidadesPedir,
    });

    factory MenuDescripcion.fromJson(Map<String, dynamic> json) => MenuDescripcion(
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        image: json["image"],
        unidades: json["unidades"],
        precio: json["precio"],
        submenu: json["submenu"],
        unidadesPedir: json["unidadesPedir"]
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "descripcion": descripcion,
        "image": image,
        "unidades": unidades,
        "precio": precio,
        "submenu": submenu,
        "unidadesPedir": unidadesPedir
    };

    MenuDescripcion copyWith({
String? nombre,
    dynamic descripcion,
    String? image,
    String? unidades,
    String? precio,
 
    String? submenu,
    int? unidadesPedir,
    }) {
return MenuDescripcion(
   nombre: nombre ?? this.nombre,
        descripcion: descripcion ?? this.descripcion,
        image: image ?? this.image,
        unidades: unidades ?? this.unidades,
        precio: precio ?? this.precio,
        submenu: submenu ?? this.submenu,
        unidadesPedir: unidadesPedir ?? this.unidadesPedir
);
    }


     @override
  String toString() {
    return 'MenuDescripcion(nombre: $nombre, descripcion: $descripcion, image: $image, unidades: $unidades, precio: $precio, submenu: $submenu)';
  }
}
