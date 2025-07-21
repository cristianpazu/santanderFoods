import 'package:flutter/material.dart';
import 'package:foods/UI/atoms/textFiled.dart';
import 'package:foods/v2/screen/item/CarritoPage.dart';
import 'package:foods/widgets/appbars.dart';

class Appbarcomidas extends StatelessWidget {

  Widget child;
  String image;
   Widget? redireccionamiento;
   Appbarcomidas(this.child, this.image, this.redireccionamiento);

  @override
  Widget build(BuildContext context) {
    return  appBarHomeMenu(
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 30),
                        child: Container(
                          height: 50,
                          width: 25,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          child: Center(
                            child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                   Navigator.pop(context); 
                                },
                                icon: Icon(Icons.arrow_back_rounded)),
                          ),
                        ),
                      ),
                      //
                   Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(
                          25), // Mitad del tamaño para hacerlo circular
                      image: DecorationImage(
                        image: AssetImage('${image}'),
                        fit: BoxFit.cover, // Ajusta la imagen sin deformarla
                      ),
                    ),
                  ),
                ),
                  //

                       Padding(
                        padding: const EdgeInsets.only(left: 10, top: 30),
                        child: Container(
                          height: 50,
                          width: 25,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          child: redireccionamiento,/* InkWell(
                            
                            onTap: () {
                              print('Carrito icon pressed');
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>CarritoPage() ,
              ));
        },
                            child: Center(
                              child: Icon(Icons.shopping_cart_outlined),
                            ),
                          ), */
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child:child /*Textfields2(
                    controller: _searchController,
                    onChanged: (value) {},
                    texto: '',
                  ), */
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
  }
}