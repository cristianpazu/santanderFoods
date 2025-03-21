import 'dart:convert';

import 'package:foods/services/cargarJSon.dart';

Future<Map<String, dynamic>> cargarDatos() async {
  String jsonString = await cargarJson();
  Map<String, dynamic> jsonResponse = json.decode(jsonString);
  return jsonResponse;
}
