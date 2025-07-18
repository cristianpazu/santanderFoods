import 'package:flutter/material.dart';
import 'package:foods/UI/atoms/card_widget.dart';
import 'package:foods/UI/atoms/textFiled.dart';
import 'package:foods/UI/atoms/textfield.dart';
import 'package:foods/UI/screens/restaurantes/restaurantess.dart';
import 'package:foods/Utils/ConstantesColor.dart';
import 'package:foods/Utils/tarjetasInfoMenu.dart';
import 'package:foods/v2/headers/TopCornersConcaveClipper.dart';
import 'package:foods/widgets/appbars.dart';

class menuHome extends StatefulWidget {
  @override
  State<menuHome> createState() => _menuHomeState();
}

class _menuHomeState extends State<menuHome> {

TextEditingController _searchController = TextEditingController();
  String searchQuery = "";






  @override
  Widget build(BuildContext context) {

     final filteredTarjetas = tarjetas.where((tarjeta) {
      return tarjeta.texto.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
     Size size = MediaQuery.of(context).size;
     final  height = size.height;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              AppbarMen(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      spacing: 50,
                      children: [
                           ...filteredTarjetas.map((tarjeta) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: cardWidget(
                              colors: Colors.white,
                              altura: 180,
                              image: Image.asset(tarjeta.imagenPath, fit: BoxFit.contain),
                              texto: tarjeta.texto,
                              redireccionamiento: tarjeta.redireccionamiento,
                            ),
                          );
                        }).toList(),
                        /*...List.generate(tarjetas.length, (index) {
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
                        }), */
                      ],
                    ),
                  ),
                ),
              ),
             
               BottomNavigationBar(
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

                              
                  
            ],
          ),
          /*
           Padding(
             padding: const EdgeInsets.only(top: 805, left: 370),
             child: Container(
              height:50,
              width: 50,
              color: Colors.white,
               child: CustomPaint(
                size: Size(size.width, height), painter: AppBarPainterBottom()),
             ),
           ), */
        ],
      ),
  //   bottomNavigationBar:  
     
    );
  }
}
   // );

    
 // }
//} 
/*ClipPath(
            clipper: TopCornersHornClipper(hornHeight: 30),
            child: Container(
               height: 110, 
              color: Color(ConstantesColorTema.fondoColorAppbar),
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
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
            ),
          ) */
    //);
 // }
//}

class AppbarMen extends StatelessWidget {

   final TextEditingController controller;
  final ValueChanged<String> onChanged;


  const AppbarMen({
    super.key,
     required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        appBarHomeMenu(Container()),
        Padding(
          padding: const EdgeInsets.only(top: 215, right: 30, left: 30),
          child: Textfields2(
            controller: controller,
            onChanged: onChanged,
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
