import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/v2/presentation/notifiers/Comida_rapida_notifiers/nombre_comida_notifiers.dart';
import 'package:foods/v3/entities/NombreComidaRapida2.dart';
import 'package:foods/v3/entities/descripcionMenu.dart';
import 'package:foods/v3/presentation/notifiers/comida_rapida_notifiers/nombre_comida_2_notifiers.dart';
import 'package:foods/v3/screen/carrito.dart';
import 'package:foods/widgets/InfoComida.dart';
import 'package:foods/widgets/drawer.dart';
import 'package:foods/widgets/infoComida2.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends ConsumerStatefulWidget {

    final int idRestaurante;
MenuPage(this.idRestaurante);
  @override
 _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends ConsumerState<MenuPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // Clave para manejar el Drawer



  @override
  Widget build(BuildContext context) {
final productState = ref.watch(nombreComidaRapidaRestaurante2Provider(widget.idRestaurante));

print('objectproductState ${productState.menuComidaRapidas?.length}');

 if (productState.isLoding!) {
      return Scaffold( 
        body: Center(
          child: CircularProgressIndicator()
        ),
      ); // const CircularProgressIndicator();
    }


    final menus = productState.menuComidaRapidas ?? [];

 //final descrpconmenu = menus.isNotEmpty ? menus[0].descripcion : [];
//print('objectproductState objectproductState menus ${menus.length}');
print('objectproductState objectproductState menus ${productState.nombreComidaRapida!.length}');

 final restaurantes = productState.nombreComidaRapida ?? [];
final allItems = restaurantes.expand((restaurante) {
  return restaurante.menu.expand((menu) {
    return (menu.descripcion ?? []).map((item) => {
      'restaurante': restaurante,
      'submenu': menu.submenu,
      'item': item,
    });
  });
}).toList();


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
              decoration: InputDecoration(
                  hintText: 'Buscar',
                  hintStyle: GoogleFonts.leckerliOne(
                      fontSize: 20, color: Color.fromRGBO(109, 109, 109, 1)),
                  filled: true,
                  fillColor: Color.fromRGBO(109, 109, 109, 0.5),
                  suffixIcon: //Image.asset('assets/buscar.png',width: 78,height: 2,fit: BoxFit.contain,),
                      Icon(
                    Icons.search_rounded,
                    size: 40,
                    color: Colors.grey,
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
            height: 80,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
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
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
               itemCount:allItems.length, //descrpconmenu!.length,
              itemBuilder: (context, index) {
                //  final menuSate = descrpconmenu[index];
              final entry = allItems[index];
      final restaurante = entry['restaurante'] as NombreComidaRapida2;
      final submenu = entry['submenu'] as String?;
      final item = entry['item'] as DescripcionMenu;
               return   Column(
                 children: [
                   tarjetaComida(
                    item.image,
                    item.nombre,
                    item.descripcion,
                    item.precio
                   ),
                    SizedBox(
                  height: 20,
                ),
                 ],
               );
              }
             /* children: [
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
              ], */
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Hero(
            tag: 'as',
            child: Container(
              width: double.infinity,
              height: 90,
              color: Color.fromRGBO(109, 109, 109, 0.5),
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
                                  builder: (context) => CarritoPage2(),
                                ));
                          },
                          child: Container(
                            width: 150,
                            height: 70,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 247, 246, 242),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text('Carrito'),
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
  String? images;
  String? nombre;
  String? descripcion;
  String? precios;

   tarjetaComida(
  this.images,
   this.nombre,
  this.descripcion,
  this.precios
  );

  @override
  Widget build(BuildContext context) {
    void _openIconButtonPressed() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) => InfoComida2(
         this.images,
  this.nombre,
  this.descripcion,
  this.precios
        ),
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
              color: Color.fromRGBO(109, 109, 109, 0.5),
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
                      
                         fit: BoxFit.cover,),
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
                            descripcion ?? '', //'Descricion del resuranteaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.leckerliOne(
                                fontSize: 15, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            precios ?? '',// 'Precio del resurante',
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
