import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/v3.1/domain/repositories/PedidoRepositories.dart';
import 'package:foods/v3.1/infrastructure/REPOSITORY-CONTROLLER/pedido_repository_controller.dart';
import 'package:foods/v3.1/infrastructure/datasource-ServiceIMPL/PedidoIMPL.dart';

final pedidoProvider = Provider<Pedidorepositories>((ref) {
   final pedidoRepository =  PedidoRepositoryController(Pedidoimpl());
  return pedidoRepository;
 });  