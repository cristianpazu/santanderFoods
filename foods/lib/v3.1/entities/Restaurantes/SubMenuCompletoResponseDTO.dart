import 'package:foods/v3.1/entities/Restaurantes/ProductoCompletoResponseDTO.dart' show Productocompletoresponsedto;

class Submenucompletoresponsedto {
  final int idSubmenu;
  final String nombre;
  final bool activo;
  final List<Productocompletoresponsedto> productos;

  Submenucompletoresponsedto({
   required this.idSubmenu,
   required this.nombre,
   required this.activo,
   required this.productos,
  });

  factory Submenucompletoresponsedto.fromJson(
    Map<String, dynamic> json,
  ) {
    return Submenucompletoresponsedto(
      idSubmenu: json['idSubmenu'] ?? '',
      nombre: json['nombre'] ?? '',
      activo: json['activo'] ?? false,
      productos: (json['productos'] as List<dynamic>? ?? [])
          .map((e) => Productocompletoresponsedto.fromJson(
                e as Map<String, dynamic>,
              ))
          .toList(),
    );
  }
}