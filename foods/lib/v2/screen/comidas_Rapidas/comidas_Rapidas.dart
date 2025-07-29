import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/UI/atoms/card_widget.dart';
import 'package:foods/UI/screens/comidasRapidas/comidasRapidasInfoCategoria.dart';
import 'package:foods/Utils/ConstantesColor.dart';
import 'package:foods/Utils/titutlos.dart';
import 'package:foods/v2/presentation/notifiers/Categoria_notifiers/categoria_notifier.dart';
import 'package:foods/v2/presentation/notifiers/Comida_rapida_notifiers/comida_rapida_notifiers.dart';
import 'package:foods/v2/presentation/notifiers/Restaurante_notifiers/restaurante_notifier.dart';
import 'package:foods/widgets/MenuWidget.dart';
import 'package:collection/collection.dart';
class ComidasRapidas extends ConsumerStatefulWidget {
  const ComidasRapidas({super.key});

  @override
  _ComidasRapidasState createState() => _ComidasRapidasState();
}

class _ComidasRapidasState extends ConsumerState {
   int? _categoriaSeleccionadaId;
  @override
  void initState() {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
    ref.read(categoriaProvider.notifier).loadCategoria();
    ref.read(comidaRapidaProvider.notifier).loadComidaRapidas();
  });
    //ref.read(categoriaProvider.notifier).loadCategoria();
   // ref.read(comidaRapidaProvider.notifier).loadComidaRapidas();
  }

  @override
  Widget build(BuildContext context) {
    final categoriaLista = ref.watch(categoriaProvider);
     final comidaRapida = ref.watch(comidaRapidaProvider);
final todasLasComidas = comidaRapida.comidaRapida
    .expand((e) => e.nombreComidaRapida)
    .toList();

      final comidasAgrupadasPorCategoria = groupBy(
    todasLasComidas,
    (comida) => comida.categorias.nombreCategoria,
  );

/*
print(comidaRapida.comidaRapida);
final todasLasComidas = comidaRapida.comidaRapida
    .expand((comidaRapidas) => comidaRapidas.nombreComidaRapida)
    .toList();


   final comidasFiltradas = _categoriaSeleccionadaId == null
    ? todasLasComidas
    : todasLasComidas
        .where((comida) => comida.categorias.id == _categoriaSeleccionadaId)
        .toList(); */









    Widget? _getPantallaPorCategoria(int idCategoria) {
      print('idCategoria $idCategoria');
       return Comidasrapidasinfocategoria(id: idCategoria);
      /*switch (idCategoria) {
        case 1:
          return Comidasrapidasinfocategoria(id: idCategoria);
        case 2:
          return Comidasrapidasinfocategoria(id: idCategoria);
        case 3:
          return Comidasrapidasinfocategoria(id: idCategoria);
        case 4:
          return Comidasrapidasinfocategoria(id: idCategoria);
        // Agrega más casos según necesites
        default:
          return null; // O alguna pantalla de "no encontrada"
      } */
    }

    return MenuWidget(Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Divider(
          color: Color.fromRGBO(50, 30, 124, 5), // Color de la línea
          thickness: 2, // Grosor de la línea
          indent: 16, // Espacio a la izquierda
          endIndent: 16, // Espacio a la derecha
        ),
        UiTexto(texto: 'Categorias').textoRobotoLightText(),
        Divider(
          color: Color.fromRGBO(50, 30, 124, 5), // Color de la línea
          thickness: 2, // Grosor de la línea
          indent: 16, // Espacio a la izquierda
          endIndent: 16, // Espacio a la derecha
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoriaLista.categorias.length,
            itemBuilder: (context, index) {
              final categoria = categoriaLista.categorias[index];

              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: cardWidgetCategoria(
                  image: Image.asset(
                    categoria.image,
                    fit: BoxFit.cover,
                  ),
                  texto: categoria.nombreCategoria,
                  altura: 150,
                  ancho: 85,
                  colors: const Color(ConstantesColorTema.fondoColorAppbar),
                  redireccionamiento: _getPantallaPorCategoria(categoria.id),
                ),
              );
            },
          ),
        ),

        //


        //
Expanded(
  child: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: comidasAgrupadasPorCategoria.entries.map((entry) {
        final nombreCategoria = entry.key;
        final comidas = entry.value;
    
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título de categoría
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Text(
                nombreCategoria,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
        
            // Carrusel horizontal de tarjetas
            Padding(
              padding: const EdgeInsets.only(left: 16.0), // margen izquierdo para separar del borde
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: comidas.map((comida) => Padding(
                    padding: const EdgeInsets.only(right: 12.0), // Espacio entre tarjetas
                    child: cardComidaRapidasWidget(
                      colors: Colors.white,
                      image: Image.asset(comida.image, fit: BoxFit.contain),
                      texto: comida.nombres,
                    ),
                  )).toList(),
                ),
              ),
            ),
        
            const SizedBox(height: 16.0), // Espacio inferior entre categorías
          ],
        );
      }).toList(),
    ),
  ),
)











      ],
    ));
  }
}
