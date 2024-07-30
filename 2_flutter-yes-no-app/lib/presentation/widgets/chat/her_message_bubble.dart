import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hola Mundo',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),

        _ImageBubble(),

        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // return const Placeholder() //!El widget Placeholder() sirve para mostrar el espacio que esta siedon asignado por defecto. **Widget

    final size = MediaQuery.of(context).size; // !ajustar con mediaQuery **Style
    // print(size) //! imprimir las dimensiones de un dispositivo **Debug

    return ClipRRect( // !Widget que permite redondear bordes  **Widget
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          'https://yesno.wtf/assets/no/20-56c4b19517aa69c8f7081939198341a4.gif',
          width: size.width * 0.7, // !ajustar con mediaQuery **Style
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {// !loading para imagenes **Style
            if (loadingProgress == null) return child;

            return Container(
              width: size.width * 0.7,
              height: 150, // Estas medidas son las mismas de arriba para que se respete las medidas mientras esta cargando **AppExp
              padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 5),
              child: const Text('Mi amor está enviando una imagen'),
            );
          },
        ));// !practticar diferentes LoadingBuilder: https://api.flutter.dev/flutter/widgets/ImageLoadingBuilder.html **practice
  }
}
