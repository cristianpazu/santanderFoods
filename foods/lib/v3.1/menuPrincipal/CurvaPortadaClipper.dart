import 'package:flutter/material.dart' show CustomClipper, Path, Size;

class CurvaPortadaClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height - 30);

       path.lineTo(0, size.height * 0.72);

    // Ola inferior asimétrica
    path.cubicTo(
      size.width * 0.30, size.height * 0.82,
      size.width * 0.72, size.height * 1.02,
      size.width, size.height * 0.85,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }


  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}