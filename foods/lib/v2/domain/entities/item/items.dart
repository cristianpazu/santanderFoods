class Items {
  String? nombre;
  dynamic descripcion;
  String? image;
  String? unidades;
  String? precio;
  int? unidadesPedir;

  Items({
    this.nombre,
    required this.descripcion,
    this.image,
    this.unidades,
    this.precio,
    this.unidadesPedir
  });

  factory Items.fromJson(Map<String, dynamic> json) => Items(
    
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        image: json["image"],
        unidades: json["unidades"],
        precio: json["precio"],
        unidadesPedir: json["unidadesPedir"]
      );

  Map<String, dynamic> toJson() => {
      
        "nombre": nombre,
        "descripcion": descripcion,
        "image": image,
        "unidades": unidades,
        "precio": precio,
        "unidadesPedir": unidadesPedir,
      };


       Items copyWith({
    String? nombre,
    dynamic descripcion,
    String? image,
    String? unidades,
    String? precio,
  
    int? unidadesPedir,
  }) {
    return Items(
      nombre: nombre ?? this.nombre,
      descripcion: descripcion ?? this.descripcion,
      image: image ?? this.image,
      unidades: unidades ?? this.unidades,
      precio: precio ?? this.precio,

      unidadesPedir: unidadesPedir ?? this.unidadesPedir,
    );
  }


  @override
  String toString() {
    return 'MenuDescripcion(nombre: $nombre, descripcion: $descripcion, image: $image, unidades: $unidades, precio: $precio)';
  }
}
