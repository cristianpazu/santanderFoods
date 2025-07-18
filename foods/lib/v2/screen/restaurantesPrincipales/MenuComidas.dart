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
     print('productStatezzzzzzzzz ${productState.nombrerestuarante?.length}');

  if (productState.isLoding!) {
  return const CircularProgressIndicator();
} 

final menus = productState.informacion?.menu ?? [];
final horarios = productState.informacion?.horario ?? [];
  print('menus ${menus}');

    print('horarios ${horarios}');
    final List<NombreRestaurante> todosLosRestaurantes = productState
        .nombrerestuarante!
     
        .cast<NombreRestaurante>()
        .toList();

   
    return Scaffold(
      body: Column(
        children: [/*
         Appbarcomidas (Textfields2(
                    controller: _searchController,
                    onChanged: (value) {},
                    texto: 'ddddddd',
                  ),), */
                

            Container(
              color: Colors.amber,
              width: 500,
               height: 500,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: todosLosRestaurantes.length,
                  itemBuilder: (context, index) {
                    final productStatess = todosLosRestaurantes[index]; 
                   
     print('productStatezzzzzzzzzproductStates ${productStatess.nombres}');
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        child: Text(     productStatess.nombres,),
                      )
                      /* Cardcomida(
              productStatess.nombres,
              productStatess.image
              
              ) */
               
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
