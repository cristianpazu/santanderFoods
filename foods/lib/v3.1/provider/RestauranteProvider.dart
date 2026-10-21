
import 'package:flutter_riverpod/flutter_riverpod.dart' show Provider;

final restauranteProvider = Provider<Re>((ref) {
  final pedidoRepository = PedidoRepositoryController(Pedidoserviceimpl());

  return pedidoRepository;
});