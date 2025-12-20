import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/v2/presentation/notifiers/items_notifiers/item_state.dart';
import 'package:foods/v3/entities/items.dart';
import 'package:foods/v3/presentation/notifiers/comida_rapida_notifiers/nombre_comida_2_notifiers.dart';
import 'package:foods/v3/presentation/notifiers/items_notifiers/cantidad_provider.dart';
import 'package:foods/v3/util/colores.dart';
import 'package:google_fonts/google_fonts.dart';

import '../v3/presentation/notifiers/items_notifiers/item_state_notifiers.dart';

class InfoComida2 extends ConsumerStatefulWidget {
  int? idRestaurante;
  int? id;
  String? images;
  String? nombre;
  String? descripcion;
  String? precios;
  String? unidades;
  InfoComida2(this.idRestaurante, this.id, this.images, this.nombre,
      this.descripcion, this.precios, this.unidades);

  @override
  _InfoComidaState createState() => _InfoComidaState(
      idRestaurante, id, images, nombre, descripcion, precios, unidades);
}

class _InfoComidaState extends ConsumerState<InfoComida2> {
  int valor = 0;
  bool isAddedToCart = false;
  int? idRestaurante;
  int? id;
  String? images;
  String? nombre;
  String? descripcion;
  String? precios;
  String? unidades;

  _InfoComidaState(this.idRestaurante, this.id, this.images, this.nombre,
      this.descripcion, this.precios, this.unidades);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final productState = ref
        .watch(nombreComidaRapidaRestaurante2Provider(widget.idRestaurante!));
    final cartState = ref.watch(itemsStateNotifier);

    final cantidad = ref.watch(cantidadProvider);

    final unidadesProducto = cartState
        .expand((e) {
          print('objectZZZZ|||| ${e.descripcionMenu} - ${id}');
          return e.descripcionMenu;
        })
        .where((item) {
          print('objectZZZZ|||| ${item.id} - ${id}');
          return item.nombre == nombre;
        })
        .map((item) => item.unidadesPedir ?? 0)
        .fold(0, (a, b) => a + b);

    String _carTaf = 'as';
    print(valor);
    print('objectZZZZ ${unidadesProducto} - ${id}');

    print('object ${nombre} - ${id}');
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
                tag: widget.nombre! + _carTaf,
                child: Image.asset(
                  images ?? '' //'assets/salchipapas.jpg'

                  ,
                  fit: BoxFit.cover,
                )),
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
                  Text(
                    nombre ?? '',
                    //'Nombre del producto',
                    style: GoogleFonts.leckerliOne(
                        fontSize: 20, color: Color.fromRGBO(0, 0, 0, 1)),
                  ),
                  Text(
                    descripcion ?? '',
                    // 'Descripcion del productoaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.leckerliOne(
                        fontSize: 20, color: Color.fromRGBO(0, 0, 0, 1)),
                  ),
                  Text(
                    precios ?? '',
                    // 'Precio',
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
                      Text('$cantidad'),

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
                                final notifier =
                                    ref.read(cantidadProvider.notifier);
                                if (notifier.state > 1) {
                                  notifier.state--;
                                }
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
                            final item = Items(
                              nombre: nombre!,
                              descripcion: descripcion,
                              precio: precios,
                              unidades:unidades,
                              image: images,
                              unidadesPedir: cantidad
                            );
                          
print('cantidadZZZZZZZZZ $cantidad');
                            final agregado = ref
                                .read(itemsStateNotifier.notifier)
                                .agregarItems(item, productState.id);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(agregado
                                    ? '✅ Se añadió exitosamente al carrito'
                                    : '⚠️ El producto ya está en el carrito  O ⚠️ Solo puedes agregar productos de un restaurante.\n  Vacía el carrito o finaliza tu pedido.'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                            setState(() {
                              _carTaf;
                            });
                            ref.read(cantidadProvider.notifier).state = 1;
                            Navigator.pop(context);
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // El texto "Agregar" siempre visible
                              Text(
                                'Agregar',
                                style: GoogleFonts.leckerliOne(
                                  fontSize: 15,
                                  color: Color(ConstantesColorTema2
                                      .blanco), //Color.fromRGBO(109, 109, 109, 1),
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
