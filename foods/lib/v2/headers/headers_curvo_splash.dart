

import 'package:flutter/material.dart';import 'dart:ui' as ui;

class HomeWidget extends StatelessWidget {
    final Widget childs;
  final double height;
  const HomeWidget({required this.childs, required this.height});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(children: [
/*
         Padding(
           padding: const EdgeInsets.only(top: 3, bottom: 50, left: 15),
           child: CustomPaint(
            size: Size(size.width, height),
            painter: HeaderPainter2(),
                   ),
         ), */
        CustomPaint(
          size: Size(size.width, height),
          painter: HeaderPainter(),
        ),
        Text(''),
        childs
      ]),
    );
  }
}

class HeaderPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
     final lapiz = new Paint();

    lapiz.shader = ui.Gradient.linear(
      Offset(size.width * 0.05, size.height * 0.0), 
        Offset(size.width * 0.05, size.height * 1), [
            Color.fromRGBO(255, 255, 255, 1),
      Color.fromRGBO(36, 29, 84, 1),
    
    ]);

    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path = new Path();


path.moveTo(size.width, size.height * 0.45);



  
 path.quadraticBezierTo(
     size.width * 0.95, 
     size.height * 0.65,
    size.width * 0.55, 
    size.height * 0.65);

       path.quadraticBezierTo(
         size.width * 0.12, size.height * 0.65,
    0 , size.height * 0.9 ); 
    path.lineTo(0 ,  size.height * 1);
    path.lineTo(size.width ,  size.height );

  

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }




}

class HeaderPainter2 extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
     final lapiz = new Paint();

    lapiz.shader = ui.Gradient.linear(
      Offset(size.width * 0.05, size.height * 0.0), 
        Offset(size.width * 0.05, size.height * 1), [
            Color.fromRGBO(255, 255, 255, 0),
      Color.fromRGBO(36, 29, 84, 1),
    
    ]);

    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path = new Path();


path.moveTo(size.width, size.height * 0.45);
path.lineTo(size.width,  size.height * 0.45);
  
   path.quadraticBezierTo( size.width * 0.87, size.height * 0.65,
    size.width * 0.55, size.height * 0.66);

       path.quadraticBezierTo(
         size.width * 0.15, size.height * 0.65,
    0 , size.height );
path.lineTo(size.width,  size.height);
path.lineTo(size.width,  size.height * 0.5);
  

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  }