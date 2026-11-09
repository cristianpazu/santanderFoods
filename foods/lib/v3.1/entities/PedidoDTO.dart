import 'package:foods/v3.1/entities/PedidoItemDTO.dart';

class PedidoDTO {
  int restauranteId;
  String nombreCliente;
  String telefonoCliente;
  String direccionEntrega;
  String metodoPago;
  List<PedidoItemDTO> items;

  PedidoDTO({
    required this.restauranteId,
    required this.nombreCliente,
    required this.telefonoCliente,
    required this.direccionEntrega,
    required this.metodoPago,
    required this.items,
  });

  Map<String, dynamic> toJson() => {
    "restauranteId": restauranteId,
    "nombreCliente": nombreCliente,
    "telefonoCliente": telefonoCliente,
    "direccionEntrega": direccionEntrega,
    "metodoPago": metodoPago,
    "items": items.map((item) => item?.toJson()).toList(),
  };
}
