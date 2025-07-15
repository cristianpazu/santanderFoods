import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/v2/presentation/notifiers/Restaurante_notifiers/restaurante_notifier.dart';
import 'package:foods/widgets/MenuWidget.dart';

class Restautantesprincipales extends ConsumerStatefulWidget {
  const Restautantesprincipales({super.key});

  @override
 _RestautantesprincipalesState createState() => _RestautantesprincipalesState();
}

class _RestautantesprincipalesState extends ConsumerState {

@override
  void initState() {
        super.initState();
 
 ref.read(restauranteProvider.notifier).loadRestaurante();
  }

  @override
  Widget build(BuildContext context) {

final restaurantes =  ref.read(restauranteProvider);

print(restaurantes.restaurantes!.length);

    return MenuWidget(
    Container()
    );
  }
}