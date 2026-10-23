import 'package:foods/v3.1/entities/Restaurantes/SubMenuCompletoResponseDTO.dart' show Submenucompletoresponsedto;

class Menucompletoresponsedto {
   final int idMenu;
  final String nombreMenu;
  final bool activo;
  final List<Submenucompletoresponsedto> submenus;

  Menucompletoresponsedto({
    required this.idMenu,
    required this.nombreMenu,
    required this.activo,
    required this.submenus,
  });

  factory Menucompletoresponsedto.fromJson(
    Map<String, dynamic> json,
  ) {
    return Menucompletoresponsedto(
      idMenu: json['idMenu'] ?? '',
      nombreMenu: json['nombreMenu'] ?? '',
      activo: json['activo'] ?? false,
      submenus: (json['submenus'] as List<dynamic>? ?? [])
          .map((e) => Submenucompletoresponsedto.fromJson(
                e as Map<String, dynamic>,
              ))
          .toList(),
    );
  }
}