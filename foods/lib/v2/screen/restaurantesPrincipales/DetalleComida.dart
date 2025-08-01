import 'package:flutter/material.dart';
import 'package:foods/Utils/ConstantesColor.dart';
import 'package:foods/Utils/tarjetasInfoMenu.dart';
import 'package:foods/Utils/titutlos.dart';
import 'package:foods/widgets/TarjetainfoComida.dart';

class Detallecomida extends StatefulWidget {
  String images;
  String nombreComida;
  String descripcion;
  final List<Map<String, dynamic>>? salsas;
  String valor;
 final Widget Function(List<String>) agregarComida;

  Detallecomida(this.images, this.nombreComida, this.descripcion, this.salsas,
      this.valor, this.agregarComida);

  @override
  State<Detallecomida> createState() => _DetallecomidaState();
}

class _DetallecomidaState extends State<Detallecomida> {
  final Map<int, bool> _salsasSeleccionadas = {};

  int get cantidadSeleccionadas =>
      _salsasSeleccionadas.values.where((v) => v).length;

  @override
  Widget build(BuildContext context) {


final salsasSeleccionadas = widget.salsas
            ?.where((salsa) => _salsasSeleccionadas[salsa['id']] ?? false)
            .map((salsa) => salsa['nombre'].toString())
            .toList() ??
        [];

    final Widget salsaWidget = widget.salsas != null &&
            widget.salsas!.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Selecciona hasta 5 salsas:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                    color: Color(ConstantesColorTema.fondoColorAppbar),
                    borderRadius: BorderRadius.circular(5)),
                height: 200, // ajusta según necesites
                child: GridView.count(
                  physics:
                      NeverScrollableScrollPhysics(), // para que no se pueda hacer scroll dentro del Grid
                  crossAxisCount: 2, // dos columnas
                  childAspectRatio:
                      4, // ancho/alto de cada item, para que quede bien
                  children: widget.salsas!.map((salsa) {
                    final id = salsa['id'] as int;
                    final nombre = salsa['nombre'] as String;

                    return CheckboxListTile(
                      activeColor:
                          Colors.white, // color del check cuando está activo
                      checkColor: Color(ConstantesColorTema.fondoColorAppbar),
                      contentPadding: EdgeInsets.zero,
                      title: UiTexto(texto: nombre)
                          .textoRobotoLight6(), //Text(nombre),
                      value: _salsasSeleccionadas[id] ?? false,
                      onChanged: (selected) {
                        final yaSeleccionada =
                            _salsasSeleccionadas[id] ?? false;
                        if (!yaSeleccionada && cantidadSeleccionadas >= 5) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Solo puedes seleccionar hasta 5 salsas'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          return;
                        }

                        setState(() {
                          _salsasSeleccionadas[id] = selected ?? false;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          )
        : const SizedBox.shrink();

    return Scaffold(
      body: Column(
        children: [
          TarjetainfoComida(
              widget.images,
              widget.nombreComida,
              widget.descripcion,
              salsaWidget ?? Container(),
              widget.valor,
              () => widget.agregarComida(salsasSeleccionadas),
              ),
        ],
      ),
    );
  }
}
