import 'dart:convert' show jsonDecode;

import 'package:foods/v3.1/BaseUrl.dart' show Baseurl;
import 'package:foods/v3.1/domain/datasource-serviceIntergace/RestauranteInterface/RestauranteDatasource.dart' show Restaurantedatasource;
import 'package:foods/v3.1/entities/Restaurantes/RestauranteCompletoResponseDTO.dart';
import 'package:foods/v3.1/entities/RestaurantesResponseDTO.dart';
import 'package:foods/v3.1/http.dart' show HttpService;

class Restauranteserviceimpl extends Restaurantedatasource {
  @override
  Future<List<Restaurantesresponsedto>> consultarRestaurantes() async {
    try {
      print('🟢 ENTRÓ A consultarRestaurantes');
      final respuesta =
          await HttpService(Baseurl.consultarRestaurantes).getHttp();

      print('La respuesta no es una lista $respuesta');

      if (respuesta == null) return [];

      final data = jsonDecode(respuesta);

      if (data is! List) {
        print('❌ La respuesta no es una lista');
        return [];
      }
      final List<Restaurantesresponsedto> restauranteResponse = [];

      for (var element in data ?? []) {
        // peidos.add(Historialpedidodto.fromJson(element));

        if (element is Map<String, dynamic>) {
          restauranteResponse.add(
            Restaurantesresponsedto.fromJson(element),
          );
        } else {
          print('❌ Elemento no es Map<String,dynamic>');
        }
      }
      print('peidos $restauranteResponse');
      return restauranteResponse;
    } catch (e, stackTrace) {
        print('❌ Error en consultarRestaurantes: $e');
  print(stackTrace);
      return [];
    }
  }

  @override
  Future<Restaurantecompletoresponsedto> consultarRestaurantesId(int id)async {
   try {
      final respuesta = await HttpService(Baseurl.consultarRestauranteId(id)).getHttp();
 
print('respuesta>>>>>>>>>>>>><<<<<< $respuesta');
 final data = jsonDecode(respuesta ?? '');
      return Restaurantecompletoresponsedto.fromJson(data);
    } catch(e, stackTrace) {
        print('❌ Error en consultarRestaurantesidddd: $e');
  print(stackTrace);
       throw Exception(
      'Error registrando pedido',
    );
    }
  }

}