import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/Utils/ConstantesColor.dart';
import 'package:foods/v2/domain/entities/comidas_rapidas/Salsa.dart';
import 'package:foods/v3/entities/items.dart';
import 'package:foods/v3/presentation/notifiers/comida_rapida_notifiers/nombre_comida_2_notifiers.dart';
import 'package:foods/v3/presentation/notifiers/items_notifiers/cantidad_provider.dart';
import 'package:foods/v3/util/colores.dart';

import '../v3/presentation/notifiers/items_notifiers/item_state_notifiers.dart';

class ModalInfoComida2 extends ConsumerStatefulWidget {
  int? idRestaurante;
  int? id;
  String? images;
  String? nombre;
  String? descripcion;
  String? precios;
  String? unidades;
  List<String>? salsas;
  // BuildContext context;
  ModalInfoComida2(this.idRestaurante, this.id, this.images, this.nombre,
      this.descripcion, this.precios, this.unidades, this.salsas //,this.context
      );

  @override
  _ModalInfoComidaState createState() => _ModalInfoComidaState(
        idRestaurante,
        id, images, nombre, descripcion, precios, unidades,
        salsas, //this.context
      );
}

class _ModalInfoComidaState extends ConsumerState<ModalInfoComida2> {
  int valor = 0;
  bool isAddedToCart = false;
  int? idRestaurante;
  int? id;
  String? images;
  String? nombre;
  String? descripcion;
  String? precios;
  String? unidades;
  List<String>? salsas;
  //BuildContext context;
  _ModalInfoComidaState(
    this.idRestaurante,
    this.id,
    this.images,
    this.nombre,
    this.descripcion,
    this.precios,
    this.unidades,
    this.salsas, //this.context
  );

  final Map<int, bool> _salsasSeleccionadas = {};

  int get cantidadSeleccionadas =>
      _salsasSeleccionadas.values.where((v) => v).length;

  @override
  Widget build(BuildContext context) {
/*
final salsasSeleccionadas = widget.salsas
            ?.where((salsa) => _salsasSeleccionadas[salsa['id']] ?? false)
            .map((salsa) => salsa['nombre'].toString())
            .toList() ??
        []; */
    double height = MediaQuery.of(context).size.height;
    final productState = ref
        .watch(nombreComidaRapidaRestaurante2Provider(widget.idRestaurante!));
    final cartState = ref.watch(itemsStateNotifier);

    final cantidad = ref.watch(cantidadProvider);
    final List<Salsa> salsasSeleccionadas = widget.salsas!
        .asMap()
        .entries
        .where((entry) => _salsasSeleccionadas[entry.key] == true)
        .map((entry) => Salsa(
              id: entry.key,
              nombre: entry.value,
            ))
        .toList();
    final unidadesProducto = cartState
        .expand((e) {
          return e.descripcionMenu;
        })
        .where((item) {
          return item.nombre == nombre;
        })
        .map((item) => item.unidadesPedir ?? 0)
        .fold(0, (a, b) => a + b);

    String _carTaf = 'as';

    final Set<String> nombresMax5 = {
      'Alitas x 24',
      'Alitas x 12',
      'Combos 600 gr',
      'Combos 400 gr',
      'Costilla 600 gr',
      'Costilla 400 gr',
    };

    final Set<String> nombresMax3 = {
      'Alitas x 4',
      'Alitas x 6',
      'Alitas x 8',
      'Combos 200 gr',
      'Combos 300 gr',
    };

    final int maxSalsas = nombresMax5.contains(nombre)
        ? 5
        : (nombresMax3.contains(nombre) ? 3 : 0);

    print('nombresMax 5 ${nombresMax5}');

    final Widget salsaWidget =
        widget.salsas != null && widget.salsas!.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selecciona hasta $maxSalsas salsas:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(ConstantesColorTema2.naranja2)),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(ConstantesColorTema2.blanco),
                        borderRadius: BorderRadius.circular(5)),
                    height: 200, // ajusta según necesites
                    child: GridView.count(
                      physics:
                          NeverScrollableScrollPhysics(), // para que no se pueda hacer scroll dentro del Grid
                      crossAxisCount: 2, // dos columnas
                      childAspectRatio:
                          4, // ancho/alto de cada item, para que quede bien
                      children: widget.salsas!.asMap().entries.map((entry) {
                        final index = entry.key;
                        final nombre = entry.value;

                        return CheckboxListTile(
                          activeColor: Color(ConstantesColorTema2
                              .naranja2), // color del check cuando está activo
                          checkColor: Color(ConstantesColorTema2.blanco),
                          contentPadding: EdgeInsets.zero,
                          title: Text(nombre ?? '', //'Nombre del resurante',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600, // SemiBold
                                  fontSize: 15,
                                  color: Color(0xFF2B2B2B))), //Text(nombre),
                          value: _salsasSeleccionadas[index] ?? false,
                          onChanged: (selected) {
                            final yaSeleccionada =
                                _salsasSeleccionadas[index] ?? false;

                            if (!yaSeleccionada &&
                                cantidadSeleccionadas >= maxSalsas) {

Future.microtask(() {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Color(ConstantesColorTema2.naraja),
      margin: EdgeInsets.only(
        bottom: 80, // si tienes carrito abajo
        left: 16,
        right: 16,
      ),
      content: Text(
        'Solo puedes seleccionar hasta $maxSalsas salsas',
        style: TextStyle(color: Colors.white),
      ),
      duration: Duration(seconds: 2),
    ),
  );
});


                              /*ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Soasdsadasdlo puedes seleccionar hasta $maxSalsas salsas'),
                                  duration: Duration(seconds: 2),
                                ),
                              ); */
                              return;
                            }

                            setState(() {
                              _salsasSeleccionadas[index] = selected ?? false;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink();

    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          /*
          width: 600,
          height: 600, */
          constraints: BoxConstraints(
            maxWidth: 700,
            maxHeight: height * 0.9, // límite, NO fijo
          ),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Color(ConstantesColorTema.blanco),
              borderRadius: BorderRadius.circular(20)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          widget.images ?? '',
                          width: 250,
                          height: 250,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey.shade300,
                            child: const Icon(Icons.image_not_supported),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                    Text(
                          widget.nombre ?? '',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                          
                                           IconButton(onPressed: (){
                                             Navigator.of(context).pop(); 
                                           }, icon: Icon(Icons.highlight_off_outlined))
                          ],
                        ),
                       
                        const SizedBox(height: 8),
                        Text(
                          widget.descripcion ?? '',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        Text(
                          precios ?? '',
                          // 'Precio',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600, // SemiBold
                              fontSize: 20,
                              color: Color(ConstantesColorTema2.precios)),
                          //style: GoogleFonts.leckerliOne(
                          //  fontSize: 20, color: Color(ConstantesColorTema2.naraja),),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        salsaWidget ?? Container(),
                      ],
                    ))
                  ],
                ),
                //

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(ConstantesColorTema2.naraja),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: IconButton(
                            onPressed: () {
                              ref.read(cantidadProvider.notifier).state++;
                            },
                            icon: Icon(
                              Icons.add,
                              color: Color(ConstantesColorTema2.blanco),
                            ))),
                    SizedBox(
                      width: 10,
                    ),
                    Text('$cantidad'),

                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(ConstantesColorTema2.naraja),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: IconButton(
                            onPressed: () {
                              final notifier =
                                  ref.read(cantidadProvider.notifier);
                              if (notifier.state > 1) {
                                notifier.state--;
                              }
                            },
                            icon: Icon(Icons.remove,
                                color: Color(ConstantesColorTema2.blanco)))),
                    SizedBox(
                      width: 80,
                    ),
                    ////
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(ConstantesColorTema2.naraja),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () async {
                          if (cantidadSeleccionadas < maxSalsas) {
                            // Si no hay suficientes salsas seleccionadas, mostrar un mensaje de advertencia

Future.microtask(() {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Color(ConstantesColorTema2.naraja),
      margin: EdgeInsets.only(
        bottom: 80, // si tienes carrito abajo
        left: 16,
        right: 16,
      ),
      content: Text(
        'Por favor, selecciona al menos $maxSalsas salsas',
        style: TextStyle(color: Colors.white),
      ),
      duration: Duration(seconds: 2),
    ),
  );
});



                         /*   ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Por favor, selecciona al menos $maxSalsas salsas'),
                                     behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
     top: 20,
      left: 16,
      right: 16,
      bottom: MediaQuery.of(context).size.height - 150,
    ),
                                duration: Duration(seconds: 2),
                              ),
                            ); */
                            return; // No continuar con la adición al carrito
                          }

                          final item = Items(
                              nombre: nombre!,
                              descripcion: descripcion,
                              precio: precios,
                              unidades: unidades,
                              image: images,
                              unidadesPedir: cantidad,
                              salsas: salsasSeleccionadas);

                          print('cantidadZZZZZZZZZ $cantidad');
                          final agregado = ref
                              .read(itemsStateNotifier.notifier)
                              .agregarItems(item, productState.id);

                          // Mostrar el diálogo
                          /* showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  (agregado
                      ? '✅ Se añadió exitosamente al carrito'
                      : '⚠️ El producto ya está en el carrito  O ⚠️ Solo puedes agregar productos de un restaurante.\n Vacía el carrito o finaliza tu pedido.'),
                ),
              ],
            ),
          );
        },
      );

      // Cerrar el diálogo después de 2 segundos
      Future.delayed(Duration(seconds: 12), () {
        if (Navigator.canPop(context)) {
          Navigator.of(context).pop(); // Cierra el diálogo después de 2 segundos
        }
      }); */




      
      Future.microtask(() {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Color(ConstantesColorTema2.naraja),
      margin: EdgeInsets.only(
        bottom: 80, // si tienes carrito abajo
        left: 16,
        right: 16,
      ),
      content: Text(agregado
                                    ? '✅ Se añadió exitosamente al carrito'
                                    : '⚠️ El producto ya está en el carrito  O ⚠️ Solo puedes agregar productos de un restaurante.\n  Vacía el carrito o finaliza tu pedido.'),
                            
       
      duration: Duration(seconds: 2),
    ),
  );
});
       
/*
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                behavior: SnackBarBehavior.floating,
             backgroundColor: Color(ConstantesColorTema2.naraja),
                              content: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                                child: Text(agregado
                                    ? '✅ Se añadió exitosamente al carrito'
                                    : '⚠️ El producto ya está en el carrito  O ⚠️ Solo puedes agregar productos de un restaurante.\n  Vacía el carrito o finaliza tu pedido.'),
                              ),
                              duration: Duration(seconds: 2),
                            ),
                          ); */
                          setState(() {
                            _carTaf;
                          });
                          ref.read(cantidadProvider.notifier).state = 1;
                          Navigator.pop(context);
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // El texto "Agregar" siempre visible
                            Text('Agregar',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600, // SemiBold
                                    fontSize: 15,
                                    color: Color(ConstantesColorTema2.blanco))),
                            // El ícono invisible hasta que se presiona
                          ],
                        ),
                      ),
                    ),

                    //
                  ],
                ),

                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
