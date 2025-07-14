import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/UI/atoms/card_widget.dart';
import 'package:foods/Utils/titutlos.dart';
import 'package:foods/v2/presentation/notifiers/categoria_notifier.dart';

class ComidasRapidas extends ConsumerStatefulWidget {
  const ComidasRapidas({super.key});

  @override
 _ComidasRapidasState createState() => _ComidasRapidasState();
}

class _ComidasRapidasState extends ConsumerState {


@override
  void initState() {
    super.initState();
    ref.read(categoriaProvider.notifier).loadCategoria();
  }


  @override
  Widget build(BuildContext context) {

final categoriaLista = ref.watch(categoriaProvider);
 print('1111111111111111 ${categoriaLista.categorias.length}');
    return SizedBox(
  height: 150,
      child:   ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: categoriaLista.categorias.length,
    itemBuilder: (context, index) {
      final categoria = categoriaLista.categorias[index]; 
      print('1111111111111111 $categoria');
      return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: cardWidgetCategoria(
          texto: categoria.nombreCategoria,
          
          altura: 150,
          ancho: 85,
          colors: Colors.green,
        ),
      );
    },
  ),

    );
  }
}