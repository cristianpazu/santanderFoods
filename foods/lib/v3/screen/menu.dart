import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foods/v3/presentation/notifiers/comida_rapida_notifiers/nombre_comida_rapida_2_state.dart';
import 'package:foods/v3/presentation/notifiers/items_notifiers/buscar.dart';
import 'package:foods/v3/util/Sistema.dart';
import 'package:foods/widgets/drawer.dart';
import 'package:foods/v3/util/colores.dart';
import 'package:foods/v3/screen/carrito.dart';
import 'package:foods/widgets/infoComida2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/v3/entities/descripcionMenu.dart';
import 'package:foods/v3/presentation/notifiers/items_notifiers/item_state_notifiers.dart';
import 'package:foods/v3/presentation/notifiers/comida_rapida_notifiers/nombre_comida_2_notifiers.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MenuPage extends ConsumerStatefulWidget {
  final int idRestaurante;
  MenuPage(this.idRestaurante);
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends ConsumerState<MenuPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Map<String, GlobalKey> _submenuKeys = {};
  bool _isProgrammaticScroll = false;
  // Clave para manejar el Drawer
  final ScrollController _scrollController = ScrollController();
  final Map<String, double> _submenuOffsets = {};
  final ScrollController _submenuScrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener =
      ItemPositionsListener.create();

  int _selectedSubmenuIndex = 0;

  @override
  void initState() {
    super.initState();

    _itemPositionsListener.itemPositions.addListener(_onScroll);
  }

  @override
  void dispose() {
    _submenuScrollController.dispose();
    _submenuScrollController.dispose();
    _scrollController.dispose();
    _itemPositionsListener.itemPositions.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (_isProgrammaticScroll) return;

    final positions = _itemPositionsListener.itemPositions.value;
    if (positions.isEmpty) return;

    // Tomamos el item cuyo centro está más cerca del top visible
    final item = positions
        .where(
            (item) => item.itemLeadingEdge < 0.3 && item.itemTrailingEdge > 0.3)
        .toList();

    if (item.isEmpty) return;

    final currentIndex = item.first.index;

    if (_selectedSubmenuIndex != currentIndex) {
      setState(() {
        _selectedSubmenuIndex = currentIndex;
      });
      //
      _submenuScrollController.animateTo(
        currentIndex * 120.0, // ancho aproximado del item
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final productState =
        ref.watch(nombreComidaRapidaRestaurante2Provider(widget.idRestaurante));
    print('objectproductState ${productState.nombreComidaRapida}');
    print('objectproductState ${productState.menuComidaRapidas?.length}');
    final cantidadEnCarrito = ref.watch(itemsStateNotifier).length;

    print('cantidadEnCarrito $cantidadEnCarrito');

    if (productState.isLoding!) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // final menus = productState.menuComidaRapidas ?? [];

    //final descrpconmenu = menus.isNotEmpty ? menus[0].descripcion : [];

    print(
        'objectproductState objectproductState menus ${productState.nombreComidaRapida!.length}');

    final restaurantes = productState.nombreComidaRapida ?? [];
    final filteredItems = ref.watch(filteredMenuProvider(widget.idRestaurante));

//telefono
    final contactos =
        restaurantes.map((restaurante) => restaurante.contacto).toList();
    final String? telefono =
        restaurantes.isNotEmpty ? restaurantes.first.contacto : null;

    //nombre restaurante

    final String? nombreRestaurante =
        restaurantes.isNotEmpty ? restaurantes.first.nombres : null;

    print('alltimes ${contactos}');

    final submenusUnicos = filteredItems
        .map((e) => e['submenu'] as String?)
        .where((s) => s != null && s.isNotEmpty)
        .toSet()
        .toList();

    for (var submenu in submenusUnicos) {
      _submenuKeys.putIfAbsent(submenu!, () => GlobalKey());
    }
    /*
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      _submenuKeys.forEach((submenu, key) {
        final ctx = key.currentContext;
        if (ctx == null) return;

        final box = ctx.findRenderObject() as RenderBox?;
        if (box == null) return;

        final position =
            box.localToGlobal(Offset.zero).dy + _scrollController.offset;

        _submenuOffsets[submenu] = position;
      });
    }); */
    final itemsPorSubmenu = {
      for (var submenu in submenusUnicos)
        submenu: filteredItems.where((e) => e['submenu'] == submenu).toList(),
    };
    final cartStates = ref.watch(itemsStateNotifier);

    /*final total = cartStates.fold<double>(0, (sum, state) {
  final subtotal = state.descripcionMenu.fold<double>(0, (sub, item) {

    // 👇 AQUÍ VA EXACTAMENTE
    final precio = double.tryParse(
      item.precio
          ?.replaceAll(RegExp(r'[^0-9.]'), '') ?? '0',
    ) ?? 0;

    final unidades = item.unidadesPedir ?? 1;

    return sub + (precio * unidades);
  });

  return sum + subtotal;
}); */

    final total = cartStates.fold<int>(0, (suma, itemState) {
      return suma +
          itemState.descripcionMenu.fold<int>(0, (subTotal, item) {
            final precio = Sistema().parsePrecio(item.precio);
            final cantidad = item.unidadesPedir ?? 1;
            return subTotal + (precio * cantidad);
          });
    });

/*
    final submenusUnicos = allItems
        .map((e) => e['submenu'] as String?)
        .where((s) => s != null && s.isNotEmpty)
        .toSet()
        .toList();

    final itemsPorSubmenu = {
      for (var submenu in submenusUnicos)
        submenu: allItems.where((e) => e['submenu'] == submenu).toList(),
    }; */

    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 247, 247, 0.96),
      key: _scaffoldKey,
      drawer: DrawerPage(
        nombreRestaurante: nombreRestaurante,
      ),
      body: SafeArea(
          child:  ResponsiveBreakpoints.of(context).isDesktop
        ?   _buildWebLaout(submenusUnicos, itemsPorSubmenu, productState, cantidadEnCarrito, total, context, telefono)
:
          
          _buildMobileLaout(submenusUnicos, itemsPorSubmenu, productState, cantidadEnCarrito, total, context, telefono)),

      /* Column(
        children: [
          Container(
            child: Text('data'),
          )
        ],
      ),
        appBar:  PreferredSize(

        preferredSize: Size.fromHeight(80),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
            child: AppBar(
            backgroundColor:Color.fromARGB(231, 26, 223, 223) ,
            title: Text('Foods',style: GoogleFonts.leckerliOne(),),
            leading: Container(
              
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
                 boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Color de la sombra
                  blurRadius: 8.0, // Difusión de la sombra
                  offset: Offset(0, 4), // Desplazamiento de la sombra
                ),
              ],
              ),
              child: IconButton(
                icon: Icon(Icons.menu), // Puedes cambiarlo por otro ícono
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer(); // Abre el drawer manualmente
                },
              ),
            ),
          ),
        ),
      ), */
    );
  }

  Widget _buildMobileLaout(List<String?> submenusUnicos, Map<String?, List<Map<String, dynamic>>> itemsPorSubmenu, NombreComidaRapida2State productState, int cantidadEnCarrito, int total, BuildContext context, String? telefono) {
  print('mobileeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
    return Column(
      children: [
        _header(),
        _search(),
        SizedBox(
          height: 10,
        ),
        _submenuHorizontal(submenusUnicos),
        //
        SizedBox(
          height: 10,
        ),
        //
        _listaComidas(submenusUnicos, itemsPorSubmenu, productState),

        /*  ListView.builder(
              itemCount: allItems.length, //descrpconmenu!.length,
              itemBuilder: (context, index) {
                //  final menuSate = descrpconmenu[index];
                final entry = allItems[index];
                final restaurante =
                    entry['restaurante'] as NombreComidaRapida2;
                final submenu = entry['submenu'] as String?;
                final item = entry['item'] as DescripcionMenu;

                return Column(
                  children: [
                    tarjetaComida(item.image, item.nombre, item.descripcion,
                        item.precio),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                );
              }
              //comentar despoues
             children: [
              tarjetaComida(),
              SizedBox(
                height: 20,
              ),
              tarjetaComida(),
              SizedBox(
                height: 20,
              ),
              tarjetaComida(),
              SizedBox(
                height: 20,
              ),
              tarjetaComida(),
            ], 
              ), 
        ),*/
        SizedBox(
          height: 10,
        ),
        cantidadEnCarrito > 0
            ? _bottomCarrito(total, context, telefono)
            : Container(),
      ],
    );



  }
//WEB//

  Widget _buildWebLaout(List<String?> submenusUnicos, Map<String?, List<Map<String, dynamic>>> itemsPorSubmenu, NombreComidaRapida2State productState, int cantidadEnCarrito, int total, BuildContext context, String? telefono) {
    print('WEEEEEEEEEEEEEEEEEEEEEEEBBBBBBBBBBBBBBBBBBBBBBBBBB');
    
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
               
              _headerWeb(),
               SizedBox(
                height: 10,
              ),
              _search(),
              SizedBox(
                height: 10,
              ),
           //   _submenuHorizontalWeb(submenusUnicos),
              //
              SizedBox(
                height: 10,
              ), 
             

              Expanded(child: _gridComidas(submenusUnicos, itemsPorSubmenu, productState)),
          
              /*  ListView.builder(
                    itemCount: allItems.length, //descrpconmenu!.length,
                    itemBuilder: (context, index) {
                      //  final menuSate = descrpconmenu[index];
                      final entry = allItems[index];
                      final restaurante =
                          entry['restaurante'] as NombreComidaRapida2;
                      final submenu = entry['submenu'] as String?;
                      final item = entry['item'] as DescripcionMenu;
          
                      return Column(
                        children: [
                          tarjetaComida(item.image, item.nombre, item.descripcion,
                              item.precio),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    }
                    //comentar despoues
                   children: [
                    tarjetaComida(),
                    SizedBox(
                      height: 20,
                    ),
                    tarjetaComida(),
                    SizedBox(
                      height: 20,
                    ),
                    tarjetaComida(),
                    SizedBox(
                      height: 20,
                    ),
                    tarjetaComida(),
                  ], 
                    ), 
              ),*/
              SizedBox(
                height: 10,
              ),
              cantidadEnCarrito > 0
                  ? _bottomCarrito(total, context, telefono)
                  : Container(),
            ],
          ),
        ),
      ],
    );



  }


//
  Hero _bottomCarrito(int total, BuildContext context, String? telefono) {
    return Hero(
                tag: 'as',
                child: Container(
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
                              '\$ ${Sistema().formato(total)}',
                              style: GoogleFonts.leckerliOne(
                                        color: Color(ConstantesColorTema2
                                            .blanco))
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CarritoPage2(telefono),
                                    ));
                              },
                              child: Container(
                                width: 150,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 247, 246, 242),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    'Carrito',
                                    style: TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w600, // SemiBold
  fontSize: 30,
  color: Color(ConstantesColorTema2.naranja2) //GoogleFonts.leckerliOne(fontSize: 30,color: Color(ConstantesColorTema2.naraja) //Color.fromRGBO(109, 109, 109, 1)

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
              );
  }

  Expanded _listaComidas(List<String?> submenusUnicos, Map<String?, List<Map<String, dynamic>>> itemsPorSubmenu, NombreComidaRapida2State productState) {
    return Expanded(
          child: ScrollablePositionedList.builder(
            itemScrollController: _itemScrollController,
            itemPositionsListener: _itemPositionsListener,
            itemCount: submenusUnicos.length,
            itemBuilder: (context, index) {
              final submenu = submenusUnicos[index];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      submenu!,
                      style: GoogleFonts.leckerliOne(
                        fontSize: 2,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  ...itemsPorSubmenu[submenu]!.map((entry) {
                    final item = entry['item'] as DescripcionMenu;

                  if (item.salsas != null) {
for (var salsa in item.salsas!) {
  print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<< ${salsa.nombre}');
}
}
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: tarjetaComida(
                        productState.id,
                        item.id,
                        item.image,
                        item.nombre,
                        item.descripcion,
                        item.precio,
                        item.unidadesPedir.toString(),
                        item.salsas
                                  ?.where((s) => s.nombre != null)
                                  .map((s) => s.nombre!)
                                  .toList()
                      ),
                    );
                  }),
                ],
              );
            },
          ),
        );
  }
  //----web--//
  /*
  Widget _gridComidas(List<String?> submenusUnicos, Map<String?, List<Map<String, dynamic>>> itemsPorSubmenu, NombreComidaRapida2State productState) {
  return ListView.builder(
    padding: const EdgeInsets.all(20),
    itemCount: submenusUnicos.length,
    itemBuilder: (context, index) {
      final submenu = submenusUnicos[index];
      
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              submenu ?? '',
              style: GoogleFonts.leckerliOne(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          // Aquí tenemos el GridView, mostrando las tarjetas como en varias columnas
          Container(
            color: Colors.blue,
            height: 150,  // Ajusta la altura de acuerdo a tus necesidades
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true, // Hace que el GridView ocupe el espacio de su contenido
              physics: NeverScrollableScrollPhysics(),  // Desactiva el scroll interno del GridView
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,  // 3 columnas en escritorio, 1 en móvil
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1.5,  // Ajusta el aspecto de las celdas
              ),
              itemCount: itemsPorSubmenu[submenu]?.length ?? 0,
              itemBuilder: (context, gridIndex) {
                final item = itemsPorSubmenu[submenu]?[gridIndex]['item'] as DescripcionMenu;

                return tarjetaComida2(
                  productState.id,
                  item.id,
                  item.image,
                  item.nombre,
                  item.descripcion,
                  item.precio,
                  item.unidadesPedir.toString(),
                  item.salsas?.where((s) => s.nombre != null).map((s) => s.nombre!).toList(),
                );
              },
            ),
          ),
        ],
      );
    },
  );
} */
Widget _gridComidas(List<String?> submenusUnicos, Map<String?, List<Map<String, dynamic>>> itemsPorSubmenu, NombreComidaRapida2State productState) {
  return ListView.builder(
    padding: const EdgeInsets.all(20),
    itemCount: submenusUnicos.length,
    itemBuilder: (context, index) {
      final submenu = submenusUnicos[index];

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              submenu ?? '',
              style: GoogleFonts.leckerliOne(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          // Aquí tenemos el GridView, mostrando las tarjetas como en varias columnas
          Container(
            // El contenedor puede ser flexible o un tamaño dinámico
            //height: 150, // Remover height fijo, lo que es redundante cuando usas shrinkWrap
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,  // Hace que el GridView ocupe el espacio de su contenido
              physics: NeverScrollableScrollPhysics(),  // Desactiva el scroll interno del GridView
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,  // 3 columnas en escritorio, 1 en móvil
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1.5,  // Ajusta el aspecto de las celdas (puedes ajustar esto)
              mainAxisExtent: 170,
              ),
              itemCount: itemsPorSubmenu[submenu]?.length ?? 0,
              itemBuilder: (context, gridIndex) {
                final item = itemsPorSubmenu[submenu]?[gridIndex]['item'] as DescripcionMenu;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: tarjetaComida2(
                    productState.id,
                    item.id,
                    item.image,
                    item.nombre,
                    item.descripcion,
                    item.precio,
                    item.unidadesPedir.toString(),
                    item.salsas?.where((s) => s.nombre != null).map((s) => s.nombre!).toList(),
                  ),
                );
              },
            ),
          ),
        ],
      );
    },
  );
}

  ///
   Widget _gridComidas2(List<String?> submenusUnicos, Map<String?, List<Map<String, dynamic>>> itemsPorSubmenu, NombreComidaRapida2State productState) {
    return GridView.builder(
         padding: const EdgeInsets.all(20),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount:
         1,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      childAspectRatio: 3,
    ),
            itemCount: submenusUnicos.length,
            itemBuilder: (context, index) {
              final submenu = submenusUnicos[index];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      submenu!,
                      style: GoogleFonts.leckerliOne(
                        fontSize: 2,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  ...itemsPorSubmenu[submenu]!.map((entry) {
                    final item = entry['item'] as DescripcionMenu;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: tarjetaComida(
                        productState.id,
                        item.id,
                        item.image,
                        item.nombre,
                        item.descripcion,
                        item.precio,
                        item.unidadesPedir.toString(),
                        item.salsas
                                  ?.where((s) => s.nombre != null)
                                  .map((s) => s.nombre!)
                                  .toList()
                      ),
                    );
                  }),
                ],
              );
            },
          
        );
  }


  //

  Container _submenuHorizontal(List<String?> submenusUnicos) {
    return Container(
          width: double.infinity,
          height: 40,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: submenusUnicos.length,
              itemBuilder: (context, index) {
                final submenu = submenusUnicos[index];
                final bool isSelected = index == _selectedSubmenuIndex;
                return GestureDetector(
                  onTap: () async  {
           

                    setState(() {
                      _selectedSubmenuIndex = index;
                    });

                     _isProgrammaticScroll = true;

                  await   _itemScrollController.scrollTo(
                      index: index,
                      duration: const Duration(milliseconds: 450),
                      curve: Curves.easeOutCubic,
                      alignment: 0.0,
                    );

                      await Future.delayed(const Duration(milliseconds: 60));


                      _isProgrammaticScroll = false;

                    /*

final key = _submenuKeys[submenu];
if (key == null) return;

final ctx = key.currentContext;
if (ctx == null) return;

final box = ctx.findRenderObject() as RenderBox;
final scrollable = Scrollable.of(ctx);
final viewport = RenderAbstractViewport.of(box);

final offset = viewport!.getOffsetToReveal(box, 0.0).offset;

_scrollController.animateTo(
  offset,
  duration: const Duration(milliseconds: 450),
  curve: Curves.easeInOut,
); */

                    /*
 final ctx = _submenuKeys[submenu]?.currentContext;
if (ctx != null) {
  await Scrollable.ensureVisible(
    ctx,
    duration: const Duration(milliseconds: 400),
    curve: Curves.easeInOut,
    alignment: 0.0, // alineado al top
  );
} */

                    // ✅ Al tocar, scrollea automáticamente al grupo
                    /*  final offset = _submenuOffsets[submenu] ?? 0;
                      _scrollController.animateTo(
                        offset,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ); */
                  },
                  child: Container(
                    height: 40,

                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16), // 👈 CLAVE

                    decoration: BoxDecoration(
                      color: isSelected
                          ? Color(ConstantesColorTema2.naraja)
                          : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      border: Border.all(
                        color: Color(ConstantesColorTema2.naraja),
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        submenu ?? '',
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : Color(ConstantesColorTema2.naraja),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );

                /* Row(
                    children: [
                      Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                            color: Color(ConstantesColorTema2
                                .naraja), //Color.fromRGBO(109, 109, 109, 0.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: Center(
                            child: Text(
                          submenu ?? '',
                          style: TextStyle(
                              color: Color(ConstantesColorTema2.blanco)),
                        )),
                      ),
                      //
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ); */
              },
            ),
            /* ListView.builder(
                itemCount: allItems.length,
                itemBuilder: (context, index) {
                   final entry = allItems[index];
                      final submenu = entry['submenu'] as String?;
                      print('submenuZZZZZZZZZZZZZZZZZ $submenu');
                  return Row(
                    children: [
                    Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(109, 109, 109, 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: Text( ''),
                  ),
                    ],
                  );
                }, )*/ /* SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:   
            
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(109, 109, 109, 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: Text(''),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(109, 109, 109, 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: Text(''),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(109, 109, 109, 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: Text(''),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(109, 109, 109, 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: Text(''),
                  ),
                ],
              ), 
            ),
            */
          ),
        );
  }
//web//

  Widget _submenuHorizontalWeb(List<String?> submenusUnicos) {
    return Container(
     
          width: double.infinity,
          height: 40,
          child: Align(
            alignment: Alignment.center,
            child: ListView.builder(
              shrinkWrap: true,
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: submenusUnicos.length,
              itemBuilder: (context, index) {
                final submenu = submenusUnicos[index];
                final bool isSelected = index == _selectedSubmenuIndex;
                return GestureDetector(
                  onTap: () async  {
                       
                
                    setState(() {
                      _selectedSubmenuIndex = index;
                    });
                
                     _isProgrammaticScroll = true;
                
                  await   _itemScrollController.scrollTo(
                      index: index,
                      duration: const Duration(milliseconds: 450),
                      curve: Curves.easeOutCubic,
                      alignment: 0.0,
                    );
                
                      await Future.delayed(const Duration(milliseconds: 60));
                
                
                      _isProgrammaticScroll = false;
                
                  },
                  child: Container(
                    height: 40,
                
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16), // 👈 CLAVE
                
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Color(ConstantesColorTema2.naraja)
                          : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      border: Border.all(
                        color: Color(ConstantesColorTema2.naraja),
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        submenu ?? '',
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : Color(ConstantesColorTema2.naraja),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
                
               
              },
            ),
          ),
        );
  }

//
  Container _search() {
    return Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: TextFormField(
            onChanged: (value) {
              ref.read(searchTextProvider.notifier).state =
                  value.toLowerCase();
            },
            decoration: InputDecoration(
                hintText: 'Buscar',
                hintStyle: GoogleFonts.leckerliOne(
                    fontSize: 20,
                    color: Color(ConstantesColorTema2
                        .naraja)), //Color.fromRGBO(109, 109, 109, 1)),
                filled: true,
                fillColor: Color(ConstantesColorTema2
                    .blanco), //Color.fromRGBO(109, 109, 109, 0.5),
                suffixIcon: //Image.asset('assets/buscar.png',width: 78,height: 2,fit: BoxFit.contain,),
                    Icon(Icons.search_rounded,
                        size: 40,
                        color:
                            Color(ConstantesColorTema2.naraja) //Colors.grey,
                        ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40))),
          ),
        );
  }

  Padding _header() {
    return Padding(
          padding: const EdgeInsets.all(28.0),
          child: Row(
            children: [
             /* Container(
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
                  icon: Icon(Icons.menu), // Puedes cambiarlo por otro ícono
                  onPressed: () {
                    _scaffoldKey.currentState
                        ?.openDrawer(); // Abre el drawer manualmente
                  },
                ),
              ),*/
              SizedBox(
                width: 120,
              ),
              Container(
                child: Text(
                  'Foods',
                  style: GoogleFonts.leckerliOne(
                      fontSize: 30, color: Color.fromRGBO(109, 109, 109, 1)),
                ),
              ),
            ],
          ),
        );
  }
}

//web
 Widget _headerWeb() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
     
        Container(
          child: Text(
            'Foods',
            style: GoogleFonts.leckerliOne(
                fontSize: 30, color: Color.fromRGBO(109, 109, 109, 1)),
          ),
        ),
      ],
    );
  }


class tarjetaComida extends StatelessWidget {
  int? idRestaurante;
  int? ids;
  String? images;
  String? nombre;
  String? descripcion;
  String? precios;
  String? unidades;
  List<String>?  salsas;
  tarjetaComida(this.idRestaurante, this.ids, this.images, this.nombre,
      this.descripcion, this.precios, this.unidades,this.salsas);

  @override
  Widget build(BuildContext context) {

    print('salsassalsasasasasasas $salsas');
    void _openIconButtonPressed() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) => InfoComida2(this.idRestaurante, this.ids, this.images,
            this.nombre, this.descripcion, this.precios, this.unidades,this.salsas),
      );
    }

    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: InkWell(
        onTap: () {
          _openIconButtonPressed();
        },
        child: Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
              color: Color(ConstantesColorTema2
                  .blanco), //Color.fromRGBO(109, 109, 109, 0.5),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(245, 233, 233, 1),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.asset(
                          '${images}' ?? 'assets/mora.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      //width: 210,
                      height: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              nombre ?? '', //'Nombre del resurante',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600, // SemiBold
                                fontSize: 10,
                                color: Color(0xFF2B2B2B),
                              ), //GoogleFonts.leckerliOne(fontSize: 10, color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              descripcion ??
                                  '', //'Descricion del resuranteaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                              maxLines: 2,

                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600, // SemiBold
                                  fontSize: 15,
                                  color: Color(
                                      0xFF2B2B2B)), //GoogleFonts.leckerliOne( fontSize: 15, color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              precios ?? '', // 'Precio del resurante',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600, // SemiBold
                                  fontSize: 15,
                                  color: Color(ConstantesColorTema2
                                      .precios) //GoogleFonts.leckerliOne(fontSize: 30,color: Color(ConstantesColorTema2.naraja) //Color.fromRGBO(109, 109, 109, 1)

                                  ),
                              //style: GoogleFonts.leckerliOne(
                              //  fontSize: 15,
                              //color: Color(ConstantesColorTema2.precios)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

  //tarjeta comida 2

class tarjetaComida2 extends StatelessWidget {
  int? idRestaurante;
  int? ids;
  String? images;
  String? nombre;
  String? descripcion;
  String? precios;
  String? unidades;
  List<String>?  salsas;
  tarjetaComida2(this.idRestaurante, this.ids, this.images, this.nombre,
      this.descripcion, this.precios, this.unidades,this.salsas);

  @override
  Widget build(BuildContext context) {

    print('salsassalsasasasasasas $salsas');
    void _openIconButtonPressed() {
      showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    builder: (_) => ModalInfoComida(
      idRestaurante: idRestaurante,
      ids: ids,
      images: images,
      nombre: nombre,
      descripcion: descripcion,
      precios: precios,
      unidades: unidades,
      salsas: salsas,
    ),
  );
    }

    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20), 
        child: InkWell(
          onTap: () {
            _openIconButtonPressed();
          },
          child: Container(
   
            decoration: BoxDecoration(
                color: Color(ConstantesColorTema2
                    .blanco), //Color.fromRGBO(109, 109, 109, 0.5),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(245, 233, 233, 1),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image.asset(
                            '${images}' ?? 'assets/mora.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        //width: 210,
                        height: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                nombre ?? '', //'Nombre del resurante',
                                style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600, // SemiBold
            fontSize: 10,
            color: Color(0xFF2B2B2B),
          ),//GoogleFonts.leckerliOne(fontSize: 10, color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                descripcion ??
                                    '', //'Descricion del resuranteaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                                maxLines: 2,
        
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600, // SemiBold
            fontSize: 15,
            color: Color(0xFF2B2B2B)),//GoogleFonts.leckerliOne( fontSize: 15, color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                precios ?? '', // 'Precio del resurante',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600, // SemiBold
            fontSize: 15,
            color: Color(ConstantesColorTema2.precios) //GoogleFonts.leckerliOne(fontSize: 30,color: Color(ConstantesColorTema2.naraja) //Color.fromRGBO(109, 109, 109, 1)
        
                                            ),
                                //style: GoogleFonts.leckerliOne(
                                  //  fontSize: 15,
                                    //color: Color(ConstantesColorTema2.precios)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class ModalInfoComida extends StatelessWidget {
  final int? idRestaurante;
  final int? ids;
  final String? images;
  final String? nombre;
  final String? descripcion;
  final String? precios;
  final String? unidades;
  final List<String>? salsas;

  const ModalInfoComida({
    super.key,
    this.idRestaurante,
    this.ids,
    this.images,
    this.nombre,
    this.descripcion,
    this.precios,
    this.unidades,
    this.salsas,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (_, controller) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: SingleChildScrollView(
            controller: controller,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 50,
                    height: 5,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Text(nombre ?? '', style: const TextStyle(fontSize: 22)),
                const SizedBox(height: 10),
                Text(descripcion ?? ''),
              ],
            ),
          ),
        );
      },
    );
  }
}
