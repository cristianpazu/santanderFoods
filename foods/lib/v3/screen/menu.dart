import 'package:flutter/material.dart';
import 'package:foods/v3/screen/controllers/home_controller.dart';
import 'package:foods/v3/screen/model/Product.dart';
import 'package:foods/widgets/InfoComida.dart';
import 'package:foods/widgets/drawer.dart';
import 'package:foods/widgets/infoComida2.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatefulWidget {
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // Clave para manejar el Drawer

  final controller = HomeController();
 void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -0.7) {
      controller.changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 12) {
      controller.changeHomeState(HomeState.normal);
    }
  }

final defaultPadding = 20.0;
 final cartBarHeight = 100.0;
final headerHeight = 85.0;

final bgColor = Color(0xFFF6F5F2);
final primaryColor = Color(0xFF40A944);

final panelTransition = Duration(milliseconds: 800);

  @override
  Widget build(BuildContext context) {
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
                itemCount: demo_products.length,
                itemBuilder: (context, index) => tarjetaComida(
                      product: demo_products[index],
                      index: index,
                      controller: controller,
                    )
                /*
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
              ], */
                ),
          ),
          SizedBox(
            height: 10,
          ),
          LayoutBuilder(
           builder: (context, constraints) { 
            return AnimatedPositioned(
                     duration: panelTransition,
              bottom: 0,
              left: 0,
              right: 0,
              height: controller.homeState == HomeState.normal ? cartBarHeight
                                : (constraints.maxHeight - cartBarHeight),
              child: GestureDetector(
                onVerticalDragUpdate: _onVerticalGesture,
                child: Container(
                  width: double.infinity,
                  height: 60,
                  color: Colors.green,
                  child: Column(
                    children: [
                      Row(
                        children: List.generate(
                    controller.cart.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Hero(
                        tag: controller.cart[index].product!.title! + "as",
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage(controller.cart[index].product!.images!),
                        ),
                      ),
                    ),
                     )
                      )
                    ],
                  ),
                ),
              ),
            );

           }


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
  final Product product;
  int index;
  HomeController? controller;
  tarjetaComida({
    required this.product,
    required this.index,
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   /* void _openIconButtonPressed() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) => InfoComida2(
          product: product,
          onProductAdd: () {
            controller?.addProductToCart(demo_products[index]);
          },
        ),
      );
    } */

    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: InkWell(
        onTap: () {
         // _openIconButtonPressed();
             Navigator.push(
      context,
         MaterialPageRoute(
           builder: (context) =>  InfoComida2(
            product: product,
            onProductAdd: () {
              controller?.addProductToCart(demo_products[index]);
            },
                   ),
         ));
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
                            product.title2!,
                            style: GoogleFonts.leckerliOne(
                                fontSize: 10, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.title3!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.leckerliOne(
                                fontSize: 15, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.title4!,
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
