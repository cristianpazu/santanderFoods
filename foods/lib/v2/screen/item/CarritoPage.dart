import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/Utils/ConstantesColor.dart';
import 'package:foods/v2/domain/entities/item/items.dart';
import 'package:foods/v2/presentation/notifiers/items_notifiers/item_state_notifiers.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class CarritoPage extends ConsumerStatefulWidget {
  const CarritoPage({Key? key}) : super(key: key);

  @override
  _CarritoPageState createState() => _CarritoPageState();
}

class _CarritoPageState extends ConsumerState<CarritoPage> {
  @override
  Widget build(BuildContext context) {
    final carrito = ref.watch(itemsStateNotifier);
    final String phone = '573217780678';
    final formatter = NumberFormat('#,##0.00', 'es_ES');

    double total = carrito.fold(0, (suma, itemState) {
      final precioStr = itemState.menuDescripcion.isNotEmpty
          ? itemState.menuDescripcion.first.precio ?? '0'
          : '0';
  final menuItem = itemState.menuDescripcion.first;
      print('precioStr original: "$precioStr"');

       final unidades = menuItem.unidadesPedir ?? 1;

      // Limpia el string: quita puntos, cambia coma decimal a punto, quita símbolos y espacios
      final limpio = precioStr
          .replaceAll('.', '') // Quitar puntos de miles
          .replaceAll(',', '.') // Cambiar coma decimal por punto
          .replaceAll(
              RegExp(r'[^0-9.]'), '') // Quitar todo excepto números y punto
          .trim();

      print('precioStr limpio para parsear: "$limpio"');

      final precio = double.tryParse(limpio) ?? 0;

      print('precio parsed: $precio');

      return suma + (precio * unidades);
    }); 

    print('total sin formatear: $total');

    String totalFormateado = formatter.format(total);

    print('total formateado: $totalFormateado');

    Future<void> _openWhatsApp() async {
      // Construir el mensaje con los productos
      String message = '🛒 *Pedido desde la app:*\n\n';

      for (var itemState in carrito) {
        final item = itemState.menuDescripcion.first;
        final nombre = item.nombre ?? '';
        final descripcion = item.descripcion ?? '';
        final precio = item.precio ?? '';
         final unidades = item.unidadesPedir ?? 1;

        message += '• *$nombre* - $descripcion\n - cantidad: $unidades\n  Precio: \$${precio}\n\n';
      }

      message += '🧾 *Total:* \$${totalFormateado}';

      final Uri whatsappUrl = Uri.parse(
        'https://wa.me/$phone?text=${Uri.encodeComponent(message)}',
      );

      if (!await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication)) {
        throw Exception('No se pudo abrir WhatsApp');
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('Carrito')),
      body: carrito.isEmpty
          ? Center(child: Text('No hay productos en el carrito.'))
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: carrito.length,
                    separatorBuilder: (context, index) => SizedBox(height: 18),
                    itemBuilder: (context, index) {
                      final itemState = carrito[index];
                      final item = itemState.menuDescripcion.first;

                      print('itemitemitem ${item.precio}');
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(ConstantesColorTema.fondoColorAppbar),
                          ),
                          height: 200,
                          child: Column(
                            children: [
                              Expanded(
                                child: ListTile(
                                  leading: Image.asset(item.image ?? ''),
                                  title: Text(item.nombre ?? ''),
                                  subtitle: Text(item.descripcion ?? ''),
                                  trailing: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Text('\$${item.precio}'),
                                        Container(
                                          height: 40,
                                          width: 40,
                                          child: Center(
                                              child: IconButton(
                                                  onPressed: () {
                                                    ref
                                                        .read(itemsStateNotifier
                                                            .notifier)
                                                        .eliminarItems(item);
                                                  },
                                                  icon: Icon(Icons
                                                      .delete_forever_outlined))),
                                        ),

                                        /*Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 10,
                                                  height: 10,
                                                  color: Colors.amber,
                                                ),
                                                Text('data'),
                                                Container(
                                                  width: 10,
                                                  height: 10,
                                                  color: Colors.amber,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ) */
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:BorderRadius.circular(20), 
                                      color: Colors.blue,
                                      ),
                                      width: 50,
                                      height: 50,
                                      child: Center(child: IconButton(onPressed: (){
                                        ref.read(itemsStateNotifier.notifier).incrementarUnidades(item.nombre!);
                                      }, icon: Icon(Icons.add))),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      color: Colors.green,
                                      child: Center(
                                        child: Text(' ${item.unidadesPedir  ?? 1}'),
                                      ),
                                    ),

                                     SizedBox(
                                      width: 25,
                                    ),
                                    Container(
                                      width: 50,
                                      height: 50,
                                   decoration: BoxDecoration(
                                        borderRadius:BorderRadius.circular(20), 
                                      color: Colors.blue,
                                      ),
                                      child: Center(child:IconButton(onPressed: (){
                                          ref.read(itemsStateNotifier.notifier).decrementarUnidades(item.nombre!);
                                      }, icon: Icon(Icons.remove),)),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },

                    //
                  ),

                  //
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('\$${totalFormateado}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                //
                Center(
                  child: ElevatedButton(
                    onPressed: _openWhatsApp,
                    child: Text('Abrir WhatsApp'),
                  ),
                ),
              ],
            ),
    );
    /* Scaffold(
      appBar: AppBar(
        title: Text('Carrito de Compras'),
      ),
      body: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.amber,
            child: // Botón para agregar un nuevo item
                ElevatedButton(
              onPressed: () {
                final item = Items(
                  id: 1,
                  nombre: 'Pizza',
                  descripcion: 'Pizza con ingredientes frescos',
                  image: 'path_to_image',
                  unidades: '1',
                  precio: '12.99',
                );
                ref.read(itemsStateNotifier.notifier).agregarItems(item);
              },
              child: Text('Agregar Producto'),
            ),
          ),

          // Mostrar productos en el carrito
          Expanded(
            child: ListView.builder(
              itemCount: carrito.length,
              itemBuilder: (context, index) {
                final itemState = carrito[index];
                final item = itemState
                    .menuDescripcion[0]; // Asumiendo un solo menú por item

                print('object|||||||itemState| ${itemState}');

                return ListTile(
                  title: Text(item.nombre ?? ''),
                  subtitle: Text(
                      'Precio: \$${item.precio} | Cargando: ${itemState.isLoding}'),
                  trailing: itemState.isLoding!
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            // Cambiar estado a loading al hacer click
                            ref
                                .read(itemsStateNotifier.notifier)
                                .cambiarEstado(itemState.id, true);
                          },
                          child: Text('Procesar'),
                        ),
                );
              },
            ),
          ),

          // Botón para limpiar el carrito
          ElevatedButton(
            onPressed: () {
              ref.read(carritoProvider.notifier).limpiarCarrito();
            },
            child: Text('Limpiar Carrito'),
          ),
        ],
      ),
    ); */
  }
}
