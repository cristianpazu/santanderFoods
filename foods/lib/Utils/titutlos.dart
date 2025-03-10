import 'package:flutter/material.dart';
import 'package:foods/Utils/ConstantesColor.dart';
import 'package:google_fonts/google_fonts.dart';

class UiTexto{
 
  final String? texto;
  final String? tamanioTexto;
  final Color? colorTexto;
  final TextAlign? alineacionTexto;
  final TextOverflow? overflow;
  final int? maxLines;

  UiTexto({
    required this.texto,
    this.tamanioTexto,
    this.colorTexto,
    this.alineacionTexto,
    this.overflow,
    this.maxLines,
  });

  double selecionarTamanioTexto(tamanioTexto) {
    double tamanio = 17;
    switch (tamanioTexto) {
      case "xs":
        tamanio = 14;
        break;

      case "sm":
        tamanio = 17;
        break;

      case "md":
        tamanio = 20;
        break;

      case "lg":
        tamanio = 24;
        break;
    }

    return tamanio;
  }

  Widget textoRobotoBold() {
    return Text(
      texto ?? '',
      style: TextStyle(
          fontSize: selecionarTamanioTexto(tamanioTexto),
          color: colorTexto ?? const Color(ConstantesColorTema.azulLetras),
          fontFamily: 'Roboto-Bold'),
      textAlign: alineacionTexto ?? TextAlign.left,
      overflow: overflow ?? TextOverflow.visible,
      maxLines: maxLines,
    );
  }

  Widget textoRobotoLight() {
    return Text(
      texto ?? '',
      style: TextStyle(
          fontSize: selecionarTamanioTexto(tamanioTexto),
          color: colorTexto ?? const Color(ConstantesColorTema.azulLetras),
          fontFamily: 'Roboto-Light'),
      textAlign: alineacionTexto ?? TextAlign.left,
      overflow: overflow ?? TextOverflow.visible,
      maxLines: maxLines,
    );
  }

  Widget textoRobotoRegular() {
    return Text(
      texto ?? '',
      style: TextStyle(
          fontSize: selecionarTamanioTexto(tamanioTexto),
          color: colorTexto ?? const Color(ConstantesColorTema.azulLetras),
          fontFamily: 'Roboto-Regular'),
      textAlign: alineacionTexto ?? TextAlign.left,
      overflow: overflow ?? TextOverflow.visible,
      maxLines: maxLines,
    );
  }

  Widget textoRobotoMedium() {
    return Text(
      texto ?? '',
      style: TextStyle(
          fontSize: selecionarTamanioTexto(tamanioTexto),
          color: colorTexto ?? const Color(ConstantesColorTema.azulLetras),
          fontFamily: 'Roboto-Medium'),
      textAlign: alineacionTexto ?? TextAlign.left,
      overflow: overflow ?? TextOverflow.visible,
      maxLines: maxLines,
    );
  }

  Widget textoRutas(
    FontWeight? fontWeight,
  ) {
    return Text(texto ?? '',
        style: TextStyle(
            fontFamily: 'Roboto-Medium',
            fontSize: 16,
            color: Colors.black,
            fontWeight: fontWeight));
  }

  Widget textoRobotoLight2() {
    return Text(
      texto ?? '',
      style: GoogleFonts.monomaniacOne(fontSize: 18),
      textAlign: alineacionTexto ?? TextAlign.left,
      overflow: overflow ?? TextOverflow.visible,
      maxLines: maxLines,
    );
  }
}
 