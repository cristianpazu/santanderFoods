class Salsa {
    int id;
    String nombre;

    Salsa({
        required this.id,
        required this.nombre,
    });

    factory Salsa.fromJson(Map<String, dynamic> json) => Salsa(
        id: json["id"],
        nombre:json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
    };
}