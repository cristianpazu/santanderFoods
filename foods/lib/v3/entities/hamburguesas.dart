import 'package:foods/v2/domain/entities/comidas_rapidas/NombreComidaRapidas.dart';
import 'package:foods/v3/entities/nombreHamburguesas.dart';

class Hamburguesas {
   
    //List<NombreComidaRapida> nombreComidaRapida;
   List<Nombrehamburguesas> nombreComidaRapida;
    Hamburguesas({
     
        required this.nombreComidaRapida,
    });

    factory Hamburguesas.fromJson(Map<String, dynamic> json) => Hamburguesas(

        nombreComidaRapida: List<Nombrehamburguesas>.from(json["nombre_comida_rapida"].map((x) => Nombrehamburguesas.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
      
        "nombre_comida_rapida": List<dynamic>.from(nombreComidaRapida.map((x) => x.toJson())),
    };
}