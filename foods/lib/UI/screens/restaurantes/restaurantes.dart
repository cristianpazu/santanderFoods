import 'package:flutter/material.dart';
import 'package:foods/UI/atoms/card_widget.dart';
import 'package:foods/UI/atoms/show_dialog.dart';
import 'package:foods/UI/atoms/textfield.dart';
import 'package:foods/UI/screens/restaurantes/menu_restaurantes/menu_restaurtantes.dart';
import 'package:foods/Utils/titutlos.dart';

class Restaurantes extends StatelessWidget {
  const Restaurantes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xC4411DDB),
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(120))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0, 4),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Textfields(
                  texto: 'Buscar restaurantes....',
                ),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      cardWidget2(
                       redireccionamiento:Menu_restaurantes(),
                        colors: Color(0xFFF6F6),
                        altura: 210,
                        image: Image.asset(
                          'assets/solar.jpeg',
                          fit: BoxFit.contain,
                        ),
                        texto: 'SOLAR',
                        icon2: IconButton(onPressed: (){
                          
                          Dialogs('HORARIOS','Cerrado' ,'	11:30 a.m a 10p. m' ,' 11:30a.m. a 10p. m' ,'	11:30a.m a 10p.m','	11:30 a.m a 10p.m','	11:30a.m a 10p.m','	11:30a.m a 10p.m').calendarios(context);
                        }, icon: Icon(Icons.calendar_month_outlined)),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      cardWidget2(
                        colors: Color(0xFFF6F6),
                        altura: 210,
                        image: Image.asset(
                          'assets/casape.png',
                          fit: BoxFit.contain,
                        ),
                        texto: 'C. de \n Pedro',
                        icon2: IconButton(onPressed: (){}, icon: Icon(Icons.calendar_month_outlined)),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
