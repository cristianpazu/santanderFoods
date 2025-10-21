import 'package:flutter/material.dart';
import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';

class MyShopPage extends StatefulWidget {
  @override
  _MyShopPageState createState() => _MyShopPageState();
}

class _MyShopPageState extends State<MyShopPage> {
  late Function(GlobalKey) runAddToCartAnimation;
  final GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();

  @override
  Widget build(BuildContext context) {
    return AddToCartAnimation(
      cartKey: cartKey,
      height: 30,
      width: 30,
      opacity: 0.85,
      dragAnimation: const DragToCartAnimationOptions(
        rotation: true,
      ),
      createAddToCartAnimation: (addToCartAnimationMethod) {
        runAddToCartAnimation = addToCartAnimationMethod;
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            AddToCartIcon(
              key: cartKey,
              icon: Icon(Icons.shopping_cart),
              badgeOptions: BadgeOptions(
                active: true,
                backgroundColor: Colors.orange,
              ),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            GlobalKey imageKey = GlobalKey();
            return ListTile(
              title: Text('Producto $index'),
              trailing: Container(
                key: imageKey,
                child: GestureDetector(
                  onTap: () {
                    runAddToCartAnimation(imageKey);
                  },
                  child: Icon(Icons.add_circle, color: Colors.orange, size: 32),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
} 