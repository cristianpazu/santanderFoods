

import 'package:foods/v3.1/entities/PedidoDTO.dart';

abstract class Pedidorepositories {
    Future<void> registrarPedido(PedidoDTO pedidoDto);
}