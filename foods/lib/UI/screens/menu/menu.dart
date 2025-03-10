import 'package:flutter/material.dart';
import 'package:foods/UI/atoms/card_widget.dart';
import 'package:foods/UI/atoms/textfield.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color(0xC4411DDB),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Textfields(),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 730,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
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
                            texto: 'RESTAURANTES',
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
          ),
        ],
      ),
    )

        /* 
        
        
        
        
        
        
         
        
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*Stack(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                  ),
                  color: const Color.fromRGBO(65, 29, 219,1),
                ),
              )
            ],
          ),*/
          SizedBox(
            height: 10,
          ),
          Container(
            color: Color.fromRGBO(65, 29, 219,1),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      cardWidget(
                        altura: 250,
                        image: Image.network(
                            fit: BoxFit.contain,
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2wIv-rGpU1OGRFrZcmBSrmUDlqgM4WHb_Ag&s'),
                        texto: 'Comidas rapidas',
                      ),
                      SizedBox(width: 10,),
                      cardWidget(
                        altura: 250,
                        image: Image.network(
                            fit: BoxFit.contain,
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkSKNdVt8de9oezT7XWuVWLa4uR-ooNblmQw&s'),
                        texto: 'Restaurantes',
                      ),
                        SizedBox(width: 10,),
                      cardWidget(
                        altura: 250,
                        image: Image.network(
                            fit: BoxFit.contain,
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2wIv-rGpU1OGRFrZcmBSrmUDlqgM4WHb_Ag&s'),
                        texto: 'Hoteles',
                      ),
                        SizedBox(width: 10,),
                      cardWidget(
                        altura: 250,
                        image: Image.network(
                            fit: BoxFit.contain,
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2wIv-rGpU1OGRFrZcmBSrmUDlqgM4WHb_Ag&s'),
                        texto: 'Panaderias',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),*/
        );
  }
}
