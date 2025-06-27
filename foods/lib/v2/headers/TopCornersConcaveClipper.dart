import 'package:flutter/material.dart';
import 'dart:ui' as ui;
class AppBarPainterBottom extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint();


    lapiz.style = PaintingStyle.stroke;
    lapiz.strokeWidth = 20;

    final path = new Path();

    path.moveTo(size.width, size.height * 0.45);

    path.quadraticBezierTo(
      size.width * 0.95, 
      size.height * 0.67,
      size.width * 0.62, 
      size.height * 0.65);

    path.quadraticBezierTo(
        size.width * 0.12, 
        size.height * 0.65, 
        0, 
        size.height * 0.9);
    
    
    path.lineTo(0, size.height * 1);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}



