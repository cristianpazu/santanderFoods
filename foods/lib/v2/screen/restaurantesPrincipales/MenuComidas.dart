import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/UI/atoms/card_widget.dart';
import 'package:foods/UI/atoms/textFiled.dart';
import 'package:foods/Utils/ConstantesColor.dart';
import 'package:foods/v2/domain/entities/restaurantes/NombreRestaurantes.dart';
import 'package:foods/v2/menu/menu.dart';
import 'package:foods/v2/presentation/notifiers/Restaurante_notifiers/nombre_restaurante_notifier.dart';
import 'package:foods/v2/presentation/notifiers/Restaurante_notifiers/restaurante_notifier.dart';
import 'package:foods/widgets/CardComida.dart';
import 'package:foods/widgets/appbarComidas.dart';
import 'package:foods/widgets/appbars.dart';
import 'package:foods/widgets/chipsAll.dart';

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

    if (productState.isLoding!) {
      return const CircularProgressIndicator();
    }

    final menus = productState.informacion?.menu ?? [];

    final horarios = productState.informacion?.horario ?? [];
  

    final List<NombreRestaurante> todosLosRestaurantes =
        productState.nombrerestuarante!.cast<NombreRestaurante>().toList();

final imagenRestaurante = todosLosRestaurantes.isNotEmpty
    ? todosLosRestaurantes.first.image ?? 'assets/proximamente.jpg'
    : 'assets/proximamente.jpg';


    final submenusUnicos =
        menus.map((menu) => menu.submenu ?? '').toSet().toList();
    return Scaffold(
      body: Column(
        children: [
          Appbarcomidas(
            
            Textfields2(
              
              controller: _searchController,
              onChanged: (value) {},
              
            ),
            imagenRestaurante
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: submenusUnicos.map((submenu) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: chipAll(submenu),
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
                final descrpconmenu = menuSate
                    .descripcion; /*
                final nombreComida = menus[index].descripcion;
                final nombres = nombreComida![index].nombre; */

//print('<nombres> ${nombres}}');

                print('<descripcion> ${descrpconmenu}}');

                final screenWidth = MediaQuery.of(context).size.width;

                return Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),

/*
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: menus.map((menu) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: chipAll(menu.submenu ?? ''),
                          );
                        }).toList(),
                      ),
                    ), */

                    /* Row(
                    
                      children: [
                        chipAll( menuSate.submenu ?? '')
                      ],
                    ), */
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
                          final imagePath = item.image == "" ?  'assets/proximamente.jpg' : item.image;
                          

                          return Cardcomida(
                            
                           imagePath!,
                            '${item.nombre}',
                            screenWidth,
                          );
                        }),
                  ],
                );
              },
            ),
          ),

          /* Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)
                )
              ),
            
            ),
          ),*/
        ],
      ),
    );
  }
}
