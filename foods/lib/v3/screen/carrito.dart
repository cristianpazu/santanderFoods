import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/v3/entities/descripcionMenu.dart';
import 'package:foods/v3/presentation/notifiers/items_notifiers/item_state_notifiers.dart';
import 'package:foods/v3/util/Sistema.dart';
import 'package:foods/v3/util/colores.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CarritoPage2 extends ConsumerStatefulWidget {

String? telefono;

   CarritoPage2( this.telefono);

  @override
  _CarritoPage2State createState() => _CarritoPage2State();
}

class _CarritoPage2State extends ConsumerState<CarritoPage2> {
  int valor = 0;
String? telefono;




  @override
  Widget build(BuildContext context) {
    final carrito = ref.watch(itemsStateNotifier);
 print('widget.telefono${widget.telefono}');

    final String? phone = widget.telefono;




    final total = carrito.fold<int>(0, (suma, itemState) {
      return suma +
          itemState.descripcionMenu.fold<int>(0, (subTotal, item) {
            final precio = Sistema().parsePrecio(item.precio);
            final cantidad = item.unidadesPedir ?? 1;
            return subTotal + (precio * cantidad);
          });
    });
//
    Future<void> _openWhatsApp() async {
      // Construir el mensaje con los productos
      String message = '🛒 *Pedido desde la app (SantanderFoods) 🛒  *\n\n';

      for (var itemState in carrito) {
        final item = itemState.descripcionMenu.first;
        final nombre = item.nombre ?? '';
        final descripcion = item.descripcion ?? '';
        final precio = item.precio ?? '';
        final unidades = item.unidadesPedir ?? 1;

        message += '• *$nombre* - $descripcion\n';

        message += ' - *cantidad:* $unidades\n  *Precio:* \ $precio\n\n';

        /*final salsas = item.salsasSeleccionadas!= [] ?? '';

        message +=
            '• *$nombre* - $descripcion\n - Salsas: $salsas\n - cantidad: $unidades\n  Precio: \$${precio}\n\n';*/
      }

      message += '🧾 *Total:* \$${total}';

      final Uri whatsappUrl = Uri.parse(
        'https://wa.me/$phone?text=${Uri.encodeComponent(message)}',
      );

      final launched =
          await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);

      if (launched) {
        // Mostrar confirmación al volver de WhatsApp
        await Future.delayed(
            const Duration(seconds: 1)); // espera un poco por seguridad

        if (!mounted) return;

        final shouldClear = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('¿Limpiar carrito?'),
            content: Text(
                '¿Confirmas que enviaste el pedido por WhatsApp y deseas vaciar el carrito?'),
            actions: [
              TextButton(
                child: Text('Cancelar'),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              ElevatedButton(
                child: Text('Sí, limpiar'),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          ),
        );

        if (shouldClear == true) {
          ref.read(itemsStateNotifier.notifier).limpiarCarrito();
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No se pudo abrir WhatsApp')),
        );
      }
    }

//
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
            child: ListView.separated(
              itemCount: carrito.length,
              separatorBuilder: (context, index) => SizedBox(height: 20),
              itemBuilder: (context, index) {
                final itemState = carrito[index];
                final DescripcionMenu item = itemState.descripcionMenu.first;
                return TarjetaComidaCarrito(
                    item.nombre, item.descripcion, item.precio, item.image, () {
                  ref.read(itemsStateNotifier.notifier).eliminarItems(item);
                }, () {
                  ref
                      .read(itemsStateNotifier.notifier)
                      .incrementarUnidades3(item.nombre);
                }, () {
                  print('0||| ${item.nombre}');
                  ref
                      .read(itemsStateNotifier.notifier)
                      .decrementarUnidades3(item.nombre);
                }, item.unidadesPedir);
              },
              /*  children: [
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
              ],*/
            ),
          ),
          //

          Container(
            width: double.infinity,
            height: 90,
            color: Color(ConstantesColorTema2
                .naraja), //Color.fromRGBO(109, 109, 109, 0.5),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Text(
                          '\$ ${Sistema().formato(total)}'), //Text(' \$ 20.000'),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            barrierDismissible:
                                false, // opcional (evita que se cierre tocando fuera)
                            builder: (BuildContext context) {
                              return Sistema().alertDialogEnviarPedido(context, _openWhatsApp);
                            },
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 70,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 247, 246, 242),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              'Enviar pedido',
                              style: GoogleFonts.leckerliOne(
                                  fontSize: 30,
                                  color: Color(ConstantesColorTema2
                                      .naraja) //Color.fromRGBO(109, 109, 109, 1)

                                  ),
                            ),
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
  final String? nombre;
  final String? descripcion;
  final String? precio;
  final String? images;
  final VoidCallback onDelete;
  final VoidCallback incrementarUnidades;
  final VoidCallback decrementarUnidades;
  final int? unidadesPedir;

  const TarjetaComidaCarrito(
      this.nombre,
      this.descripcion,
      this.precio,
      this.images,
      this.onDelete,
      this.incrementarUnidades,
      this.decrementarUnidades,
      this.unidadesPedir);

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
            color: Color(ConstantesColorTema2
                .naraja), //Color.fromRGBO(109, 109, 109, 1),
            borderRadius: BorderRadius.circular(20)),
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
                        widget.images ?? '', //'assets/salchipapas.jpg',
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
                        Text(widget.nombre ?? ''),
                        SizedBox(height: 8),
                        Text(
                          widget.descripcion ??
                              '', // 'hamburguesa "La hamburguesa del Oeste Salvaje": una torre de carne Angus a la plancha, cubierta con queso cheddar fundido, cebolla caramelizada y una generosa porción de salsa BBQ casera, todo en un panecillo de pretzel tostado.hamburguesa "La hamburguesa del Oeste Salvaje": una torre de carne Angus a la plancha, cubierta con queso cheddar fundido, cebolla caramelizada y una generosa porción de salsa BBQ casera, todo en un panecillo de pretzel tostado. ',
                          maxLines: 10,
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ),
                //
                ClipOval(
                    child: IconButton(
                        onPressed: () {
                          widget.onDelete();
                        },
                        icon: Icon(Icons.delete_forever_outlined))),
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
                        padding: const EdgeInsets.only(
                            right: 38.0, left: 38.0, top: 5),
                        child: Text(widget.precio ?? ''),
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
                                widget.incrementarUnidades();
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
                        child: Center(child: Text('${widget.unidadesPedir}')),
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
                                widget.decrementarUnidades();
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
