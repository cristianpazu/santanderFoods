import 'package:flutter/material.dart';
import 'package:foods/UI/screens/menu/menu.dart';
import 'package:foods/v2/headers/headers_curvo_splash.dart';
import 'package:foods/v2/menu/menu.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _ScreenState();
}

class _ScreenState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    var duration = const Duration(seconds: 4);
    Future.delayed(duration, () {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return menuHome();
        },
      ), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:HomeWidget(
         height: double.infinity,
        childs: Container(),
          )
    );
  }
}
