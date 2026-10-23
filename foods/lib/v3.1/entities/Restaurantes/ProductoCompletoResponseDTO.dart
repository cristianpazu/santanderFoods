class Productocompletoresponsedto {
  final int? id;
  final String? nombre;
  final String? descripcion;
  final int? precio;
  final bool activo;

Productocompletoresponsedto({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.activo,
  });

  factory Productocompletoresponsedto.fromJson(
    Map<String, dynamic> json,
  ) {
    return Productocompletoresponsedto(
      id: json['id'],
      nombre: json['nombre'] ?? '',
      descripcion: json['descripcion'] ?? '',
      precio: json['precio'] ?? '',
      activo: json['activo'] ?? false,
    );
  }

}