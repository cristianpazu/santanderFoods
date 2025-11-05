import 'package:foods/v3/entities/menus.dart';

class NombreComidaRapida2 {
  int id;
  String? nombres;
  String image;
  String direccion;
  String contacto;

  List<Menus> menu;

  NombreComidaRapida2({
    required this.id,
    this.nombres,
    required this.image,
    required this.direccion,
    required this.contacto,
    required this.menu,
  });

  factory NombreComidaRapida2.fromJson(Map<String, dynamic> json) =>
      NombreComidaRapida2(
        id: json["id"] ?? 0,
        nombres: json["nombres"],
        image: json["image"],
        direccion: json["direccion"] ?? '',
        contacto: json["contacto"] ?? '',
        menu: json["menu"] != null
            ? List<Menus>.from(json["menu"].map((x) => Menus.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombres": nombres,
        "image": image,
        "direccion": direccion,
        "contacto": contacto,
        "menu": List<dynamic>.from(menu.map((x) => x.toJson())),
      };
}
