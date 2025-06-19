import 'package:flutter/material.dart';
import 'package:foods/UI/screens/restaurantes/restaurantes.dart';

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
    redireccionamiento: Restaurantes(),
  ),
  TarjetaInfo(
    texto: 'Cafeterías',
    imagenPath: 'assets/hamburguesa.png',
    redireccionamiento: Restaurantes(),
  ),
  TarjetaInfo(
    texto: 'Bares',
    imagenPath: 'assets/hamburguesa.png',
    redireccionamiento: Restaurantes(),
  ),
  TarjetaInfo(
    texto: 'Heladerías',
    imagenPath: 'assets/hamburguesa.png',
    redireccionamiento: Restaurantes(),
  ),
   TarjetaInfo(
    texto: 'Heladerías',
    imagenPath: 'assets/hamburguesa.png',
    redireccionamiento: Restaurantes(),
  ),
   TarjetaInfo(
    texto: 'Heladerías',
    imagenPath: 'assets/hamburguesa.png',
    redireccionamiento: Restaurantes(),
  ),
   TarjetaInfo(
    texto: 'Heladerías',
    imagenPath: 'assets/hamburguesa.png',
    redireccionamiento: Restaurantes(),
  ),
];
