
import 'package:foods/v2/domain/entities/restaurantes/NombreRestaurantes.dart';

class Restaurantes {
    String? nombre;
    List<NombreRestaurante>? nombreRestaurantes;

    Restaurantes({
         this.nombre,
         this.nombreRestaurantes,
 } );

    factory Restaurantes.fromJson(Map<String, dynamic> json) => Restaurantes(
        nombre: json["nombre"],
        nombreRestaurantes: List<NombreRestaurante>.from(json["nombre_restaurantes"].map((x) => NombreRestaurante.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "nombre_restaurantes": List<dynamic>.from(nombreRestaurantes!.map((x) => x.toJson())),
    };


    Restaurantes copyWith(
    {
     String? nombre,
    List<NombreRestaurante>? nombreRestaurantes,
    }
  )=> Restaurantes(
    nombre: nombre ??  this.nombre, 
    nombreRestaurantes: nombreRestaurantes ?? this.nombreRestaurantes);
}