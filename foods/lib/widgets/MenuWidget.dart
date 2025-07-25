import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/UI/atoms/textFiled.dart';
import 'package:foods/Utils/ConstantesColor.dart';
import 'package:foods/v2/presentation/notifiers/items_notifiers/item_state_notifiers.dart';
import 'package:foods/v2/screen/item/CarritoPage.dart';

class MenuWidget extends ConsumerWidget {
  Widget child;
  MenuWidget(this.child);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController _searchController = TextEditingController();
    final cantidadEnCarrito = ref.watch(itemsStateNotifier).length;
    return Scaffold(
      backgroundColor: Color(ConstantesColorTema.fondoColorAppbar),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Container(
                  height: 50,
                  width: 25,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Center(
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
  Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back_rounded)),
                  ),
                ),
              ),
              //--
      
              Container(
                  child: Padding(
                padding: const EdgeInsets.only(right: 10, top: 30),
                child: Container(
                  height: 50,
                  width: 25,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5, top: 1),
                    child: InkWell(
                      onTap: () {
                        print('Carrito icon pressed');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CarritoPage(),
                            ));
                      },
                      child: Stack(
                        children: [
                          Positioned(
                              child: Container(
                            width: 20,
                            height: 16,
                            color: Colors.amber,
                            child: Center(child: Text('$cantidadEnCarrito')),
                          )),
                          Center(
                            child: Icon(Icons.shopping_cart_outlined),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ))
      
              //--
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Textfields2(
              controller: _searchController,
              onChanged: (value) {},
              texto: '',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
