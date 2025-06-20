import 'package:flutter/material.dart';
import 'package:foods/UI/atoms/card_widget.dart';
import 'package:foods/UI/atoms/textfield.dart';
import 'package:foods/UI/screens/restaurantes/restaurantes.dart';
import 'package:foods/Utils/ConstantesColor.dart';
import 'package:foods/Utils/tarjetasInfoMenu.dart';
import 'package:foods/v2/headers/TopCornersConcaveClipper.dart';
import 'package:foods/widgets/appbars.dart';

class menuHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppbarMen(),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 50,
                  children: [
                    ...List.generate(tarjetas.length, (index) {
                      final tarjeta = tarjetas[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: cardWidget(
                          colors: Colors.white,
                          altura: 180,
                          image: Image.asset(
                            tarjeta.imagenPath,
                            fit: BoxFit.contain,
                          ),
                          texto: tarjeta.texto,
                          redireccionamiento: tarjeta.redireccionamiento,
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
     
        ],
      ),
     bottomNavigationBar:  ClipPath(
            clipper: TopCornersHornClipper(hornHeight: 41),
            child: Container(
               height: 80, 
              color: Color(ConstantesColorTema.fondoColorAppbar),
              child: BottomNavigationBar(
                  backgroundColor: Color(ConstantesColorTema.fondoColorAppbar),
                  selectedItemColor: Colors.white,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Inicio',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: 'Buscar',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Perfil',
                    ),
                  ]),
            ),
          )
    );
  }
}

class AppbarMen extends StatelessWidget {
  const AppbarMen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        appBarHomeMenu(),
        Padding(
          padding: const EdgeInsets.only(top: 215, right: 30, left: 30),
          child: Textfields(
            texto: '',
          ),
        ),
        Center(
            child: Container(
                width: 200,
                child: Image.asset('assets/santanderplacesimg.png'))),
      ],
    );
  }
}
