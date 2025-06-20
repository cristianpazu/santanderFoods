import 'package:flutter/material.dart';
import 'dart:ui' as ui;
class TopCornersHornClipper extends CustomClipper<Path> {
  final double hornHeight;

  TopCornersHornClipper({this.hornHeight = 30});

  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, size.height);         // abajo a la izquierda
    path.lineTo(0, 0);                   // sube a la esquina
    path.quadraticBezierTo(
      0, -hornHeight,                   // punto de control elevado (pico)
      hornHeight, 0,                    // finaliza en la línea horizontal
    );

    path.lineTo(size.width - hornHeight, 0); // línea horizontal

    path.quadraticBezierTo(
      size.width, -hornHeight,         // pico derecho
      size.width, 0,
    );

    path.lineTo(size.width, size.height); // cierra abajo
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
