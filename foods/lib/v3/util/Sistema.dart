import 'package:flutter/material.dart';

class Sistema {

  int parsePrecio(String? precio) {
  if (precio == null) return 0;

  return int.tryParse(
    precio.replaceAll(RegExp(r'[^0-9]'), ''),
  ) ?? 0;
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
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
      style: TextStyle(fontWeight: FontWeight.bold),
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
        child: const Text('Confirmar'),
      ),
    ],
  );
}


}