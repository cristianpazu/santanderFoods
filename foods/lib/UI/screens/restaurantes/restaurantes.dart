import 'package:flutter/material.dart';
import 'package:foods/UI/atoms/card_widget.dart';
import 'package:foods/UI/atoms/textfield.dart';
import 'package:foods/Utils/titutlos.dart';

class Restaurantes extends StatelessWidget {
  const Restaurantes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xC4411DDB),
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(120))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0, 4),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Textfields(
                  texto: 'Buscar restaurantes....',
                ),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      cardWidget2(
                        colors: Color(0xFFF6F6),
                        altura: 210,
                        image: Image.asset(
                          '/solar.jpeg',
                          fit: BoxFit.contain,
                        ),
                        texto: 'SOLAR',
                        icon2: Icon(Icons.calendar_month_rounded),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      cardWidget2(
                        colors: Color(0xFFF6F6),
                        altura: 210,
                        image: Image.asset(
                          '/solar.jpeg',
                          fit: BoxFit.contain,
                        ),
                        texto: 'C. de \n Pedro',
                        icon2: Icon(Icons.calendar_month_rounded),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
