import 'package:foods/v3.1/BaseUrl.dart';
import 'package:foods/v3.1/domain/datasource-serviceIntergace/PedidoDatasource.dart';
import 'package:foods/v3.1/entities/PedidoDTO.dart';
import 'package:foods/v3.1/http.dart';


class Pedidoimpl implements Pedidodatasource{
  @override
  Future<void> registrarPedido(PedidoDTO pedidoDto) async{
    try {
      final respuesta = await HttpService(Baseurl.registrarPedido).postRegisterHttp(pedidoDto.toJson());
     print('respuesta>>>>>>>>>>>>><<<<<< ${pedidoDto.toJson()}');
print('respuesta>>>>>>>>>>>>><<<<<< $respuesta');

      return respuesta;
    } catch (_) {
       throw Exception(
      'Error registrando pedido',
    );
    }
  }
}