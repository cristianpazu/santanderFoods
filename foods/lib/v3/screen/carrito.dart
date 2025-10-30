import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarritoPage2 extends StatefulWidget {
  const CarritoPage2({super.key});

  @override
  State<CarritoPage2> createState() => _CarritoPage2State();
}

class _CarritoPage2State extends State<CarritoPage2> {
  int valor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Row(
              children: [
                Container(
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
                  child: IconButton(
                    icon: Icon(
                        Icons.arrow_back), // Puedes cambiarlo por otro ícono
                    onPressed: () {
                                     Navigator.of(context).pop();
                  
                    },
                  ),
                ),
                SizedBox(
                  width: 120,
                ),
                Container(
                  child: Text(
                    'Carrito',
                    style: GoogleFonts.leckerliOne(
                        fontSize: 30, color: Color.fromRGBO(109, 109, 109, 1)),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              children: [
                TarjetaComidaCarrito(),
                SizedBox(
                  height: 20,
                ),
                TarjetaComidaCarrito(),
                SizedBox(
                  height: 20,
                ),
                TarjetaComidaCarrito(),
                SizedBox(
                  height: 20,
                ),
                TarjetaComidaCarrito(),
                SizedBox(
                  height: 20,
                ),
                TarjetaComidaCarrito(),
                SizedBox(
                  height: 20,
                ),
                TarjetaComidaCarrito(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          //

          Container(
            width: double.infinity,
            height: 90,
            color: Color.fromRGBO(109, 109, 109, 0.5),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Text(' \$ 20.000'),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 150,
                          height: 70,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 247, 246, 242),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text('Pagar',  style: GoogleFonts.leckerliOne(
                        fontSize: 30, color: Color.fromRGBO(109, 109, 109, 1)),),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class TarjetaComidaCarrito extends StatefulWidget {
  const TarjetaComidaCarrito({super.key});

  @override
  State<TarjetaComidaCarrito> createState() => _TarjetaComidaCarritoState();
}

class _TarjetaComidaCarritoState extends State<TarjetaComidaCarrito> {
  int valor = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        // height: 110,
         decoration: BoxDecoration(
        color: Color.fromRGBO(109, 109, 109, 1),
                        borderRadius: BorderRadius.circular(20)
                      ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipOval(
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        'assets/salchipapas.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('data'),
                        SizedBox(height: 8),
                        Text(
                          'hamburguesa "La hamburguesa del Oeste Salvaje": una torre de carne Angus a la plancha, cubierta con queso cheddar fundido, cebolla caramelizada y una generosa porción de salsa BBQ casera, todo en un panecillo de pretzel tostado.hamburguesa "La hamburguesa del Oeste Salvaje": una torre de carne Angus a la plancha, cubierta con queso cheddar fundido, cebolla caramelizada y una generosa porción de salsa BBQ casera, todo en un panecillo de pretzel tostado. ',
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
//
            Padding(
              padding: const EdgeInsets.only(right: 18.0, left: 28.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                         padding: const EdgeInsets.only(right: 38.0, left: 38.0, top: 5),
                        child: Text('20.000'),
                      ),

                      ///
                      Spacer(),

                      ///
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

                   
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Center(child: Text('$valor')),
                      ),
//
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
                    ],
                  ),
                  //
                ],
              ),
            ),
            //
            Container(
                        height: 10,
                      ),
//
          ],
        ),
      ),
    );
  }
}
