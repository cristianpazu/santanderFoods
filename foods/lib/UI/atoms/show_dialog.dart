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
    final Map<String, String> horarios; 
  

  Dialogs(this.horarios);

  Future<void> calendarios(context) async {
    print('object');
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('CALENDARIO DE APERTURA'),
          content: SingleChildScrollView(
              child: Column(
              children: horarios.entries.map((entry) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(entry.key, style: TextStyle(fontWeight: FontWeight.bold)), // Día
                    Text(entry.value), // Horario
                  ],
                );
              }).toList(),
              )
          ),
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
                children: [Container(
                  color: Colors.amber,
                  width: 200,
                  child: Text('direccion: $direccion', maxLines: 2,))],
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

//informacion de la comida
class InformacionComidaDialogos {
  String? nombre;
  String? direccion;
  String? telefono;

  InformacionComidaDialogos(this.nombre, this.direccion, this.telefono);

  Future<void> informacionComida(context) async {
    
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
  title: Text(nombre!),
  content: SingleChildScrollView(
    child: Container(
      width: double.infinity, // Toma todo el ancho disponible
      child: Stack(
        children: [
          Container(
            height: 10,
            width: 10,
            color: Colors.amber,
          ),
        ],
      ),
    ),
  ));
  
         /*AlertDialog(
          title: Text(nombre!),
          content: SingleChildScrollView(
              child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: 10,
                color: Colors.amber,
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
        );*/
      },
    );
  }
}
