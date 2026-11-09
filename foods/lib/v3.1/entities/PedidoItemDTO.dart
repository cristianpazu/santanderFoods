class PedidoItemDTO {
  int productoId;
  int cantidad;

  PedidoItemDTO({
    required this.productoId,
    required this.cantidad,
  });

  Map<String, dynamic> toJson() => {
    "productoId": productoId,
    "cantidad": cantidad,
  };
}