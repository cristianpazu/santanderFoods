import 'package:flutter/material.dart';
import 'package:foods/widgets/chipsAll.dart';
import 'package:foods/UI/atoms/textFiled.dart';
import 'package:foods/widgets/CardComida.dart';
import 'package:foods/Utils/ConstantesColor.dart';
import 'package:foods/widgets/appbarComidas.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/v2/screen/item/CarritoPage.dart';
import 'package:foods/v2/domain/entities/item/items.dart';
import 'package:foods/v2/screen/restaurantesPrincipales/DetalleComida.dart';
import 'package:foods/v2/domain/entities/comidas_rapidas/NombreComidaRapidas.dart';
import 'package:foods/v2/presentation/notifiers/items_notifiers/item_state_notifiers.dart';
import 'package:foods/v2/presentation/notifiers/Comida_rapida_notifiers/nombre_comida_notifiers.dart';

class MenucomidasRapidas extends ConsumerWidget {
  final int idRestaurante;

  const MenucomidasRapidas({super.key, required this.idRestaurante});

/*
@override
  void initState() {
    super.initState();
    ref.read(restauranteProvider.notifier).loadRestaurante();
  } */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController _searchController = TextEditingController();
    final productState =
        ref.watch(nombreComidaRapidaRestauranteProvider(idRestaurante));
    final cantidadEnCarrito = ref.watch(itemsStateNotifier).length;

    if (productState.isLoding!) {
      return Scaffold(
        body: Center(
          child: Image.asset('assets/proximamente.jpg'),
        ),
      ); // const CircularProgressIndicator();
    }

    final menus = productState.menuComidaRapidas ?? [];
    final List<NombreComidaRapida> todosLosRestaurantes =
        productState.nombreComidaRapida!.cast<NombreComidaRapida>().toList();

    final imagenRestaurante = todosLosRestaurantes.isNotEmpty
        ? todosLosRestaurantes.first.image ?? 'assets/proximamente.jpg'
        : 'assets/proximamente.jpg';

    final submenusUnicos =
        menus.map((menu) => menu.submenu ?? '').toSet().toList();
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
                    child: chipAll(submenu, () {}),
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: menus.length,
                itemBuilder: (context, index) {
                  final menuSate = menus[index];
                  final descrpconmenu = menuSate.descripcion;
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

                          

                            final salsasMapList = item.salsas
                                ?.map((salsa) => salsa.toJson())
                                .toList();
                            final Items itemss = Items(
                                nombre: item.nombre,
                                descripcion: item.descripcion,
                                precio: item.precio,
                                unidades: item.unidades,
                                image: item.image,
                                salsasSeleccionadas: item.salsas
                                    ?.where((s) => s.nombre != null)
                                    .map((s) => s.nombre!)
                                    .toList());


                            final imagePath = item.image == ""
                                ? 'assets/proximamente.jpg'
                                : item.image;
                            print(item.image == "");
                            return Cardcomida(
                                'assets/proximamente.jpg',
                                item.nombre,
                                screenWidth,
                                Detallecomida(
                                  'assets/proximamente.jpg',
                                  item.nombre,
                                  item.descripcion,
                                  salsasMapList,
                                  item.precio,
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

        final agregado = ref.read(itemsStateNotifier.notifier).agregarItems(itemConSalsas);



        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(agregado
             ? '✅ Se añadió exitosamente al carrito'
                                                : '⚠️ El producto ya está en el carrito',),
            duration: Duration(seconds: 2),
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
                                  /*ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(
                                            ConstantesColorTema
                                                .fondoColorAppbar),
                                        foregroundColor:
                                            Color(ConstantesColorTema.blanco)),
                                    onPressed: () {
                                      print('agregado ${itemss}');
                                      final agregado = ref
                                          .read(itemsStateNotifier.notifier)
                                          .agregarItems(itemss);

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
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
                                //)
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
