import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'package:foods/v3.1/entities/ItemsPedido.dart' show Items, ItemsPedido;
import 'package:foods/v3.1/notifiers/Item/item_state_notifiers.dart'
    show itemsStateNotifier, itemsPagesStateNotifier;
import 'package:foods/v3.1/provider/CantidadProvider.dart'
    show cantidadProvider;
import 'package:foods/v3/util/colores.dart' show ConstantesColorTema2;

class Comidaid extends ConsumerWidget {
  int? idRestaurante;
  int? id;
  String? images;
  String? nombre;
  String? descripcion;
  int? precios;
  int? unidades;
  Comidaid(
      {this.idRestaurante,
      this.id,
      this.images,
      this.nombre,
      this.descripcion,
      this.precios,
      int? unidades});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.of(context).size.height;
    final cantidad = ref.watch(cantidadProvider);

    print(nombre);
    return SafeArea(
      child: Stack(children: [
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: height * 0.30,
            child: Container(
                child: Image.asset(
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
                  Text(nombre ?? '',
                      //'Nombre del producto',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600, // SemiBold
                          fontSize: 25,
                          color: Color(ConstantesColorTema2
                              .titulos)) //GoogleFonts.leckerliOne(fontSize: 20, color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                  Text(descripcion ?? '',
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
                    '$precios',
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                            width: 45,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color(ConstantesColorTema2.naraja),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: IconButton(
                                onPressed: () {
                                  final notifier =
                                      ref.read(cantidadProvider.notifier);
                                  if (notifier.state > 1) {
                                    notifier.state--;
                                  }
                                },
                                icon: Icon(Icons.remove,
                                    color:
                                        Color(ConstantesColorTema2.blanco)))),
                        SizedBox(
                          width: 5,
                        ),
                        Text('$cantidad'),

                        SizedBox(
                          width: 5,
                        ),

                        Container(
                            width: 45,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color(ConstantesColorTema2.naraja),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: IconButton(
                                onPressed: () {
                                  ref.read(cantidadProvider.notifier).state++;
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: Color(ConstantesColorTema2.blanco),
                                ))),
                        SizedBox(
                          width: 10,
                        ),
                        ////
                        Expanded(
                          child: Container(
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
                                final item = ItemsPedido(
                                  idRestaurante: idRestaurante,
                                  id: id,
                                  nombre: nombre!,
                                  descripcion: descripcion,
                                  precio: precios,
                                  unidades: unidades,
                                  image: images,
                                  unidadesPedir: cantidad,
                                );

                                print('cantidadZZZZZZZZZ $cantidad');
                                final agregado = ref
                                    .read(itemsPagesStateNotifier.notifier)
                                    .agregarItems(item, idRestaurante!);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor:
                                        Color(ConstantesColorTema2.naraja),
                                    margin: EdgeInsets.only(
                                      bottom: 80,
                                      left: 16,
                                      right: 16,
                                    ),
                                    content: Text(agregado
                                        ? '✅ Se añadió exitosamente al carrito'
                                        : '⚠️ El producto ya está en el carrito  O ⚠️ Solo puedes agregar productos de un restaurante.\n  Vacía el carrito o finaliza tu pedido.'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                ref.read(cantidadProvider.notifier).state = 1;
                                Navigator.pop(context);
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  // El texto "Agregar" siempre visible
                                  Text('Agregar',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight:
                                              FontWeight.w600, // SemiBold
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
                        ),

                        //
                      ],
                    ),
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
      ]),
    );
  }
}
