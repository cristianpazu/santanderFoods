
import 'package:foods/v3/entities/NombreComidaRapida2.dart';


class ComidaRapidas2 {
   
    //List<NombreComidaRapida> nombreComidaRapida;
   List<NombreComidaRapida2> nombreComidaRapida;
    ComidaRapidas2({
     
        required this.nombreComidaRapida,
    });

    factory ComidaRapidas2.fromJson(Map<String, dynamic> json) => ComidaRapidas2(

        nombreComidaRapida: List<NombreComidaRapida2>.from(json["nombre_comida_rapida"].map((x) => NombreComidaRapida2.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
      
        "nombre_comida_rapida": List<dynamic>.from(nombreComidaRapida.map((x) => x.toJson())),
    };
}