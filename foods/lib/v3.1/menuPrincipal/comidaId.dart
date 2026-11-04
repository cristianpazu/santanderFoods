import 'package:flutter/material.dart';
import 'package:foods/v3/util/colores.dart' show ConstantesColorTema2;

class Comidaid extends StatelessWidget {
  const Comidaid({super.key});

  @override
  Widget build(BuildContext context) {
        double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: height * 0.30,
          child: Container(
            child:  Image.asset(
                  'images' ?? '' //'assets/salchipapas.jpg'

                  ,
                  fit: BoxFit.cover,
                ))),
Positioned(
          bottom: 0, // Colocamos el container verde en la parte inferior
          left: 0,
          right: 0,
          child: Container(
            height: height * 0.77,
            decoration: BoxDecoration(
                color: Color(ConstantesColorTema2
                    .blanco), //Color.fromRGBO(109, 109, 109, 1),
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
                  Text('nombre' ?? '',
                      //'Nombre del producto',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600, // SemiBold
                          fontSize: 25,
                          color: Color(ConstantesColorTema2
                              .titulos)) //GoogleFonts.leckerliOne(fontSize: 20, color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                  Text('descripcion' ?? '',
                      // 'Descripcion del productoaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600, // SemiBold
                          fontSize: 20,
                          color: Color(ConstantesColorTema2
                              .descripciones)) //GoogleFonts.leckerliOne(fontSize: 20, color: Color.fromRGBO(0, 0, 0, 0.534)),
                      ),
                  SizedBox(
                    height: 20,
                  ),

Container(),
                  //
                  Text(
                    '' ?? '',
                    // 'Precio',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600, // SemiBold
                        fontSize: 20,
                        color: Color(ConstantesColorTema2.precios)),
                    //style: GoogleFonts.leckerliOne(
                    //  fontSize: 20, color: Color(ConstantesColorTema2.naraja),),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(ConstantesColorTema2.naraja),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: IconButton(
                              onPressed: () {
                               
                              },
                              icon: Icon(
                                Icons.add,
                                color: Color(ConstantesColorTema2.blanco),
                              ))),
                      SizedBox(
                        width: 10,
                      ),
                      Text('cantidad'),

                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(ConstantesColorTema2.naraja),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: IconButton(
                              onPressed: () {
                                
                              },
                              icon: Icon(Icons.remove,
                                  color: Color(ConstantesColorTema2.blanco)))),
                      SizedBox(
                        width: 80,
                      ),
                      ////
                      Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(ConstantesColorTema2.naraja),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () async {
                           
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                 behavior: SnackBarBehavior.floating,
                                  backgroundColor: Color(ConstantesColorTema2.naraja),
    margin: EdgeInsets.only(
 bottom: 80, 
      left: 16,
      right: 16,
    ),
                                content: Text(
                                     '✅ Se añadió exitosamente al carrito'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          
                          
                            Navigator.pop(context);
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // El texto "Agregar" siempre visible
                              Text('Agregar',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600, // SemiBold
                                      fontSize: 15,
                                      color: Color(ConstantesColorTema2
                                          .blanco)) /*GoogleFonts.leckerliOne(
                                  fontSize: 15,
                                  color: Color(ConstantesColorTema2
                                      .blanco) , //Color.fromRGBO(109, 109, 109, 1),
                                ),*/
                                  ),
                              // El ícono invisible hasta que se presiona
                            ],
                          ),
                        ),
                      ),
                     
                      //
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
          
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

            /*
         decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage('assets/salchipapas.jpg'), // Ruta de la imagen
             fit: BoxFit.cover, // Ajusta la imagen para cubrir el contenedor
           ), 
         ),
         */
        ]
          ),
        );
        
      
      
  }
}