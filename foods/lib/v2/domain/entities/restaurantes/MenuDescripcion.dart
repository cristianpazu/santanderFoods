class MenuDescripcion {
    String? nombre;
    dynamic descripcion;
    String? image;
    String? unidades;
    String? precio;
 
    String? submenu;

    MenuDescripcion({
        this.nombre,
        required this.descripcion,
        this.image,
        this.unidades,
        this.precio,
   
        this.submenu,
    });

    factory MenuDescripcion.fromJson(Map<String, dynamic> json) => MenuDescripcion(
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        image: json["image"],
        unidades: json["unidades"],
        precio: json["precio"],
       
        submenu: json["submenu"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "descripcion": descripcion,
        "image": image,
        "unidades": unidades,
        "precio": precio,
  
        "submenu": submenu,
    };
}
