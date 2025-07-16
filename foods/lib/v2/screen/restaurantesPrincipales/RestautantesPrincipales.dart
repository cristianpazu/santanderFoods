import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/UI/atoms/card_widget.dart';
import 'package:foods/v2/domain/entities/restaurantes/NombreRestaurantes.dart';
import 'package:foods/v2/presentation/notifiers/Restaurante_notifiers/restaurante_notifier.dart';
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

    ref.read(restauranteProvider.notifier).loadRestaurante();
  }

  @override
  Widget build(BuildContext context) {
    final restauranteState = ref.watch(restauranteProvider);

    final List<NombreRestaurante> todosLosRestaurantes = restauranteState
        .restaurantes!
        .expand((grupo) => grupo.nombreRestaurantes ?? [])
        .cast<NombreRestaurante>()
        .toList();

    return MenuWidget(
      GridView.builder(
      padding: EdgeInsets.all(20),
      shrinkWrap:
          true, // Asegura que el GridView solo ocupe el espacio necesario
      physics: NeverScrollableScrollPhysics(),
      itemCount:
          todosLosRestaurantes.length, //restauranteState.restaurantes!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Número de columnas en la cuadrícula
      ),
      itemBuilder: (context, index) {
        /*final restaurante = restauranteState.restaurantes![index];
final restaurantNombre = restaurante.nombreRestaurantes?[index].nombres;
  final restauranteImage = restaurante.nombreRestaurantes?[index].image; 
         print('NombreRestaurantes de un restaurante  : ${restaurantNombre}');*/

        if (todosLosRestaurantes.isEmpty) {
          return  CircularProgressIndicator();
        }

        final restaurante = todosLosRestaurantes[index];
        
        /*
        final restaurantNombre = restaurant[index].nombres;
        final restauranteImage = restaurant[index].image; 
        print(restaurantId);
        print('restaurant>>>>>>>>> $restaurant  ---- $restaurantId');*/
        return cardMenuRestauranteWidget4(
          colors: Color.fromARGB(255, 255, 255, 255),
          altura: 10,
          image: Image.asset(
            restaurante.image ?? "",
            fit: BoxFit.contain,
          ),
          texto: restaurante.nombres,
        );
      },
    ));
  }
}
