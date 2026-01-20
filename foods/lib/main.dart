import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/UI/screens/splashs/splash.dart';
import 'package:foods/UI/screens/splashs/splash_screen.dart';
import 'package:foods/v2/menu/menu.dart';
import 'package:foods/v2/screen/comidas_Rapidas/comidas_Rapidas.dart';
import 'package:foods/v2/screen/item/CarritoPage.dart';
import 'package:foods/v2/screen/restaurantesPrincipales/DetalleComida.dart';
import 'package:foods/v2/screen/restaurantesPrincipales/RestautantesPrincipales.dart';
import 'package:foods/v2/screen/restaurantesPrincipales/MenuComidas.dart';
import 'package:foods/v3/screen/menu.dart';
import 'package:foods/widgets/MenuWidget.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'v2/headers/headers_curvo_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        theme:  ThemeData(
          brightness: Brightness.light, 
          useMaterial3: true, 
        ),
        debugShowCheckedModeBanner: false,
      
        home: //ComidasRapidas() 
        MenuResponsive()
      // MenuPage()
       //MyShopPage()
        /*
        Container(
          color: Colors.white,
          child: HomeWidget(
          height: double.infinity,
          childs: Container(),
              ),
        ) */
        //const SplashScreen(),
      ),
    );
  }
}

class MenuResponsive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => ResponsiveBreakpoints.builder(
/*
        BouncingScrollWrapper.builder(context, widget!),
        mediaQueryData: MediaQuery.of(context).copyWith(
          textScaler: TextScaler.noScaling,
        ),
        defaultScale: true,
        maxWidth: 1200, */
        breakpoints: [
          /*
          const Breakpoint(start: 0, end:    450, name: MOBILE),
          const Breakpoint(start: 451, end:    800, name: TABLET),
          const Breakpoint(start: 801,    end:1000, name: TABLET),
          const Breakpoint(start: 1001,   end:1200, name: DESKTOP),
          const Breakpoint(start: 1201,   end:2460, name: "4K"), */
        const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
        child: widget!,
      ),
      home: MenuPage(1)
      // CarritoPage()
      // Menucomidas(),
         //Restautantesprincipales(), 
      
     // menuHome(),
    );
  }
} 

