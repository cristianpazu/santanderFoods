import 'package:foods/v3.1/entities/Restaurantes/MenuCompletoResponseDTO.dart' show Menucompletoresponsedto;

class Restaurantecompletoresponsedto {
  final int idRestaurante;
  final String nombre;
  final String direccion;
  final String descripcion;
  final String telefono;
  final bool activo;
  final List<Menucompletoresponsedto> menus;

  Restaurantecompletoresponsedto({
    required this.idRestaurante,
    required this.nombre,
    required this.direccion,
    required this.descripcion,
    required this.telefono,
    required this.activo,
    required this.menus,
  });

  factory Restaurantecompletoresponsedto.fromJson(
    Map<String, dynamic> json,
  ) {
    return Restaurantecompletoresponsedto(
      idRestaurante: json['idRestaurante'],
      nombre: json['nombre'] ?? '',
      direccion: json['direccion'] ?? '',
      descripcion: json['descripcion'] ?? '',
      telefono: json['telefono'] ?? '',
      activo: json['activo'] ?? false,
      menus: (json['menus'] as List<dynamic>? ?? [])
          .map((e) => Menucompletoresponsedto.fromJson(
                e as Map<String, dynamic>,
              ))
          .toList(),
    );
  }
}