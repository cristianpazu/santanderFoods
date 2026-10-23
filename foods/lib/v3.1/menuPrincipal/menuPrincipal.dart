import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart' show StatelessWidget;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState;
import 'package:foods/v3.1/menuPrincipal/RestaurantePage.dart' show Restaurantespage;
import 'package:foods/v3.1/notifiers/resturanteNotifiers/Resturante_notifiers.dart'
    show resturantesStateNotifierProvider;

class RestaurantePage extends ConsumerStatefulWidget {
  const RestaurantePage({super.key});

  @override
  RestaurantePageState createState() => RestaurantePageState();
}

class RestaurantePageState extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    final restaurantes = ref.watch(resturantesStateNotifierProvider);

    final listaRestaurantes = restaurantes.restaurantesresponsedto ?? [];
    final sizeScreen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(8),
            child: Row(
              children: [
                Icon(Icons.location_on_outlined),
                Text('Santander de quilichao')
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  // textoBusqueda = value;
                });
              },
              
              decoration: InputDecoration(
                
                hintText: 'Buscar restaurantes o comidas...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
              
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),

          //
          Padding(
            padding: const EdgeInsets.only(left:  12.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Restaurante disponible',
                style: TextStyle(
                  
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          //
          const SizedBox(height: 20),
          //
          Expanded(
              child: ListView.builder(
            itemCount: listaRestaurantes.length,
            itemBuilder: (context, index) {
              final restaurante = listaRestaurantes[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  height: 110,
                  width: sizeScreen.width,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: 85,
                            height: 90,
                            color: Colors.green,
                          ),
                          /*Image.asset(
              'assets/comida_rapida.jpeg',
              width: 75,
              height: 85,
              fit: BoxFit.cover,
            ), */
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${restaurante.nombre}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text('⭐ 0(0)'),
                            Text('${restaurante.descripcion}'),
                            Text('${restaurante.telefono}'),
                          ],
                        ),
                      ),
                       Padding(
                        padding: EdgeInsets.only(right: 8),
                        child:  IconButton(onPressed: (){
                          Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Restaurantespage(
                            idRestaurante: restaurante.idRestaurante!,
                          ),
                        ),
                      );
                        }, icon: Icon(Icons.chevron_right))  //Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
