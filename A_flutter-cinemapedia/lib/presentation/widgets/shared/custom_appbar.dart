import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  // Siempre esbueno empezar construyendo un stl widget. **GP
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
        // Para que no estorbe el notch, SafeArea() **Widget
        //Si voy al widget tree puedo ver cuanto espacio ocupa el safeArea **Tools
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Icon(Icons.movie_outlined, color: colors.primary),
                const SizedBox(width: 5),
                Text('Cinemapedia', style: titleStyle),
                const Spacer(), // Es un widget para que el widget se tome todo el espacio disponible, es como flex lay out **Widget **Style
                IconButton(onPressed: () {}, icon: const Icon(Icons.search))
              ],
            ),
          ),
        ));
  }
}
