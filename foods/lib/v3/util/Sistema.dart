import 'package:flutter/material.dart';
import 'package:foods/v3/util/colores.dart';
import 'package:google_fonts/google_fonts.dart';

class Sistema {

  int parsePrecio2(String? precio) {
  if (precio == null) return 0;

  return int.tryParse(
    precio.replaceAll(RegExp(r'[^0-9]'), ''),
  ) ?? 0;
}

int parsePrecio(String? precio) {
   if (precio == null || precio.isEmpty) return 0;

  // 1️⃣ Quédate solo con lo que parece un precio (antes de texto)
  String precios = precio.split('(').first;

  // 2️⃣ Elimina todo menos números
  precio = precios.replaceAll(RegExp(r'[^0-9]'), '');

  return int.tryParse(precio) ?? 0;
}

String formato(int valor) {
  return valor.toString().replaceAllMapped(
    RegExp(r'\B(?=(\d{3})+(?!\d))'),
    (match) => '.',
  );
}

Widget modalEnviarPedido(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(
      bottom: MediaQuery.of(context).viewInsets.bottom,
      left: 16,
      right: 16,
      top: 20,
    ),
    child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 15),

          const Text(
            'Completa tus datos',
           style: TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 20,
   
                                          ),
           // style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 15),

          TextField(
            decoration: InputDecoration(
              labelText: 'Nombre',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          const SizedBox(height: 10),

          TextField(
            decoration: InputDecoration(
              labelText: 'Dirección',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          const SizedBox(height: 10),

          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Método de pago',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            items: const [
              DropdownMenuItem(
                value: 'Efectivo',
                child: Text('Efectivo'),
              ),
              DropdownMenuItem(
                value: 'Tarjeta',
                child: Text('Tarjeta'),
              ),
            ],
            onChanged: (value) {},
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // Aquí luego armas el mensaje y abres WhatsApp
                Navigator.pop(context);
              },
              child: const Text(
                'Confirmar y enviar por WhatsApp',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    ),
  );
}
//
Widget alertDialogEnviarPedido(BuildContext context, VoidCallback accion) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    title: const Text(
      'Completa tus datos',
      style: TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 20,
   
                                          ),// style: TextStyle(fontWeight: FontWeight.bold),
    ),
    content: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Nombre',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          const SizedBox(height: 10),

          TextField(
            decoration: InputDecoration(
              labelText: 'Dirección',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          const SizedBox(height: 10),

          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Método de pago',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            items: const [
              DropdownMenuItem(
                value: 'Efectivo',
                child: Text('Efectivo'),
              ),
              DropdownMenuItem(
                value: 'Tarjeta',
                child: Text('Tarjeta'),
              ),
            ],
            onChanged: (value) {},
          ),
        ],
      ),
    ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Cancelar'),
      ),
      ElevatedButton(
        onPressed: () {
       accion();
          Navigator.pop(context);
        },
        child:  Text('Confirmar',  
        style: GoogleFonts.leckerliOne(
                                  fontSize: 20,
                                  color: Color(ConstantesColorTema2
                                      .naranja2) //Color.fromRGBO(109, 109, 109, 1)

                                  ),),
      ),
    ],
  );
}
//
Widget alertDialogEnviarPedido2(
  BuildContext context,
  void Function(String nombre, String direccion, String metodoPago) accion,
) {
  final TextEditingController nombreCtrl = TextEditingController();
  final TextEditingController direccionCtrl = TextEditingController();
  String metodoPago = 'Efectivo';

  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    title: const Text(
      'Completa tus datos',
       style: TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 20,
   
                                          ),//style: TextStyle(fontWeight: FontWeight.bold),
    ),
    content: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nombreCtrl,
            decoration: InputDecoration(
              labelText: 'Nombre',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          const SizedBox(height: 10),

          TextField(
            controller: direccionCtrl,
            decoration: InputDecoration(
              labelText: 'Dirección',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          const SizedBox(height: 10),

          DropdownButtonFormField<String>(
            value: metodoPago,
            decoration: InputDecoration(
              labelText: 'Método de pago',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            items: const [
              DropdownMenuItem(value: 'Efectivo', child: Text('Efectivo')),
              DropdownMenuItem(value: 'Tarjeta', child: Text('Tarjeta')),
            ],
            onChanged: (value) {
              metodoPago = value ?? 'Efectivo';
            },
          ),
        ],
      ),
    ),
    actions: [
      TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll<Color>(Color(0xFFF36B21)), //Colors(ConstantesColorTema2.naranja2)
        ),
        onPressed: () => Navigator.pop(context),
        child:  Text('Cancelar',
        style: TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 20,
    color: Color(ConstantesColorTema2.blanco) 
                                          ),
        ),
      ),
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll<Color>(Color(0xFFF36B21)), //Colors(ConstantesColorTema2.naranja2)
        ),
        onPressed: () {
          accion(
            nombreCtrl.text.trim(),
            direccionCtrl.text.trim(),
            metodoPago,
          );
          Navigator.pop(context);
        },
        child:  Text('Confirmar',
        style: TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 20,
    color: Color(ConstantesColorTema2.blanco) 
                                          ),
        /* GoogleFonts.leckerliOne(
                                  fontSize: 20,
                                  color: Color(ConstantesColorTema2
                                      .naranja2) //Color.fromRGBO(109, 109, 109, 1)

                                  ), */),
      ),
    ],
  );
}



}