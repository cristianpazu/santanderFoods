import 'package:flutter/material.dart'
    show AppBar, BorderRadius, BoxDecoration, BoxShadow, BuildContext, Card, Center, Checkbox, CircularProgressIndicator, Color, Colors, Column, Container, CrossAxisAlignment, EdgeInsets, ElevatedButton, Expanded, FontWeight, Icon, IconButton, Icons, ListView, MainAxisAlignment, MaterialPageRoute, Navigator, NeverScrollableScrollPhysics, Padding, RoundedRectangleBorder, Row, Scaffold, SizedBox, Text, TextStyle, Widget;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState;
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
      body: Column(
        children: [
          Text(
            restauranteState.restaurantecompletoresponsedto!.nombre,
          ),
          Expanded(
            child: ListView.builder(
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
                                    padding: const EdgeInsets.all(18),
                                    child: Row(
                                      children: [
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
                                                    color: Color.fromRGBO(244, 81, 30, 1),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                          color: Color.fromRGBO(244, 81, 30, 1),
                                            borderRadius: BorderRadius.circular(10)
                                          ),
                                          child: Center(

                                            child: IconButton(onPressed: (){}, icon: Icon(Icons.add)),
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
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
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
