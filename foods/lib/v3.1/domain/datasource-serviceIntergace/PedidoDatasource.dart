

import 'package:foods/v3.1/entities/PedidoDTO.dart';

abstract class Pedidodatasource {

  Future<void> registrarPedido(PedidoDTO pedidoDto);

}