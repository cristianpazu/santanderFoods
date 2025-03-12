import 'package:flutter/material.dart';
import 'package:foods/UI/atoms/card_widget.dart';
import 'package:foods/UI/atoms/textfield.dart';
import 'package:foods/Utils/titutlos.dart';

class Menu_restaurantes extends StatelessWidget {
  const Menu_restaurantes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xC4411DDB),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            //BorderRadius.only(bottomLeft: Radius.circular(90))
                            BorderRadius.only(
                                bottomLeft: Radius.circular(90),
                                bottomRight: Radius.circular(90))),
                  ),
                ],
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
                    texto: 'Buscar comida....',
                  ),
                ),
              ),
              //
            Padding(
              padding: const EdgeInsets.only(left: 1, right: 220),
              child: Container(
              
                width: 210,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.amber,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20))
                ),
                child: UiTexto(texto: 'Cocteles').textoRobotoLight2(),
              ),
            ),
          
              //
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    cardWidget3(
                      colors: Color(0xFFF6F6),
                      altura: 210,
                      image: Image.asset(
                        'assets/coctel-cuba-libre.jpg',
                        fit: BoxFit.contain,
                      ),
                      texto: 'Coctel',
                    ),
                    cardWidget3(
                      colors: Color(0xFFF6F6),
                      altura: 210,
                      image: Image.asset(
                        'assets/coctel-daiquiri.jpg',
                        fit: BoxFit.contain,
                      ),
                      texto: 'Coctel',
                    ),
                     cardWidget3(
                      colors: Color(0xFFF6F6),
                      altura: 210,
                      image: Image.asset(
                        'assets/coctel-el-solar.jpg',
                        fit: BoxFit.contain,
                      ),
                      texto: 'Coctel',
                    ),
                     cardWidget3(
                      colors: Color(0xFFF6F6),
                      altura: 210,
                      image: Image.asset(
                        'assets/coctel-margarita-maracuya.jpg',
                        fit: BoxFit.contain,
                      ),
                      texto: 'Coctel',
                    ),
                     cardWidget3(
                      colors: Color(0xFFF6F6),
                      altura: 210,
                      image: Image.asset(
                        'assets/coctel-sex-on-the-beach.jpg',
                        fit: BoxFit.contain,
                      ),
                      texto: 'Coctel',
                    ),
                  ],
                ),
              ),
              //
 Padding(
              padding: const EdgeInsets.only(left: 1, right: 220),
              child: Container(
              
                width: 210,
                height: 30,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 193, 7, 1),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20))
                ),
                child: UiTexto(texto: 'Almuerzos').textoRobotoLight2(),
              ),
            ),
              //
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    cardWidget3(
                      colors: Color(0xFFF6F6),
                      altura: 210,
                      image: Image.asset(
                        'assets/triologia-de-carnes.jpg',
                        fit: BoxFit.contain,
                      ),
                      texto: 'Coctel',
                    ),
                    cardWidget3(
                      colors: Color(0xFFF6F6),
                      altura: 210,
                      image: Image.asset(
                        'assets/delicioso-lomo-viche.jpg',
                        fit: BoxFit.contain,
                      ),
                      texto: 'Coctel',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
