class Items {
  int? id;
  String? nombre;
  dynamic descripcion;
  String? image;
  String? unidades;
  String? precio;

  Items({
    this.id,
    this.nombre,
    required this.descripcion,
    this.image,
    this.unidades,
    this.precio,
  });

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        image: json["image"],
        unidades: json["unidades"],
        precio: json["precio"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "image": image,
        "unidades": unidades,
        "precio": precio,
      };
  @override
  String toString() {
    return 'MenuDescripcion(nombre: $nombre, descripcion: $descripcion, image: $image, unidades: $unidades, precio: $precio)';
  }
}
