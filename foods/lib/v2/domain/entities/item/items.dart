class Items {
   int? id;
  String? nombre;
  dynamic descripcion;
  String? image;
  String? unidades;
  String? precio;
  int? unidadesPedir;
   List<String>? salsasSeleccionadas;

  Items({
    this.id,
    this.nombre,
    required this.descripcion,
    this.image,
    this.unidades,
    this.precio,
    this.unidadesPedir,
     this.salsasSeleccionadas,
  });

  factory Items.fromJson(Map<String, dynamic> json) => Items(
    id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        image: json["image"],
        unidades: json["unidades"],
        precio: json["precio"],
        unidadesPedir: json["unidadesPedir"],
        salsasSeleccionadas: json["salsasSeleccionadas"] != null
            ? List<String>.from(json["salsasSeleccionadas"])
            : null,
      );

  Map<String, dynamic> toJson() => {
      "id":id,
        "nombre": nombre,
        "descripcion": descripcion,
        "image": image,
        "unidades": unidades,
        "precio": precio,
        "unidadesPedir": unidadesPedir,
          "salsasSeleccionadas": salsasSeleccionadas,
      };


       Items copyWith({
        int? id,
    String? nombre,
    dynamic descripcion,
    String? image,
    String? unidades,
    String? precio,
  
    int? unidadesPedir,
    List<String>? salsasSeleccionadas,
  }) {
    return Items(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      descripcion: descripcion ?? this.descripcion,
      image: image ?? this.image,
      unidades: unidades ?? this.unidades,
      precio: precio ?? this.precio,

      unidadesPedir: unidadesPedir ?? this.unidadesPedir,
      salsasSeleccionadas: salsasSeleccionadas ?? this.salsasSeleccionadas,
    );
  }


  @override
  String toString() {
    return 'MenuDescripcion(id: $id,  nombre: $nombre, descripcion: $descripcion,salsasSeleccionadas: $salsasSeleccionadas, image: $image, unidades: $unidades, precio: $precio)';
  }
}
