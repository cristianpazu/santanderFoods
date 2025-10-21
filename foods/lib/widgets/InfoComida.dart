import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoComida extends StatefulWidget {
  const InfoComida({super.key});

  @override
  State<InfoComida> createState() => _InfoComidaState();
}

class _InfoComidaState extends State<InfoComida> {
  late Function(GlobalKey) runAddToCartAnimation;
  final GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();

  GlobalKey imageKey = GlobalKey();
  int valor = 0;
  bool isAddedToCart = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    print(valor);
    return AddToCartAnimation(
      cartKey: cartKey,
      height: 30,
      width: 30,
      opacity: 0.85,
      dragAnimation: const DragToCartAnimationOptions(
        rotation: true,
      ),
      createAddToCartAnimation: (addToCartAnimationMethod) {
        runAddToCartAnimation = addToCartAnimationMethod;
      },

      
      child: SafeArea(
          child: Stack(
        children: [
          Container(
            color: Colors.white,
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
                      color:
                          Colors.black.withOpacity(0.5), // Color de la sombra
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
          Positioned(
            top: 40,
            left: 350,
            child: AddToCartIcon(
              key: cartKey,
              icon: Icon(Icons.shopping_cart),
              badgeOptions: BadgeOptions(
                active: false, // Esto desactiva el contador
                backgroundColor: Colors.transparent,
              ),
            ),
          ),

          //
          Positioned(
            bottom: 0, // Colocamos el container verde en la parte inferior
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.75,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(109, 109, 109, 0.5),
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
                          fontSize: 20,
                          color: Color.fromRGBO(109, 109, 109, 1)),
                    ),
                    Text(
                      'Descripcion del productoaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.leckerliOne(
                          fontSize: 20,
                          color: Color.fromRGBO(109, 109, 109, 1)),
                    ),
                    Text(
                      'Precio',
                      style: GoogleFonts.leckerliOne(
                          fontSize: 20,
                          color: Color.fromRGBO(109, 109, 109, 1)),
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
                                icon: Icon(Icons.add))

                            /*Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                 
                                  
                                '+',
                                style: GoogleFonts.leckerliOne(
                                    fontSize: 40,
                                    color: Color.fromRGBO(109, 109, 109, 1)),
                              ),
                            )
                            
                            */
                            ),
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
                              runAddToCartAnimation(imageKey);

                               await Future.delayed(const Duration(seconds: 4)); // espera animación
  
  if (mounted) {
    Navigator.of(context).pop(); // cierra la pantalla si sigue montada
  }
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
                                Positioned(
                                  left: 0,
                                  child: Opacity(
                                      opacity:
                                          0, // Invisible al usuario pero renderizable
                                      child: Container(
                                        key:
                                            imageKey, // <--- esto es lo que se animará
                                        child: Icon(
                                          Icons
                                              .fastfood, // o cualquier ícono representando el producto
                                          size: 30,
                                          color: Colors.grey,
                                        ),
                                      )),
                                ),
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
        ],
      )),
    );

    /*Container(
        // color: Colors.amber,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  width: 300,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(233, 236, 255, 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    'Información del producto',
                    style: TextStyle(fontFamily: 'Arial', fontSize: 24),
                  ))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                   
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 48.0),
                              child: Text('Nombre del Producto: '),
                            ),
                            Text('nombreProducto} '),
                          ],
                        ),
//
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 48.0),
                              child: Text('Precio de ventas: '),
                            ),
                            Text('precioVenta} '),
                          ],
                        ),
                        //
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 48.0),
                              child: Text('Fecha de ingreso: '),
                            ),
                            Text('fechaIngreso} '),
                          ],
                        ),
                        //
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 48.0),
                              child: Text('Cantidad de existencia: '),
                            ),
                            Text('cantidadStock} '),
                          ],
                        ),
                        //
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 48.0),
                              child: Text('Observación del producto: '),
                            ),
                            Text('observacion} '),
                          ],
                        ),
                      ],
                    )),
              ),
             
            ],
          ),
        ),
      ); */
  }
}
