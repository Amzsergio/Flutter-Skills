import 'package:flutter/material.dart';
// Crear un progress indicator **Loader **Style
class ProgressScreen extends StatelessWidget {

  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30),
          Text('Circula progress indicator'),
          SizedBox(height: 10),
          CircularProgressIndicator( strokeWidth: 2, backgroundColor: Colors.black45 ),
          
          SizedBox(height: 20),
          Text('Circular y Linear controlado'),
          SizedBox(height: 10),
          _ControlledProgresIndicator(),

        ],
      ),
    );
  }
}

// con esta clase controlo el porcentaje del loader **Loader **Style
class _ControlledProgresIndicator extends StatelessWidget {
  const _ControlledProgresIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder( // Builder indíca que hay algo que se va a construir en tiempo de ejecución y Stream que va a depender de un Stream. StreamBuilder() **Widget
      stream: Stream.periodic( const Duration( milliseconds: 300 ), (value) {
        return (value * 2) / 100; // 0.0, 1.0
      }).takeWhile((value) => value < 100 ), // Configuro mi stream y takeWhile me indíca cuando detener el stream. //!Un aspecto positivo del stream es su capacidad de hacer automaticamente un dispose y deja de consumer memoria. **Dart
      builder: (context, snapshot) { // UnStreamBuilder no tiene un child sino un builder, el snapshot indica el valor que esta generando el stream. **Dart

        final progressValue = snapshot.data ?? 0; // snapshot.data es el value que me esta generando el stream **Dart

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator( value: progressValue, strokeWidth: 2, backgroundColor: Colors.black12, ),
              const SizedBox(width: 20,),
              Expanded(// Expanded toma todo el espacio del padre le hereda. **Widget 
                child: LinearProgressIndicator(value: progressValue )// LinearProgressIndicator necesita saber que espacio ocupa la linea, si se deja solo dentro de row no hay un límite de ancho del row, por lo que se envuelve en un expanded. **Widget **Loader  // !value sirve para cargar el progreso funciona entre 0 y 1, pero para hacerlo dinamico necesitamos envolver el widget en un StreamBuilder, crear un stream y obtener el valor generado allí, su snapshot.data que es el progressValue.  
              ),
              
            ],
          ),
        );

      },
    );
  }
}