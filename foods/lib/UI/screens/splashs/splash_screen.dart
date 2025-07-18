import 'package:flutter/material.dart';
import 'package:foods/UI/screens/menu/menu.dart';
import 'package:foods/v2/headers/headers_curvo_splash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _ScreenState();
}

class _ScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    var duration = const Duration(seconds: 4);
    Future.delayed(duration, () {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return Menu();
        },
      ), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return HomeWidget(
      height: double.infinity,
      childs: Container(),
    );
    /* Scaffold(
        body: Container(
      color: const Color.fromRGBO(50, 30, 124, 5),
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/santanderplacesimg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    )); */
  }
}
