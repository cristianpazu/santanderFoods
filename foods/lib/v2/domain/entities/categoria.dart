class Categoria {
 final int id;
 final String nombreCategoria;
 final String image;

 Categoria({
  required this.id,
  required this.nombreCategoria,
  required this.image
 });

 factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
  id: json["id"] ?? 0, 
  nombreCategoria: json["nombre_categoria"] ?? "", 
  image: json["image"] ?? "" );

  Map<String, dynamic> toJson() =>{
    "id":id,
    "nombre_Categoria": nombreCategoria,
    "image": image,
  };

  Categoria copyWith(
    {
     int? id, 
    String? nombreCategoria, 
    String? image

    }
  )=> Categoria(
    id: id ??  this.id, 
    nombreCategoria: nombreCategoria ?? this.nombreCategoria, image: image ?? this.image);

 @override
  String toString() {
    return 'Categoria(id: $id, nombreCategoria: $nombreCategoria, image: $image)';
  }

}