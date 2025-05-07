import 'package:flutter/material.dart';
import 'package:foods/UI/screens/splashs/splash_screen.dart';

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
    
      home: const SplashScreen(),
    );
  }
}

