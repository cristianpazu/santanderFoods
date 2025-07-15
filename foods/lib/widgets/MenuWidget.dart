import 'package:flutter/material.dart';
import 'package:foods/UI/atoms/textFiled.dart';
import 'package:foods/Utils/ConstantesColor.dart';

class MenuWidget extends StatelessWidget {
  Widget child;
   MenuWidget(this.child);

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    return Scaffold(
      backgroundColor: Color(ConstantesColorTema.fondoColorAppbar),
      body: Column(
        children: [
          Row(
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
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back_rounded)),
                  ),
                ),
              ),
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
                  topRight: Radius.circular(40)
                )
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
