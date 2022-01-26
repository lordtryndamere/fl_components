import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.indigo;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  void changeValuesContainer() {
    final random = Random(); //Generador de numero aleatorio

    _width =
        random.nextInt(300).toDouble() + 50; //Genera numero aleatorio positivo
    _height = random.nextInt(300).toDouble() + 50;
    _color = Color.fromRGBO(
        random.nextInt(266), random.nextInt(256), random.nextInt(256), 1);
    _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble() + 8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Containar'),
      ),
      body: Center(
        // Contenedor para animar propiedades
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInCubic,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            changeValuesContainer();
          });
        },
        child: const Icon(
          Icons.play_circle_fill_outlined,
          size: 35,
        ),
      ),
    );
  }
}
