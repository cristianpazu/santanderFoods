import 'package:flutter/material.dart';
import 'package:foods/UI/screens/restaurantes/restaurantess.dart';
import 'package:foods/v2/screen/restaurantesPrincipales/RestautantesPrincipales.dart';
import 'package:foods/widgets/MenuWidget.dart';

class TarjetaInfo {
  final String texto;
  final String imagenPath;
  final Widget redireccionamiento;

  TarjetaInfo({
    required this.texto,
    required this.imagenPath,
    required this.redireccionamiento,
  });
}


final List<TarjetaInfo> tarjetas = [
  TarjetaInfo(
    texto: 'Restaurantes',
    imagenPath: 'assets/hamburguesa.png',
    redireccionamiento: Restautantesprincipales(),
  ),
  TarjetaInfo(
    texto: 'Cafeterías',
    imagenPath: 'assets/hamburguesa.png',
    redireccionamiento: Restaurantess(),
  ),
  TarjetaInfo(
    texto: 'Bares',
    imagenPath: 'assets/hamburguesa.png',
    redireccionamiento: Restaurantess(),
  ),
  TarjetaInfo(
    texto: 'Heladerías',
    imagenPath: 'assets/hamburguesa.png',
    redireccionamiento: Restaurantess(),
  ),
   TarjetaInfo(
    texto: 'Heladerías',
    imagenPath: 'assets/hamburguesa.png',
    redireccionamiento: Restaurantess(),
  ),
   TarjetaInfo(
    texto: 'Heladerías',
    imagenPath: 'assets/hamburguesa.png',
    redireccionamiento: Restaurantess(),
  ),
   TarjetaInfo(
    texto: 'Heladerías',
    imagenPath: 'assets/hamburguesa.png',
    redireccionamiento: Restaurantess(),
  ),
];
