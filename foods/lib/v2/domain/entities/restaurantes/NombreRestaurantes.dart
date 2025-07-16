
import 'package:foods/v2/domain/entities/restaurantes/Informacion.dart';

class NombreRestaurante {
    int id;
    String nombres;
    String image;
    List<Informacion> informacion;

    NombreRestaurante({
        required this.id,
        required this.nombres,
        required this.image,
        required this.informacion,
    });

    factory NombreRestaurante.fromJson(Map<String, dynamic> json) => NombreRestaurante(
        id: json["id"],
        nombres: json["nombres"],
        image: json["image"],
      informacion: json["informacion"] == null
      ? []
      : List<Informacion>.from(json["informacion"].map((x) => Informacion.fromJson(x))),
);
   

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombres": nombres,
        "image": image,
        "informacion": List<dynamic>.from(informacion.map((x) => x.toJson())),
    };

    @override
String toString() {
  return 'NombreRestaurante(id: $id, nombres: $nombres, image: $image)';
}
}
