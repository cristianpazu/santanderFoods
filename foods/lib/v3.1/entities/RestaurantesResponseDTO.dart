class Restaurantesresponsedto {

    final int idRestaurante;
    final String nombre;
    final String direccion;
    final String telefono;
    final bool activo;


    Restaurantesresponsedto({
    
       required this.idRestaurante,
       required this.nombre,
       required this.direccion,
       required this.telefono,
       required this.activo,
    });
    factory Restaurantesresponsedto.fromJson(Map<String, dynamic> json){

      return Restaurantesresponsedto(
        idRestaurante: json['idRestaurante'],
        nombre: json['nombre'],
        direccion: json['direccion'],
        telefono: json['telefono'],
        activo: json['activo'],
      );

    }



}