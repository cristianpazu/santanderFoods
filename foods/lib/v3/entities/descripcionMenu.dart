class DescripcionMenu {
  String nombre;
  String descripcion;
  String? image;
  String precio;
  String? unidades;

  int? unidadesPedir;

  DescripcionMenu({
    required this.nombre,
    required this.descripcion,
    this.image,
    required this.precio,
    this.unidades,
    this.unidadesPedir,
  });

  factory DescripcionMenu.fromJson(Map<String, dynamic> json) =>
      DescripcionMenu(
          nombre: json["nombre"],
          descripcion: json["descripcion"],
          precio: json["precio"],
          unidades: json["unidades"],
          image: json["image"],
          unidadesPedir: json["unidadesPedir"]);

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "descripcion": descripcion,
        "precio": precio,
        "image": image,
        "unidades": unidades,
        "unidadesPedir": unidadesPedir
      };

  DescripcionMenu copyWith({
    String? nombre,
    dynamic descripcion,
    String? image,
    String? precio,
    String? unidades,
    int? unidadesPedir,
  }) {
    return DescripcionMenu(
        nombre: nombre ?? this.nombre,
        descripcion: descripcion ?? this.descripcion,
        image: image ?? this.image,
        unidades: unidades ?? this.unidades,
        precio: precio ?? this.precio,
        unidadesPedir: unidadesPedir ?? this.unidadesPedir);
  }
}
