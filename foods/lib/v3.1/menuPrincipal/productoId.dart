import 'package:flutter/material.dart';

class productoId extends StatefulWidget {

 int? id;
  String? images;
  String? nombre;
  String? descripcion;
  String? precios;

   productoId({ id, images, nombre, descripcion, precios});

  @override
  State<productoId> createState() => 
  _productoIdState( id, images, nombre, descripcion, precios);
}

class _productoIdState extends State<productoId> {

 int? id;
  String? images;
  String? nombre;
  String? descripcion;
  String? precios;

  _productoIdState(id, images, nombre, descripcion, precios);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}