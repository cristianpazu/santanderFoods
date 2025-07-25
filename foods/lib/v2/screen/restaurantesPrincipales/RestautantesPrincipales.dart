import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/UI/atoms/card_widget.dart';
import 'package:foods/v2/domain/entities/restaurantes/NombreRestaurantes.dart';
import 'package:foods/v2/presentation/notifiers/Restaurante_notifiers/restaurante_notifier.dart';
import 'package:foods/v2/screen/restaurantesPrincipales/MenuComidas.dart';
import 'package:foods/widgets/MenuWidget.dart';

class Restautantesprincipales extends ConsumerStatefulWidget {
  const Restautantesprincipales({super.key});

  @override
  _RestautantesprincipalesState createState() =>
      _RestautantesprincipalesState();
}

class _RestautantesprincipalesState extends ConsumerState {
  @override
  void initState() {
    super.initState();
 WidgetsBinding.instance.addPostFrameCallback((_) {
    ref.read(restauranteProvider.notifier).loadRestaurante();
  });
//    ref.read(restauranteProvider.notifier).loadRestaurante();
  }

  @override
  Widget build(BuildContext context) {
    final restauranteState = ref.watch(restauranteProvider);

print('<<<<<<<<<<<<<<<<<<< ${restauranteState.restaurante}');
 final bool cargando = restauranteState.isLoding;

 final List<NombreRestaurante> todosLosRestaurantes = restauranteState.restaurante
          ?.expand((grupo) => grupo.nombreRestaurantes ?? [])
          .cast<NombreRestaurante>()
          .toList() ??
      [];
/*
    final List<NombreRestaurante> todosLosRestaurantes = restauranteState
        .restaurantes!
        .expand((grupo) => grupo.nombreRestaurantes ?? [])
        .cast<NombreRestaurante>()
        .toList(); */


 final int itemCount = cargando ? 6 : todosLosRestaurantes.length;


  print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<1111111$cargando');
    return MenuWidget(
      Expanded(
        child: GridView.builder(
        padding: EdgeInsets.all(20),
      //  shrinkWrap: true, // Asegura que el GridView solo ocupe el espacio necesario
        //physics: NeverScrollableScrollPhysics(),
            physics: AlwaysScrollableScrollPhysics(),
        itemCount:itemCount,
           // todosLosRestaurantes.length, //restauranteState.restaurantes!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Número de columnas en la cuadrícula
        ),
        itemBuilder: (context, index) {
          /*final restaurante = restauranteState.restaurantes![index];
        final restaurantNombre = restaurante.nombreRestaurantes?[index].nombres;
          final restauranteImage = restaurante.nombreRestaurantes?[index].image; 
           print('NombreRestaurantes de un restaurante  : ${restaurantNombre}');*/
          print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<${cargando}');
          if (cargando) {
           print('1111111111111111111 $cargando');
            return Container(
              
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color:  Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child:Center(child: Image.asset('assets/cargando.gif', 
        fit: BoxFit.contain,)),
              ),
            );
          }
         
          /*if (todosLosRestaurantes.isEmpty) {
            return Image.network('https://i.pinimg.com/originals/c4/cb/9a/c4cb9abc7c69713e7e816e6a624ce7f8.gif');
            
             //CircularProgressIndicator();
          } */
        
          final restaurante = todosLosRestaurantes[index];
          
             //print('object ${todosLosRestaurantes.length}');
        
        
          /*
          final restaurantNombre = restaurant[index].nombres;
          final restauranteImage = restaurant[index].image; 
          print(restaurantId);
          print('restaurant>>>>>>>>> $restaurant  ---- $restaurantId');*/
          return cardMenuRestauranteWidget4(
            colors: Color.fromARGB(255, 255, 255, 255),
            altura: 10,
            image: Image.asset(
              restaurante.image ?? '',
              fit: BoxFit.contain,
            ),
            texto: restaurante.nombres,
            redireccionamiento: Menucomidas(
              idRestaurante: restaurante.id,
            )
          );
        },
            ),
      ));
  }
}
