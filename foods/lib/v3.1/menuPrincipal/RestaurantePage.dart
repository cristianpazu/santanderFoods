import 'package:flutter/material.dart'
    show
        AppBar,
        BorderRadius,
        BoxDecoration,
        BoxShadow,
        BuildContext,
        Card,
        Center,
        Checkbox,
        CircleAvatar,
        CircularProgressIndicator,
        ClipRRect,
        Color,
        Colors,
        Column,
        Container,
        CrossAxisAlignment,
        EdgeInsets,
        ElevatedButton,
        Expanded,
        FontWeight,
        Icon,
        IconButton,
        Icons,
        ListView,
        MainAxisAlignment,
        MaterialPageRoute,
        Navigator,
        NeverScrollableScrollPhysics,
        Padding,
        RoundedRectangleBorder,
        Row,
        Scaffold,
        SizedBox,
        Text,
        TextStyle,
        Widget,
        circular,
        showModalBottomSheet;
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState;
import 'package:foods/v3.1/menuPrincipal/CurvaPortadaClipper.dart'
    show CurvaPortadaClipper;
import 'package:foods/v3.1/menuPrincipal/comidaId.dart' show Comidaid;
import 'package:foods/v3.1/menuPrincipal/menuPrincipal.dart'
    show RestaurantePage;
import 'package:foods/v3.1/notifiers/resturanteNotifiers/Resturante_notifiers.dart'
    show resturantesStateNotifierProvider;
import 'package:foods/v3.1/notifiers/resturanteNotifiers/detalle_restaurante_notifire.dart'
    show restauranteDetalleProvider;

class Restaurantespage extends ConsumerStatefulWidget {
  final int idRestaurante;

  const Restaurantespage({super.key, required this.idRestaurante});

  @override
  _RestaurantePageState createState() => _RestaurantePageState();
}

class _RestaurantePageState extends ConsumerState<Restaurantespage> {
  bool isChecked = false;
  final Map<int, bool> seleccionados = {};

  @override
  Widget build(BuildContext context) {
    final restauranteState =
        ref.watch(restauranteDetalleProvider(widget.idRestaurante));

    void _openIconButtonPressed(
      int? id,
  String? images,
  String? nombre,
  String? descripcion,
  int? precios) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) => Scaffold(
          backgroundColor: Colors.transparent,
          body: Comidaid(
            id: id,
            images: '',
            nombre: nombre,
            descripcion: descripcion,
            precios: precios,
          ),
        ),
      );
    }

/*
final carritoState =
    ref.watch(carritoStateNotifier);


int calcularTotal(Carritostate carritoState) {
  return carritoState.items.fold(
    0,
    (total, item) => total + item.total,
  );
}
*/

    if (restauranteState.isLoding!) {
      print('entreee aquuuiii');
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (restauranteState.restaurantecompletoresponsedto == null) {
      return const Scaffold(
        body: Center(
          child: Text('No hay información'),
        ),
      );
    }

    final menus = restauranteState.restaurantecompletoresponsedto?.menus;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PORTADA CON CURVA
            SizedBox(
              height: 220,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // IMAGEN DE PORTADA
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: 220,
                    child: ClipPath(
                      clipper: CurvaPortadaClipper(),
                      child: Image.asset(
                        'assets/hamburgesaConCrema.jpg',
                        width: double.infinity,
                        height: 220,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // REGRESAR
                  Positioned(
                    top: 45,
                    left: 15,
                    child: CircleAvatar(
                      backgroundColor: Colors.black45,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),

                  // FAVORITOS
                  /*
            Positioned(
              top: 45,
              right: 15,
              child: CircleAvatar(
                backgroundColor: Colors.black45,
                child: IconButton(
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.amber,
                  ),
                  onPressed: () {},
                ),
              ),
            ), */

                  // LOGO
                  Positioned(
                    bottom: 0,
                    left: 15,
                    child: Container(
                      width: 80,
                      height: 80,
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/hamburgesaConCrema.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // NOMBRE DEL RESTAURANTE
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 5, 16, 10),
              child: Text(
                restauranteState.restaurantecompletoresponsedto!.nombre,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //Direccion
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 16, 10),
              child: Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  Text(
                    restauranteState.restaurantecompletoresponsedto!.direccion,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                     
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF647786),
                      letterSpacing: 0.2,
                    ),
                  )
                ],
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 16, 10),
              child: Text(
                'Santander de Quilichao',
                style: const TextStyle(
                  fontFamily: 'Roboto',
                 
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF647786),
                  letterSpacing: 0.2,
                ),
              ),
            ),
            // telefono
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 16, 10),
              child: Row(
                children: [
                  Icon(Icons.phone),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    restauranteState.restaurantecompletoresponsedto!.telefono,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                  
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF647786),
                      letterSpacing: 0.2,
                    ),
                  )
                ],
              ),
            ),

            /* Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/hamburgesaConCrema.jpg',
                          width: 75,
                          height: 85,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                //
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                         padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        restauranteState.restaurantecompletoresponsedto!.nombre,
                        style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),
                        
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  restauranteState.restaurantecompletoresponsedto!.nombre,
                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                ),
              ],
            ), */
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: menus?.length,
              itemBuilder: (context, menuIndex) {
                final menu = menus?[menuIndex];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        menu!.nombreMenu,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: menu.submenus.length,
                      itemBuilder: (context, subIndex) {
                        final subMenu = menu.submenus[subIndex];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              child: Text(
                                subMenu.nombre,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: subMenu.productos.length,
                              itemBuilder: (context, productIndex) {
                                final producto =
                                    subMenu.productos[productIndex];

                                final productos =
                                    subMenu.productos[productIndex];
                                /*
              final existe = carritoState.items.any(
                (e) => e.idProducto == productos.id,
              );  */

                                return Card(
                                  elevation: 3,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: /*Container(
                                            width: 85,
                                            height: 90,
                                            color: Colors.green,
                                          ), */
                                              Image.asset(
                                            'assets/hamburgesaConCrema.jpg',
                                            width: 75,
                                            height: 85,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                producto.nombre!,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                producto.descripcion!,
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              const SizedBox(height: 12),
                                              Text(
                                                '\$${producto.precio}',
                                                style: const TextStyle(
                                                  color: Color.fromRGBO(
                                                      244, 81, 30, 1),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  244, 81, 30, 1),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Center(
                                            child: IconButton(
                                                onPressed: () {
                                                  print('object ${producto.nombre}');
                                                  _openIconButtonPressed(
producto.id,
'',
producto.nombre,
producto.descripcion,
producto.precio
                                                  );
                                                },
                                                icon: Icon(Icons.add,
                                                
                                                color: Colors.white,
                                                )),
                                          ),
                                        )
                                        /*
                                        Checkbox(
                                          value: existe,//seleccionados[producto.id] ?? false,
                                          onChanged: (value) {
                                           if (value == true) {
            
            ref
                .read(carritoStateNotifier.notifier)
                .agregarProducto(producto);
            
                } else {
            
            ref
                .read(carritoStateNotifier.notifier)
                .eliminarProducto(producto.id);
            
                }
                                           
                                           /* setState(() {
                                              seleccionados[producto.id] = value!;
            
                                              if (value == true) {
                                                ref
                                                    .read(
                                                        carritoStateNotifier.notifier)
                                                    .agregarProducto(producto);
                                              } else {
                                                ref
                                                    .read(
                                                        carritoStateNotifier.notifier)
                                                    .eliminarProducto(producto.id);
                                              }
                                            }); */
                                          },
                                        ), */
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black12,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ), /*
            Text(
              '\$${calcularTotal(carritoState)}',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ), */
            /* ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>  CarritoPage(
                      idMesa: widget.idMesas,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.shopping_cart,
              ),
              label: const Text(
                'Carrito',
              ),
            ), */
          ],
        ),
      ),
    );
  }
}
