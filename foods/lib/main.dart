import 'package:flutter/material.dart';
import 'package:foods/UI/screens/splashs/splash_screen.dart';
import 'package:foods/v2/menu/menu.dart';

import 'v2/headers/headers_curvo_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:  ThemeData(
        brightness: Brightness.light, 
        useMaterial3: true, 
      ),
      debugShowCheckedModeBanner: false,
    
      home: menuHome()/*
      Container(
        color: Colors.white,
        child: HomeWidget(
        height: double.infinity,
        childs: Container(),
            ),
      ) */
      //const SplashScreen(),
    );
  }
}

