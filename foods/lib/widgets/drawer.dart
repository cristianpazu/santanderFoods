import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [

          SizedBox(height: 10,),
          CircleAvatar(
            radius: 100,
            backgroundColor: Colors.amber, // color de fondo
            child: Text(
              'f', // iniciales
              style: GoogleFonts.leckerliOne(
                  fontSize: 50, color: Color.fromRGBO(109, 109, 109, 1)),
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child: Text('Foods',style: GoogleFonts.leckerliOne(
                    fontSize: 50, color: Color.fromRGBO(109, 109, 109, 1)),),
          ),

      Spacer(),

          // Aquí agregamos el texto al final
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Desarrollado por Tu Nombre',  // Aquí puedes poner tu nombre o el de tu empresa
                style: GoogleFonts.leckerliOne(
                    fontSize: 16, color: Color.fromRGBO(109, 109, 109, 1)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
