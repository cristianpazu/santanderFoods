import 'package:flutter/material.dart';
import 'package:foods/UI/atoms/textFiled.dart';
import 'package:foods/widgets/appbars.dart';

class Appbarcomidasdetalles extends StatelessWidget {
  String image;
  //Widget child;
  Appbarcomidasdetalles(this.image );

  @override
  Widget build(BuildContext context) {
    return appBarHomeMenu(
      Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 150, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              onPressed: () {},
                              icon: Icon(Icons.arrow_back_rounded)),
                        ),
                      ),
                    ),
                    //

                    //
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: 40,
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40, top: 20),
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(
                            100), // Mitad del tamaño para hacerlo circular
                        image: DecorationImage(
                          image: AssetImage('${image}'),
                          fit: BoxFit.cover, // Ajusta la imagen sin deformarla
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
