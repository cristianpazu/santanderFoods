import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoComida2 extends StatefulWidget {
  const InfoComida2({super.key});

  @override
  State<InfoComida2> createState() => _InfoComidaState();
}

class _InfoComidaState extends State<InfoComida2> {
  int valor = 0;
  bool isAddedToCart = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    String _carTaf = 'as';
    print(valor);
    return SafeArea(
        child: Stack(
      children: [
     Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: height * 0.30,
       child: Container(
        child: Hero(
          tag: _carTaf,
          child: Image.asset('assets/salchipapas.jpg',fit: BoxFit.cover,)),
        /*
         decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage('assets/salchipapas.jpg'), // Ruta de la imagen
             fit: BoxFit.cover, // Ajusta la imagen para cubrir el contenedor
           ), 
         ),*/
       ),
      ), 
//
 Positioned(
          bottom: 0, // Colocamos el container verde en la parte inferior
          left: 0,
          right: 0,
          child: Container(
            height: height * 0.77,
            decoration: BoxDecoration(
                color: Color.fromRGBO(109, 109, 109, 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Nombre del producto',
                    style: GoogleFonts.leckerliOne(
                        fontSize: 20, color: Color.fromRGBO(0, 0, 0, 1)),
                  ),
                  Text(
                    'Descripcion del productoaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.leckerliOne(
                        fontSize: 20, color: Color.fromRGBO(0, 0, 0, 1)),
                  ),
                  Text(
                    'Precio',
                    style: GoogleFonts.leckerliOne(
                        fontSize: 20, color: Color.fromRGBO(0, 0, 0, 1)),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  valor++;
                                });
                              },
                              icon: Icon(Icons.add))),
                      SizedBox(
                        width: 10,
                      ),
                      Text('$valor'),

                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  print(valor);
                                  valor--;
                                });
                              },
                              icon: Icon(Icons.remove))),
                      SizedBox(
                        width: 80,
                      ),
                      ////
                      Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () async {
                            setState(() {
                              _carTaf;
                            });
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // El texto "Agregar" siempre visible
                              Text(
                                'Agregar',
                                style: GoogleFonts.leckerliOne(
                                  fontSize: 15,
                                  color: Color.fromRGBO(109, 109, 109, 1),
                                ),
                              ),
                              // El ícono invisible hasta que se presiona
                              
                            ],
                          ),
                        ),
                      ),
                      /*
                      Container(
                          width: 150,
                          height: 50,
                          key: imageKey,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets
                                  .zero, // Elimina el padding predeterminado
                            ),
                            onPressed: () {
                              runAddToCartAnimation(imageKey);
                            },
                            child: Text('Agregar',
                                style: GoogleFonts.leckerliOne(
                                    fontSize: 15,
                                    color: Color.fromRGBO(109, 109, 109, 1))),
                          )), */
                      //
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

      //
        Positioned(
            top: 30,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 247, 246, 242),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5), // Color de la sombra
                    blurRadius: 8.0, // Difusión de la sombra
                    offset: Offset(0, 4), // Desplazamiento de la sombra
                  ),
                ],
              ),
              width: 45,
              height: 45,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.cancel_outlined)),
            )),
        //

        //
       
      ],
    ));
  }
}
