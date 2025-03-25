import 'package:flutter/material.dart';

/*
class dialogs extends StatelessWidget {
  const dialogs({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('data')
    );
  }
}*/
class Dialogs {
  String? titulos;
  String? titulos1;
  String? titulos2;
  String? titulos3;
  String? titulos4;
  String? titulos5;
  String? titulos6;
  String? titulos7;

  Dialogs(this.titulos, this.titulos1, this.titulos2, this.titulos3,
      this.titulos4, this.titulos5, this.titulos6, this.titulos7);

  Future<void> calendarios(context) async {
    print('object');
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulos!),
          content: SingleChildScrollView(
              child: Column(
            children: [
              Row(
                children: [Text('Lunes: $titulos1')],
              ),
              Row(
                children: [Text('Martes: $titulos2')],
              ),
              Row(
                children: [Text('Miercoles: $titulos3')],
              ),
              Row(
                children: [Text('Jueves: $titulos4')],
              ),
              Row(
                children: [Text('Viernes: $titulos5')],
              ),
              Row(
                children: [Text('Sabado: $titulos6')],
              ),
              Row(
                children: [Text('Domingo: $titulos7')],
              )
            ],
          )),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
            ),
          ],
        );
      },
    );
  }
}

//
class InformacionDialogos {
  String? nombre;
  String? direccion;
  String? telefono;

  InformacionDialogos(this.nombre, this.direccion, this.telefono);

  Future<void> informacion(context) async {
    
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(nombre!),
          content: SingleChildScrollView(
              child: Column(
            children: [
              Row(
                children: [Text('direccion: $direccion')],
              ),
              Row(
                children: [Text('telefono: $telefono')],
              ),
            ],
          )),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
            ),
          ],
        );
      },
    );
  }
}
