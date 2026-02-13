import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/Utils/ConstantesColor.dart';
import 'package:foods/v2/domain/entities/comidas_rapidas/Salsa.dart';
import 'package:foods/v3/entities/items.dart';
import 'package:foods/v3/presentation/notifiers/comida_rapida_notifiers/nombre_comida_2_notifiers.dart';
import 'package:foods/v3/presentation/notifiers/items_notifiers/cantidad_provider.dart';
import 'package:foods/v3/util/colores.dart';

import '../v3/presentation/notifiers/items_notifiers/item_state_notifiers.dart';

class ModalEditFood extends StatefulWidget {
  final List<Salsa>? salsasSeleccionadas;
  final List<Salsa>? salsasDisponibles;

  ModalEditFood(this.salsasSeleccionadas, this.salsasDisponibles);

  @override
  _ModalEditFoodState createState() => _ModalEditFoodState();
}

class _ModalEditFoodState extends State<ModalEditFood> {
//final Map<int, bool> _salsasSeleccionadas = {};
/*
  @override
  void initState() {
    super.initState();

  for (final salsa in widget.salsas!) {
      _salsasSeleccionadas[salsa.id!] = true;
    }
  } */

  late List<bool> _salsasSeleccionadas;

  @override
  void initState() {
    super.initState();
    // Iniciamos la lista de salsas seleccionadas con el valor true o false dependiendo si la salsa ya está seleccionada.
    _salsasSeleccionadas = widget.salsasDisponibles!
        .map((salsa) => widget.salsasSeleccionadas!.contains(salsa))
        .toList();
  }

  // Método para manejar el cambio de estado (seleccionar/desmarcar)
  void _toggleSalsaSelection(int index) {
    setState(() {
      _salsasSeleccionadas[index] = !_salsasSeleccionadas[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

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

/*
   final int maxSalsas = nombresMax5.contains(nombre) 
    ? 5 
    : (nombresMax3.contains(nombre) ? 3 : 0); */

/*
    final Widget salsaWidget =
        widget.salsas != null && widget.salsas!.isNotEmpty
            ?*/
    final Widget salsaWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selecciona hasta 2 salsas:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
            childAspectRatio: 4, // ancho/alto de cada item, para que quede bien
            children: widget.salsasDisponibles!.asMap().entries.map((entry) {
              final index = entry.key;
              final nombres = entry.value;

              return CheckboxListTile(
                activeColor: Color(ConstantesColorTema2
                    .naranja2), // color del check cuando está activo
                checkColor: Color(ConstantesColorTema2.blanco),
                contentPadding: EdgeInsets.zero,
                title: Text(nombres.nombre ?? '', //'Nombre del resurante',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600, // SemiBold
                        fontSize: 15,
                        color: Color(0xFF2B2B2B))), //Text(nombre),
                value: _salsasSeleccionadas[index],
                onChanged: (selected) {
                  //  final yaSeleccionada =
                  _toggleSalsaSelection(index);
                },
              );
            }).toList(),
          ),

          
        ),
         const SizedBox(height: 16),
           ElevatedButton(
                  onPressed: () {
                    // Al hacer click en guardar, devuelve las salsas seleccionadas
                    List<Salsa> salsasSeleccionadasFinal = [];
                    for (int i = 0; i < _salsasSeleccionadas.length; i++) {
                      if (_salsasSeleccionadas[i]) {
                        salsasSeleccionadasFinal.add(widget.salsasDisponibles![i]);
                      }
                    }

                    Navigator.pop(context, salsasSeleccionadasFinal); // Devuelve las salsas seleccionadas
                  },
                  child: Text('Guardar'),
                ),
      ],
    );
    // : const SizedBox.shrink();

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
                    const SizedBox(width: 15),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [salsaWidget],
                    ))
                  ],
                ),
                //

                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
