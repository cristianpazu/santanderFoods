import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/UI/atoms/card_widget.dart';
import 'package:foods/UI/screens/comidasRapidas/comidasRapidasInfoCategoria.dart';
import 'package:foods/Utils/ConstantesColor.dart';
import 'package:foods/Utils/titutlos.dart';
import 'package:foods/v2/presentation/notifiers/Categoria_notifiers/categoria_notifier.dart';
import 'package:foods/widgets/MenuWidget.dart';

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
      ],
    ));
  }
}
