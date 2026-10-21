
import 'dart:convert';

import 'package:foods/v3.1/BaseUrl.dart' show Baseurl;
import 'package:http/http.dart' as http;
class HttpService {
  String endPoint;
 // final Dio dio = Dio();

  HttpService(this.endPoint);

   Future<String?> getHttp() async {
    try {

 final url = Uri.parse(
        '${Baseurl.baseUrl}$endPoint',
      );

      print(url);

      final response = await http.get(url);

      //final url =  Uri.http('${Baseurl.baseUrl}${endPoint}');

// var responses = await http.get(url);


      return response.body;
    } catch (e) {
      print('Error: $e');
      return null; // O puedes lanzar una excepción si prefieres
    }
  }

  Future postRegisterHttp(Map<String, dynamic> producto) async {
    try {


 final url = Uri.parse(
        '${Baseurl.baseUrl}$endPoint',
      );

      print(url);

      final response = await http.post(url,   headers: {
      'Content-Type': 'application/json',

      
    },
    
    body: jsonEncode(producto),
    );

      print('response.data ${response.body}');
//return Map<String, dynamic>.from(response.body as Map);
    return jsonDecode(response.body);
      //return response.data as Map<String, dynamic>;
    } catch (e) {
      print('Error: $e');
      return {}; // O puedes lanzar una excepción si prefieres
    }
  } 

 /* Future<Map<String, dynamic>> putHttp(Map<String, dynamic> producto, String method) async {
    try {
 print('response.data ${producto.toString()}');
      final response = await dio.put('${Baseurl.baseUrl}${endPoint}',
          data: producto, options: Options(method: method));
      return Map<String, dynamic>.from(response.data);
    } catch (e) {
      print('Error: $e');
      return {}; // O puedes lanzar una excepción si prefieres
    }
  }
  //

  Future postRegisterHttp(Map<String, dynamic> producto, String method) async {
    try {
      final response = await dio.post('${Baseurl.baseUrl}${endPoint}',
          data: producto, options: Options(method: method));

      print('response.data ${response.data}');
return Map<String, dynamic>.from(response.data);
      //return response.data as Map<String, dynamic>;
    } catch (e) {
      print('Error: $e');
      return {}; // O puedes lanzar una excepción si prefieres
    }
  } */

 Future<dynamic> postActualizarEstadoPagoHttp() async {
    try {
    final url = Uri.parse(
      '${Baseurl.baseUrl}$endPoint',
    );

    print(url);

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    print('response.data ${response.body}');

    return jsonDecode(response.body);
  } catch (e) {
    print('Error: $e');
    return {};
  }
}

}
