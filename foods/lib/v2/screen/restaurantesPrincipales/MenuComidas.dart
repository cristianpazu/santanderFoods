import 'package:flutter/material.dart';
import 'package:foods/v3/util/colores.dart';
import 'package:foods/widgets/chipsAll.dart';
import 'package:foods/widgets/CardComida.dart';
import 'package:foods/UI/atoms/textFiled.dart';
import 'package:foods/widgets/appbarComidas.dart';
import 'package:foods/Utils/ConstantesColor.dart';
import 'package:foods/v2/screen/item/CarritoPage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/v2/domain/entities/item/items.dart';
import 'package:foods/v2/screen/restaurantesPrincipales/DetalleComida.dart';
import 'package:foods/v2/domain/entities/restaurantes/NombreRestaurantes.dart';
import 'package:foods/v2/presentation/notifiers/items_notifiers/item_state_notifiers.dart';
import 'package:foods/v2/presentation/notifiers/Restaurante_notifiers/nombre_restaurante_notifier.dart';

class Menucomidas extends ConsumerWidget {
  final int idRestaurante;

  const Menucomidas({super.key, required this.idRestaurante});

/*
@override
  void initState() {
    super.initState();
    ref.read(restauranteProvider.notifier).loadRestaurante();
  } */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController _searchController = TextEditingController();
    final productState = ref.watch(nombrerestauranteProvider(idRestaurante));
    final cantidadEnCarrito = ref.watch(itemsStateNotifier).length;
      print('productState.isLoding ${productState.isLoding}');

    if (productState.isLoding!) {
      print('productState.isLoding ${productState.isLoding}');
      return Scaffold(

        body: Center(
          child: Image.network(
              'https://i.pinimg.com/originals/c4/cb/9a/c4cb9abc7c69713e7e816e6a624ce7f8.gif'),
        ),
      ); // const CircularProgressIndicator();
    }

    final menus = productState.informacion?.menu ?? [];

    final horarios = productState.informacion?.horario ?? [];

    final List<NombreRestaurante> todosLosRestaurantes =
        productState.nombrerestuarante!.cast<NombreRestaurante>().toList();

    print('todosLosRestaurantes $todosLosRestaurantes');

    final imagenRestaurante = todosLosRestaurantes.isNotEmpty
        ? todosLosRestaurantes.first.image ?? 'assets/proximamente.jpg'
        : 'assets/proximamente.jpg';

    final submenusUnicos =
        menus.map((menu) => menu.submenu ?? '').toSet().toList();

         print('submenusUnicosvsubmenusUnicos $submenusUnicos');
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Appbarcomidas(
              Textfields2(
                controller: _searchController,
                onChanged: (value) {},
              ),
              imagenRestaurante,
              InkWell(
                onTap: () {
                  print('Carrito icon pressed');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarritoPage(),
                      ));
                },
                child: Stack(
                  children: [
                    Positioned(
                        child: Container(
                      width: 20,
                      height: 16,
                      color: Colors.amber,
                      child: Center(child: Text('$cantidadEnCarrito')),
                    )),
                    Center(
                      child: Icon(Icons.shopping_cart_outlined),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: submenusUnicos.map((submenu) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: chipAll(submenu,(){}),
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: menus.length,
                itemBuilder: (context, index) {
                  //  final productStatess = todosLosRestaurantes[index];
                  final menuSate = menus[index];
                  final descrpconmenu = menuSate.descripcion;
        
        //                      final idss = productStatess
                  //                  .id;
                  /*
                  final nombreComida = menus[index].descripcion;
                  final nombres = nombreComida![index].nombre; */
        
        //print('<nombres> ${nombres}}');
      
        
                  final screenWidth = MediaQuery.of(context).size.width;
        
                  return Column(
                   
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            menuSate.submenu ?? '',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                          itemCount: descrpconmenu!.length,
                          shrinkWrap:
                              true, // para que ListView funcione dentro de otro
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, subIndex) {
                            final item = descrpconmenu[subIndex];
        
                            final Items itemss = Items(
                              nombre: item.nombre,
                              descripcion: item.descripcion,
                              precio: item.precio,
                              unidades: item.unidades,
                              image: item
                                  .image, // Si quieres incluir la imagen también
                              // O lo que corresponda en tu caso
                            );
        
                            print('item $item');
                            final imagePath = item.image == "" || item.image ==null
                                ? 'assets/proximamente.jpg'
                                : item.image;
        
                            return Cardcomida(
                                imagePath!,
                                '${item.nombre}',
                                screenWidth,
                                Detallecomida(
                                  imagePath,
                                  '${item.nombre}',
                                  '${item.descripcion}',
                               [],
                                  '${item.precio}',
                                  (List<String> salsasSeleccionadas) {
    return ElevatedButton(
      onPressed: () {
        final itemConSalsas = Items(
          nombre: item.nombre,
          descripcion: item.descripcion,
          precio: item.precio,
          unidades: item.unidades,
          image: item.image,
          salsasSeleccionadas: salsasSeleccionadas,
        );

        final agregado = ref.read(itemsStateNotifier.notifier).agregarItems(itemConSalsas,productState.id);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              behavior: SnackBarBehavior.floating,
             backgroundColor: Color(ConstantesColorTema2.blanco),
            content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text(agregado
                 ? '✅ Se añadió exitosamente al carrito'
               : '⚠️ El producto ya está en el carrito  O ⚠️ Solo puedes agregar productos de un restaurante.\n  Vacía el carrito o finaliza tu pedido.'),
            ),
            duration: Duration(seconds: 22),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(ConstantesColorTema.fondoColorAppbar),
        foregroundColor: Color(ConstantesColorTema.blanco),
      ),
      child: Text('Agregar Producto'),
    );
  },
)
                      /*  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(
                                            ConstantesColorTema.fondoColorAppbar),
                                        foregroundColor:
                                            Color(ConstantesColorTema.blanco)),
                                    onPressed: () {
                                      final agregado = ref
                                          .read(itemsStateNotifier.notifier)
                                          .agregarItems(itemss);
        
                                      print('agregado $agregado');
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            agregado
                                                ? '✅ Se añadió exitosamente al carrito'
                                                : '⚠️ El producto ya está en el carrito',
                                          ),
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                    },
                                    child: Text('Agregar Producto'),
                                  ), */
                               // )
                                );
                          }),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
