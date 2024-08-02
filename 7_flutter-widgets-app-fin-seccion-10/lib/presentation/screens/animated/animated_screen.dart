import 'dart:math' show Random; // Esto es una libreia especial de Dart para generar operaciones matemáticas. **Dart
import 'package:flutter/material.dart';
// Animated screen es un widget que puede ser animado **Animations 
class AnimatedScreen extends StatefulWidget {

  static const name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape() {

    final random = Random();

    width = random.nextInt(300) + 120; // esto es para generar random enteros , al azar. **Dart
    height = random.nextInt(300) + 120;
    borderRadius = random.nextInt(100) + 20;
    
    color = Color.fromRGBO( // Random Colors **Dart **Practice
      random.nextInt(255),  // red
      random.nextInt(255),  // green
      random.nextInt(255),  // blue
      1 // opacity
    ); 
    setState(() {});

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),

      body: Center(
        child: AnimatedContainer(// Este es el contenedor animado AnimatedContainer **Widget **Animations **Practice
          duration: const Duration( milliseconds: 400 ),
          curve: Curves.elasticOut, //Es para que tenga un efecto de rebote. Cruvers() **Widget **Animation
          width: width <= 0 ? 0 : width, // Esto es un condicional para manejar que en caso que el entero sea muy pequeño y por el efecto de elasticOut llegue a ser negativo, entonces el valor mínimo sea 0. **AppExp **Dart
          height: height <= 0 ? 0 : height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius < 0 ? 0 : borderRadius)
          ),
        ),
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon( Icons.play_arrow_rounded ),
      ),
    );
  }
}