import 'package:flutter/material.dart';
import 'package:foods/Utils/ConstantesColor.dart';
import 'package:foods/Utils/titutlos.dart';

class Cardcomida extends StatefulWidget {
  String images;
  String? nombreComida;
  double ancho;
  Widget redireccionamientos;

  Cardcomida(this.images, this.nombreComida, this.ancho, this.redireccionamientos);

  @override
  State<Cardcomida> createState() => _CardcomidaState();
}

class _CardcomidaState extends State<Cardcomida> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => widget.redireccionamientos ,
              ));
        },
        child: Container(
          width: widget.ancho,
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
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: 150,
                        height: 100,
                        child: UiTexto(texto: '${widget.nombreComida}')
                            .textoRobotoLight2()
                      
                        //Text('SALCHIPAPA CON ARROZ'),
                        ),
                  ),
                ],
              ),
              //
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 50,
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
                              ? Icons.bookmark // si está activado
                              : Icons
                                  .bookmark_outline_sharp, // si está desactivado
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
      ),
    );
  }
}
