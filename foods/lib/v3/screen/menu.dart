import 'package:flutter/material.dart';
import 'package:foods/v3/presentation/notifiers/items_notifiers/buscar.dart';
import 'package:foods/widgets/drawer.dart';
import 'package:foods/v3/util/colores.dart';
import 'package:foods/v3/screen/carrito.dart';
import 'package:foods/widgets/infoComida2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/v3/entities/descripcionMenu.dart';
import 'package:foods/v3/presentation/notifiers/items_notifiers/item_state_notifiers.dart';
import 'package:foods/v3/presentation/notifiers/comida_rapida_notifiers/nombre_comida_2_notifiers.dart';

class MenuPage extends ConsumerStatefulWidget {
  final int idRestaurante;
  MenuPage(this.idRestaurante);
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends ConsumerState<MenuPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // Clave para manejar el Drawer
  final ScrollController _scrollController = ScrollController();
  int _selectedSubmenuIndex = 0;
  final Map<String, double> _submenuOffsets = {};
  final ScrollController _submenuScrollController = ScrollController();
  String _searchText = '';
  @override
  void dispose() {
    _scrollController.dispose();
    _submenuScrollController.dispose();
    super.dispose();
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
    final filteredItems =
    ref.watch(filteredMenuProvider(widget.idRestaurante));
    
 final contactos = restaurantes
    .map((restaurante) => restaurante.contacto)
    .toList();
final String? telefono = restaurantes.isNotEmpty
    ? restaurantes.first.contacto
    : null;
  

 print('alltimes ${contactos}');

  final submenusUnicos = filteredItems
    .map((e) => e['submenu'] as String?)
    .where((s) => s != null && s.isNotEmpty)
    .toSet()
    .toList();

final itemsPorSubmenu = {
  for (var submenu in submenusUnicos)
    submenu: filteredItems
        .where((e) => e['submenu'] == submenu)
        .toList(),
};


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
      key: _scaffoldKey,
      drawer: DrawerPage(),
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
                    icon: Icon(Icons.menu), // Puedes cambiarlo por otro ícono
                    onPressed: () {
                      _scaffoldKey.currentState
                          ?.openDrawer(); // Abre el drawer manualmente
                    },
                  ),
                ),
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
          ),
          Container(
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
          ),
          SizedBox(
            height: 10,
          ),
          Container(
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
                      onTap: () {
                        setState(() {
                          _selectedSubmenuIndex = index;
                        });
                        // ✅ Al tocar, scrollea automáticamente al grupo
                        final offset = _submenuOffsets[submenu] ?? 0;
                        _scrollController.animateTo(
                          offset,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 90,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
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
                )
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
          ),
          //
          SizedBox(
            height: 10,
          ),
          //
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification) {
                  double offset = _scrollController.offset;
                  String? visibleSubmenu;
                  double minDifference = double.infinity;

                  _submenuOffsets.forEach((submenu, pos) {
                    final diff = (offset - pos).abs();
                    if (diff < minDifference) {
                      minDifference = diff;
                      visibleSubmenu = submenu;
                    }
                  });

                  if (visibleSubmenu != null) {
                    final index = submenusUnicos.indexOf(visibleSubmenu);
                    if (index != _selectedSubmenuIndex) {
                      setState(() {
                        _selectedSubmenuIndex = index;
                      });
                    }
                  }
                }
                return false;
              },
              child: ListView(
                controller: _scrollController,
                children: [
                  for (var submenu in submenusUnicos) ...[
                    Builder(
                      builder: (context) {
                        // ✅ Registramos la posición del grupo
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          final box = context.findRenderObject() as RenderBox?;
                          if (box != null) {
                            final position = box.localToGlobal(Offset.zero).dy +
                                _scrollController.offset;
                            _submenuOffsets[submenu ?? ''] = position;
                          }
                        });

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /* Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Text(
                                  submenu!,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color(ConstantesColorTema2.naraja),
                                  ),
                                ),
                              ), */
                            ...itemsPorSubmenu[submenu]!.map((entry) {
                              final item = entry['item'] as DescripcionMenu;

                              print('<<<object>>> ${productState.id}');
                              print('<<<item.nombre>>> ${item.nombre}');
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
                                ),
                              );
                            }).toList(),
                          ],
                        );
                      },
                    ),
                  ],
                ],
              ),
            ),
          ),

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
              ? Hero(
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
                              child: Text('Precio'),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CarritoPage2(telefono),
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
                )
              : Container(),
        ],
      )),

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
}

class tarjetaComida extends StatelessWidget {
  int? idRestaurante;
  int? ids;
  String? images;
  String? nombre;
  String? descripcion;
  String? precios;
  String? unidades;

  tarjetaComida(this.idRestaurante, this.ids, this.images, this.nombre,
      this.descripcion, this.precios, this.unidades);

  @override
  Widget build(BuildContext context) {
    void _openIconButtonPressed() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) => InfoComida2(this.idRestaurante, this.ids, this.images,
            this.nombre, this.descripcion, this.precios, this.unidades),
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
                  .naraja), //Color.fromRGBO(109, 109, 109, 0.5),
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
                  Container(
                    width: 210,
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
                            style: GoogleFonts.leckerliOne(
                                fontSize: 10, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            descripcion ??
                                '', //'Descricion del resuranteaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.leckerliOne(
                                fontSize: 15, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            precios ?? '', // 'Precio del resurante',
                            style: GoogleFonts.leckerliOne(
                                fontSize: 15,
                                color: Color.fromRGBO(255, 255, 255, 1)),
                          ),
                        ),
                      ],
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
