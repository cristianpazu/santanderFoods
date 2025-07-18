import 'package:flutter/material.dart';
import 'package:foods/Utils/ConstantesColor.dart';

class Cardcomida extends StatefulWidget {
String images;
String nombreComida;


   Cardcomida(this.images,this.nombreComida);

  @override
  State<Cardcomida> createState() => _CardcomidaState();
}

class _CardcomidaState extends State<Cardcomida> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          color: Color(ConstantesColorTema.fondoColorAppbar),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(
                          50), // Mitad del tamaño para hacerlo circular
                      image: DecorationImage(
                        image: AssetImage('${widget.images}'),
                        fit: BoxFit.cover, // Ajusta la imagen sin deformarla
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //
            Row(
              children: [
                SizedBox(
                  width: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 150,
                    height: 100,
                    color: Colors.blue,
                    child: Text('${widget.nombreComida}')
                    //Text('SALCHIPAPA CON ARROZ'),
                  ),
                ),
              ],
            ),
            //
            Row(
              children: [
                SizedBox(
                  width: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isFavorite =
                              !isFavorite; // alterna entre true y false
                        });
                      },
                      icon: Icon(
                        isFavorite
                            ? Icons.favorite_rounded // si está activado
                            : Icons
                                .favorite_border_rounded, // si está desactivado
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
