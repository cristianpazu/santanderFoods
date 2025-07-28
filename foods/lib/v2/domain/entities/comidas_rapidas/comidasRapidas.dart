import 'package:foods/v2/domain/entities/comidas_rapidas/NombreComidaRapidas.dart';

class ComidaRapidas {
    String nombre;
    List<NombreComidaRapida> nombreComidaRapida;

    ComidaRapidas({
        required this.nombre,
        required this.nombreComidaRapida,
    });

    factory ComidaRapidas.fromJson(Map<String, dynamic> json) => ComidaRapidas(
        nombre: json["nombre"],
        nombreComidaRapida: List<NombreComidaRapida>.from(json["nombre_comida_rapida"].map((x) => NombreComidaRapida.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "nombre_comida_rapida": List<dynamic>.from(nombreComidaRapida.map((x) => x.toJson())),
    };
}