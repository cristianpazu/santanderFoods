
import 'package:foods/v3.1/domain/repositories/PedidoRepositories.dart';
import 'package:foods/v3.1/entities/PedidoDTO.dart';
import 'package:foods/v3.1/infrastructure/datasource-ServiceIMPL/PedidoIMPL.dart';

class PedidoRepositoryController implements Pedidorepositories {

  Pedidoimpl pedidoimpl;

 PedidoRepositoryController(this.pedidoimpl);

  @override
  Future<void> registrarPedido(PedidoDTO pedidoDto) {
    return pedidoimpl.registrarPedido(pedidoDto);
  }


}