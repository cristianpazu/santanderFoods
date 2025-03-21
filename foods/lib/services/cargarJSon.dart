import 'package:flutter/services.dart';

Future<String> cargarJson() async {
  // Cargar el archivo JSON desde los assets
  final String response = await rootBundle.loadString('assets/places2.json');
  return response;
}