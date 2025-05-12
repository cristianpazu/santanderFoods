import 'package:flutter/material.dart';
import 'package:foods/UI/atoms/card_widget.dart';
import 'package:foods/UI/atoms/textfield.dart';
import 'package:foods/UI/screens/comidasRapidas/comidasRapidasInfo.dart';
import 'package:foods/UI/screens/gym/gym.dart';
import 'package:foods/UI/screens/restaurantes/restaurantes.dart';
import 'package:foods/Utils/ConstantesColor.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      color: Color.fromRGBO(50, 30, 124, 5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color:  const Color.fromRGBO(50, 30, 124, 5),
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(70),
                                bottomRight: Radius.circular(70))),
                        child: Image.asset('assets/santanderplacesimg.png'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Textfields(),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              cardWidget(
                                colors: Colors.white,
                                altura: 180,
                                image: Image.asset(
                                  'assets/hamburguesa.png',
                                  fit: BoxFit.contain,
                                ),
                                texto: 'RESTAURANTES',
                                redireccionamiento: Restaurantes(),
                              ),
                              SizedBox(
                                width: 35,
                              ),
                              cardWidget(
                                colors: Colors.white,
                                altura: 180,
                                image: Image.asset(
                                  'assets/gimnasio.png',
                                  fit: BoxFit.contain,
                                ),
                                texto: 'GYM',
                                redireccionamiento: Gym(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              cardWidget(
                                colors: Colors.white,
                                altura: 180,
                                image: Image.asset(
                                  'assets/hamburguesa.png',
                                  fit: BoxFit.contain,
                                ),
                                texto: 'COMIDAS \n RAPIDAS',
                                redireccionamiento: Comidas_rapidas_info(),
                              ),
                              SizedBox(
                                width: 35,
                              ),
                              cardWidget(
                                colors: Colors.white,
                                altura: 180,
                                image: Image.asset(
                                  'assets/hotel.png',
                                  fit: BoxFit.contain,
                                ),
                                texto: 'HOTELES',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              cardWidget(
                                colors: Colors.white,
                                altura: 180,
                                image: Image.asset(
                                  'assets/PANADERIAS.png',
                                  fit: BoxFit.contain,
                                ),
                                texto: 'PANADERIAS',
                              ),
                              SizedBox(
                                width: 35,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    )
    );
  }
}
