import 'package:flutter/material.dart';
import 'dart:ui' as ui;

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

  Padding(
          padding: const EdgeInsets.only(top: 46,),
          child: CustomPaint(
            size: Size(size.width, height),
            painter: HeaderPainterTop2(),
          ),
        ),

        CustomPaint(
            size: Size(size.width, height), painter: HeaderPainterTop()),
      

Padding(
  padding: const EdgeInsets.only(top: 333,left: 110 ),
  child: Container(
    width: 200,
    child: Image.asset('assets/santanderplacesimg.png')),
),


        Padding(
          padding: const EdgeInsets.only(top: 3, bottom: 40,),
          child: CustomPaint(
            size: Size(size.width, height),
            painter: HeaderPainterBottom2(),
          ),
        ),
        CustomPaint(
          size: Size(size.width, height),
          painter: HeaderPainterBottom(),
        ),
        Text(''),
        childs
      ]),
    );
  }
}

class HeaderPainterBottom extends CustomPainter {
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

class HeaderPainterBottom2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint();

    lapiz.shader = ui.Gradient.linear(
        Offset(size.width * 0.05, size.height * 0.0),
        Offset(size.width * 0.05, size.height * 1), [
      Color.fromRGBO(255, 255, 255, 0),
      Color.fromRGBO(36, 29, 84, 0.507),
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
        size.width * 0.12, size.height * 0.65, 0, size.height * 0.9);
    path.lineTo(0, size.height * 1);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPainterTop extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint();

    lapiz.shader = ui.Gradient.linear(
        Offset(size.width * 0.05, size.height * 0.0),
        Offset(size.width * 0.05, size.height * 1), [
      Color.fromRGBO(36, 29, 84, 1),
      Color.fromRGBO(255, 255, 255, 1),
      //Color.fromRGBO(36, 29, 84, 0.507),
    ]);

    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path = new Path();

    path.lineTo(0, size.height * 0.55);

    path.quadraticBezierTo(
      size.width * 0.12, 
      size.height * 0.30,
        size.width * 0.5, 
        size.height * 0.35);

    path.quadraticBezierTo(
        size.width * 0.95,
        size.height * 0.39, 
        size.width, 
        size.height * 0.1);
        
    path.lineTo(size.width, 0);
/*
  path.quadraticBezierTo(
     size.width * 0.95, 
     size.height * 0.05,
    size.width * 1, 
    size.height * 0.65); */
/*path.moveTo(size.width, size.height * 0.45);



  
 path.quadraticBezierTo(
     size.width * 0.95, 
     size.height * 0.65,
    size.width * 0.55, 
    size.height * 0.65);

       path.quadraticBezierTo(
         size.width * 0.12, 
         size.height * 0.65,
    0 ,
     size.height * 0.9 ); 
    path.lineTo(0 ,  size.height * 1);
    path.lineTo(size.width ,  size.height );
  */

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//top 2
class HeaderPainterTop2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint();

    lapiz.shader = ui.Gradient.linear(
        Offset(size.width * 0.05, size.height * 0.0),
        Offset(size.width * 0.05, size.height * 1), [
      Color.fromRGBO(36, 29, 84,  0.507),
      Color.fromRGBO(255, 255, 255, 0),
      //Color.fromRGBO(36, 29, 84, 0.507),
    ]);

    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path = new Path();

    path.lineTo(0, size.height * 0.55);

    path.quadraticBezierTo(
      size.width * 0.12, 
      size.height * 0.30,
        size.width * 0.5, 
        size.height * 0.35);

    path.quadraticBezierTo(
        size.width * 0.95,
        size.height * 0.39, 
        size.width, 
        size.height * 0.1);
    path.lineTo(size.width, 0);
/*
  path.quadraticBezierTo(
     size.width * 0.95, 
     size.height * 0.05,
    size.width * 1, 
    size.height * 0.65); */
/*path.moveTo(size.width, size.height * 0.45);



  
 path.quadraticBezierTo(
     size.width * 0.95, 
     size.height * 0.65,
    size.width * 0.55, 
    size.height * 0.65);

       path.quadraticBezierTo(
         size.width * 0.12, 
         size.height * 0.65,
    0 ,
     size.height * 0.9 ); 
    path.lineTo(0 ,  size.height * 1);
    path.lineTo(size.width ,  size.height );
  */

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
